import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository _repository = new Repository();
  UserCubit() : super(const UserState());
  init() {
    emit(state.copyWith(isEdit: false));
  }

  Future<void> loadUserProfile() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final User? user = await _repository.loadUserProfile();
      emit(state.copyWith(
          status: UserStatus.success,
          userProfile: user,
          userProfileEdit: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }

  void onPop(context) {
    Navigator.pop(context);
  }

  void setIsEdit() {
    emit(
      state.copyWith(
        isEdit: !state.isEdit,
        userProfileEdit: state.userProfile,
        genderEdit: state.userProfile!.gender == "Nam" ? "Nam" : "Nữ",
      ),
    );
  }

  void onFirstNameChange(String newFirstName) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(firstName: newFirstName);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        firstNameError: notNullString(newFirstName)));
  }

  void onLastNameChange(String newLastName) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(lastName: newLastName);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        lastNameError: notNullString(newLastName)));
  }

  void onPhoneNumChange(String newPhoneNumber) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(phoneNum: newPhoneNumber);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        phoneNumberError: notNullString(newPhoneNumber)));
  }

  void onDateOfBirthChange(DateTime newDateOfBirthDateTime) {
    final newDateOfBirth =
        "${newDateOfBirthDateTime.day}/${newDateOfBirthDateTime.month < 10 ? "0" : ""}${newDateOfBirthDateTime.month}/${newDateOfBirthDateTime.year}";
    final userProfileEdit =
        state.userProfileEdit!.copyWith(dateOfBirth: newDateOfBirth);
    emit(state.copyWith(userProfileEdit: userProfileEdit));
  }

  void onAddressChange(String newAddress) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(address: newAddress);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        addressError: notNullString(newAddress)));
  }

  void onDistrictChange(String newDistrict) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(address: newDistrict);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        districtError: notNullString(newDistrict)));
  }

  void onCityChange(String newCity) {
    final userProfileEdit = state.userProfileEdit!.copyWith(address: newCity);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit, cityError: notNullString(newCity)));
  }

  void onTaxChange(String newTax) {
    final userProfileEdit =
        state.userProfileEdit!.copyWith(taxIdentificationNumber: newTax);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit, taxError: notNullString(newTax)));
  }

  void onGenderChange(String newGender) {
    final userProfileEdit = state.userProfileEdit!.copyWith(gender: newGender);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit, genderEdit: newGender));
  }

  void onIdCardChange(String newIdCard) {
    final userProfileEdit = state.userProfileEdit!.copyWith(idCard: newIdCard);
    emit(state.copyWith(
        userProfileEdit: userProfileEdit,
        idCardError: notNullString(newIdCard)));
  }

  void onSubmit() {
    _repository
        .putUserProfile(state.userProfileEdit!)
        .whenComplete(() => loadUserProfile())
        .whenComplete(() => setIsEdit());
  }

  String? notNullString(String? string) {
    if (string == null || string.trim() == "")
      return "*Bắt buộc";
    else
      return "";
  }
}
