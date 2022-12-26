import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rsi/models/momo/index.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'topup_state.dart';

class TopupCubit extends Cubit<TopupState> {
  final Repository repository = new Repository();
  TopupCubit() : super(TopupState());

  void onTopupChange(String value) {
    final topupValueString = value != "" ? value : "0";
    final topupValueInt = int.parse(topupValueString.replaceAll(",", ""));
    emit(state.copyWith(
      status: TopupStatus.inputing,
      topupValueString: topupValueString,
      topupValueInt: topupValueInt,
    ));
  }

  void onTopupMethodChange(TopupMethodType? value) {
    emit(state.copyWith(status: TopupStatus.inputing, topupMethod: value));
  }

  void onButtonTopupPress(int topupAmount) {
    emit(state.copyWith(status: TopupStatus.loading));
    switch (state.topupMethod) {
      case TopupMethodType.MOMO:
        onTopupByMomo(topupAmount);
        break;
      default:
    }
  }

  Future<void> onTopupByMomo(num amount) async {
    try {
      final req = new MomoRequest(amount: amount);
      final res = await repository.callMomoTopup(req);
      emit(state.copyWith(status: TopupStatus.loading, momoResponse: res));
      final momoUrl = res!.result!.deeplink!;
      if (await canLaunchUrlString(momoUrl)) {
        launchUrlString(res.result!.deeplink!).whenComplete(() {
          final context = Global.useContext();
          if (context != null) {
            Navigator.pop(context);
          }
        });
      }
      emit(state.copyWith(status: TopupStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TopupStatus.failure));
    }
  }
}
