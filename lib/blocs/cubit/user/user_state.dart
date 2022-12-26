part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  failure,
}

class UserState extends Equatable {
  final UserStatus status;
  final User? userProfile;
  final bool isEdit;
  final User? userProfileEdit;
  final String genderEdit;
  final String firstNameError;
  final String lastNameError;
  final String phoneNumberError;
  final String addressError;
  final String taxError;
  final String idCardError;
  final String districtError;
  final String cityError;
  const UserState({
    this.status = UserStatus.initial,
    this.userProfile,
    this.isEdit = false,
    this.userProfileEdit,
    this.genderEdit = "Nam",
    this.firstNameError = "",
    this.lastNameError = "",
    this.phoneNumberError = "",
    this.addressError = "",
    this.taxError = "",
    this.idCardError = "",
    this.districtError = "",
    this.cityError = "",
  });
  UserState copyWith({
    UserStatus? status,
    User? userProfile,
    bool? isEdit,
    User? userProfileEdit,
    String? genderEdit,
    String? firstNameError,
    String? lastNameError,
    String? phoneNumberError,
    String? addressError,
    String? taxError,
    String? idCardError,
    String? districtError,
    String? cityError,
  }) {
    return UserState(
      status: status ?? this.status,
      userProfile: userProfile ?? this.userProfile,
      isEdit: isEdit ?? this.isEdit,
      userProfileEdit: userProfileEdit ?? this.userProfileEdit,
      genderEdit: genderEdit ?? this.genderEdit,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      phoneNumberError: phoneNumberError ?? this.phoneNumberError,
      addressError: addressError ?? this.addressError,
      taxError: taxError ?? this.taxError,
      idCardError: idCardError ?? this.idCardError,
      districtError: districtError ?? this.districtError,
      cityError: idCardError ?? this.cityError,
    );
  }

  @override
  List<Object?> get props => [
        status,
        userProfile,
        isEdit,
        userProfileEdit,
        genderEdit,
        firstNameError,
        lastNameError,
        phoneNumberError,
        addressError,
        taxError,
        idCardError,
        districtError,
        cityError,
      ];
}
