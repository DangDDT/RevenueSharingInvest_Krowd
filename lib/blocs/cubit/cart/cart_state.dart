part of 'cart_cubit.dart';

enum CartStatus {
  initial,
  loading,
  inputing,
  processing,
  success,
  failure,
}

class CartState extends Equatable {
  final CartStatus status;
  final Package? selectedPackage;
  final ProjectDetail? selectedProject;
  final String? quantityPackageToOrderString;
  final num? quantityPackageToOrderInt;
  final num totalPrice;
  final bool isValid;
  final String? errorString;
  final Wallet? walletBalance;
  const CartState({
    this.status = CartStatus.initial,
    this.selectedPackage,
    this.selectedProject,
    this.quantityPackageToOrderString,
    this.quantityPackageToOrderInt,
    this.totalPrice = 0,
    this.isValid = false,
    this.errorString,
    this.walletBalance,
  });
  CartState copyWith(
      {CartStatus? status,
      Package? selectedPackage,
      ProjectDetail? selectedProject,
      String? quantityPackageToOrderString,
      num? quantityPackageToOrderInt,
      num? totalPrice,
      bool? isValid,
      String? errorString,
      Wallet? walletBalance}) {
    return CartState(
      status: status ?? this.status,
      selectedPackage: selectedPackage ?? this.selectedPackage,
      selectedProject: selectedProject ?? this.selectedProject,
      quantityPackageToOrderString:
          quantityPackageToOrderString ?? this.quantityPackageToOrderString,
      quantityPackageToOrderInt:
          quantityPackageToOrderInt ?? this.quantityPackageToOrderInt,
      totalPrice: totalPrice ?? this.totalPrice,
      isValid: isValid ?? this.isValid,
      errorString: errorString,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedPackage,
        selectedProject,
        quantityPackageToOrderString,
        quantityPackageToOrderInt,
        totalPrice,
        isValid,
        errorString,
        walletBalance
      ];
}
