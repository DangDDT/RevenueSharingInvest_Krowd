part of 'wallet_cubit.dart';

enum WalletStatus {
  initial,
  loading,
  success,
  failure,
}

class WalletState extends Equatable {
  final WalletStatus status;
  final double? totalAsset;
  final List<Wallet> walletList;
  final int? currentWalletIndex;
  final Wallet? currentWallet;

  const WalletState({
    this.status = WalletStatus.initial,
    required this.walletList,
    this.totalAsset,
    this.currentWalletIndex,
    this.currentWallet,
  });
  WalletState copyWith({
    WalletStatus? status,
    List<Wallet>? walletList,
    double? totalAsset,
    int? currentWalletIndex,
    Wallet? currentWallet,
  }) {
    return WalletState(
      status: status ?? this.status,
      walletList: walletList ?? this.walletList,
      totalAsset: totalAsset ?? this.totalAsset,
      currentWalletIndex: currentWalletIndex ?? this.currentWalletIndex,
      currentWallet: currentWallet ?? this.currentWallet,
    );
  }

  @override
  List<Object?> get props => [
        status,
        walletList,
        totalAsset,
        currentWalletIndex,
        currentWallet,
      ];
}
