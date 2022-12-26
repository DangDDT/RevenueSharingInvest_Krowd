import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final Repository repository = new Repository();
  WalletCubit() : super(const WalletState(walletList: []));
  Future<void> loadWallets() async {
    emit(state.copyWith(status: WalletStatus.loading));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_totalAsset_listWallet = await repository.fetchWallets();
      final totalAsset = tuple2_totalAsset_listWallet.item1;
      final walletList = tuple2_totalAsset_listWallet.item2;
      emit(
        state.copyWith(
          status: WalletStatus.success,
          totalAsset: totalAsset,
          walletList: walletList,
          currentWalletIndex: state.currentWalletIndex ?? 0,
          currentWallet: state.currentWallet ?? walletList![0],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  Future<void> onChangeWalletView(int index) async {
    emit(
      state.copyWith(
        currentWalletIndex: index,
        currentWallet: state.walletList[index],
      ),
    );
  }
}
