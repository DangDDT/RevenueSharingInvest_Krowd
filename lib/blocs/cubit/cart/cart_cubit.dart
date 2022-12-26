import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';
import 'package:rsi/router/router_constants.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Repository repository = new Repository();
  CartCubit() : super(const CartState());

  init(Package selectedPackage, ProjectDetail selectProject) {
    emit(CartState(
        selectedPackage: selectedPackage, selectedProject: selectProject));
  }

  Future<void> fetchWalletBallance() async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_totalAsset_listWallet = await repository.fetchWallets();
      final walletList = tuple2_totalAsset_listWallet.item2;
      final walletBalance = walletList!.elementAt(1);
      emit(
        state.copyWith(
          status: CartStatus.success,
          walletBalance: walletBalance,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  void onQuantityPackageChange(String value) {
    final quantityPackageToOrderString = value != "" ? value : "0";
    final quantityPackageToOrderInt =
        num.parse(quantityPackageToOrderString.replaceAll(",", ""));
    final totalPrice = quantityPackageToOrderInt * state.selectedPackage!.price;
    final errorString = validationString(quantityPackageToOrderInt);
    final isValid = quantityPackageToOrderInt > 0 && errorString == null;
    emit(state.copyWith(
      status: CartStatus.inputing,
      quantityPackageToOrderString: quantityPackageToOrderString,
      quantityPackageToOrderInt: quantityPackageToOrderInt,
      totalPrice: totalPrice,
      errorString: errorString,
      isValid: isValid,
    ));
  }

  String? validationString(num quantityPackageToOrderInt) {
    if (quantityPackageToOrderInt >= state.selectedPackage!.remainingQuantity)
      return "Số lượng gói bạn mua vượt quá số lượng gói còn lại";
    if (quantityPackageToOrderInt * state.selectedPackage!.price >
        state.walletBalance!.balance!) {
      return "Số tiền trong ví không đủ để thực hiện giao dịch";
    }
    return null;
  }

  Future<void> onSubmit(
      String projectId, String packageId, num quantity) async {
    final context = Global.useContext()!;
    context.loaderOverlay.show();
    final investmentPost = new InvestmentRequestPost(
        projectId: projectId, packageId: packageId, quantity: quantity);
    context.read<InvestmentCubit>()
      ..init(investmentPost)
      ..postInvestment().whenComplete(
        () {
          context.loaderOverlay.hide();
          Navigator.pushReplacementNamed(
            context,
            investmentStatusRoute,
          );
        },
      );
  }

  void onTopup() {
    final context = Global.useContext()!;
    Navigator.pushNamed(
      context,
      topupRoute,
    );
  }
}
