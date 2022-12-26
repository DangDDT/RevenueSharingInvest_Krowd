import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/withdraw/index.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';

part 'withdraw_request_state.dart';

class WithdrawRequestCubit extends Cubit<WithdrawRequestState> {
  final Repository repository = new Repository();
  WithdrawRequestCubit()
      : super(const WithdrawRequestState(withdrawRequests: []));

  init() {
    emit(
      WithdrawRequestState(
        withdrawRequests: [],
        currentStatusFilter: WRStatus.PENDING,
        currentStatusFilterInt: 0,
        report: "Không nhận được tiền",
      ),
    );
  }

  Future<void> postWithdrawRequest({required WithdrawRequestPost req}) async {
    emit(state.copyWith(status: WithdrawRequestStatus.loading));
    try {
      final res = await repository.postWithdrawRequest(req);
      emit(state.copyWith(status: WithdrawRequestStatus.success, res: res));
    } catch (e) {
      emit(state.copyWith(status: WithdrawRequestStatus.failure));
    } finally {
      final context = Global.useContext()!;
      BlocProvider.of<WalletCubit>(context).loadWallets();
      fetchWithdrawRequest();
    }
  }

  Future<void> confirmWithdrawRequest({required String reqId}) async {
    emit(state.copyWith(status: WithdrawRequestStatus.loading));
    try {
      await repository.confirmWithdrawRequest(reqId);
      emit(state.copyWith(status: WithdrawRequestStatus.success));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: WithdrawRequestStatus.failure));
    } finally {
      fetchWithdrawRequest();
    }
  }

  Future<void> reportWithdrawRequest({required String reqId}) async {
    emit(state.copyWith(status: WithdrawRequestStatus.loading));
    try {
      await repository.reportWithdrawRequest(reqId, state.report);
      emit(state.copyWith(status: WithdrawRequestStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WithdrawRequestStatus.failure));
    } finally {
      fetchWithdrawRequest();
    }
  }

  Future<void> fetchWithdrawRequest() async {
    emit(state.copyWith(
        status: WithdrawRequestStatus.loading, numOfWithdrawRequest: 0));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfWithdrawRequest_listOfWithdrawRequests =
          await repository.fetchWithdrawRequest(
        params: {
          "filter": state.currentStatusFilter.name,
        },
      );
      final numOfWithdrawRequest =
          tuple2_numOfWithdrawRequest_listOfWithdrawRequests.item1;
      final withdrawRequests =
          tuple2_numOfWithdrawRequest_listOfWithdrawRequests.item2;
      emit(
        state.copyWith(
          status: WithdrawRequestStatus.success,
          withdrawRequests: withdrawRequests,
          currentStatusFilter: state.currentStatusFilter,
          currentStatusFilterInt: state.currentStatusFilterInt ?? 0,
          numOfWithdrawRequest: numOfWithdrawRequest,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: WithdrawRequestStatus.failure));
    }
  }

  void onChangeStatusFilter(int index) {
    final currentStatusFilter = WRStatus.values.elementAt(index);
    emit(state.copyWith(
        currentStatusFilter: currentStatusFilter,
        currentStatusFilterInt: index));
    fetchWithdrawRequest();
  }

  void setReportString(String? reason) {
    emit(state.copyWith(report: reason));
    debugPrint(state.report);
  }
}
