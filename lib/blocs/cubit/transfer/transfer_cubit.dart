import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  final Repository repository = new Repository();
  TransferCubit() : super(TransferState());
  init() {
    emit(TransferState());
  }

  void onTransferValueChange(String value) {
    final transferValueString = value != "" ? value : "0";
    final transferValueInt = int.parse(transferValueString.replaceAll(",", ""));
    emit(state.copyWith(
      status: TransferStatus.inputing,
      transferValueString: transferValueString,
      transferValueInt: transferValueInt,
    ));
  }

  Future<void> onTransferWallet(num amount) async {
    emit(state.copyWith(status: TransferStatus.loading));
    final context = Global.useContext()!;
    final walletState = BlocProvider.of<WalletCubit>(context).state;
    final fromWalletId = walletState.currentWallet!.id;
    String toWalletId = "";
    if (walletState.currentWallet!.walletType!.name == "Ví thu tiền") {
      toWalletId = walletState.walletList[1].id;
    } else {
      toWalletId = walletState.walletList[4].id;
    }
    try {
      final res = await repository.transfer(fromWalletId, toWalletId, amount);
      if (res == null) {
        emit(state.copyWith(
            status: TransferStatus.success,
            transferStatus: false,
            transferRes: res));
      } else {
        emit(state.copyWith(
            status: TransferStatus.success,
            transferStatus: true,
            transferRes: res));
      }
    } catch (e) {
      emit(state.copyWith(status: TransferStatus.failure));
    } finally {
      BlocProvider.of<WalletCubit>(context)..loadWallets();
    }
  }
}
