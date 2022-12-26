part of 'topup_cubit.dart';

enum TopupStatus {
  initial,
  loading,
  success,
  failure,
  invalid,
  inputing,
}

enum TopupMethodType { MOMO }

class TopupState extends Equatable {
  final TopupStatus status;
  final int? topupValueInt;
  final String? topupValueString;
  final TopupMethodType? topupMethod;
  final MomoResponse? momoResponse;
  const TopupState({
    this.status = TopupStatus.initial,
    this.topupValueInt = 0,
    this.topupValueString = "0",
    this.topupMethod = TopupMethodType.MOMO,
    this.momoResponse,
  });

  TopupState copyWith({
    TopupStatus? status,
    int? topupValueInt,
    String? topupValueString,
    TopupMethodType? topupMethod,
    MomoResponse? momoResponse,
  }) {
    return TopupState(
      status: status ?? this.status,
      topupValueInt: topupValueInt ?? this.topupValueInt,
      topupValueString: topupValueString ?? this.topupValueString,
      topupMethod: topupMethod ?? this.topupMethod,
      momoResponse: momoResponse ?? this.momoResponse,
    );
  }

  @override
  List<Object?> get props => [
        status,
        topupValueInt,
        topupValueString,
        topupMethod,
        momoResponse,
      ];
}
