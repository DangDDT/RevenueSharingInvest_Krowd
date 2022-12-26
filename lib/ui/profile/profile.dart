import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:intl/intl.dart';
import 'package:rsi/blocs/cubit/user/user_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/user/user.dart';
import 'package:rsi/ui/_common/buttons/secondary_button.dart';
import 'package:rsi/ui/_common/textfields/required_textfield.dart';
import 'package:sizer/sizer.dart';
import 'widgets/image_gender_stack.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _loadData() {
    context.read<UserCubit>().init();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
        backgroundColor: kLightTextColor,
        leading: InkWell(
          onTap: () => context.read<UserCubit>().onPop(context),
          child: Icon(
            Icons.chevron_left,
            color: kGrayBy6,
          ),
        ),
        title: Text("Thông tin cá nhân",
            style: TextStyle(
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: kDarkTextColor)),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.read<UserCubit>().setIsEdit(),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state.isEdit == false) {
                  return Text(
                    "Chỉnh sửa",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: kFontSize),
                  );
                } else {
                  return Text(
                    "Hủy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: bRed,
                        fontSize: kFontSize),
                  );
                }
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            final user = state.userProfile!;
            return Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return ImageGenderStack(
                          avatarLink: user.image.toString(),
                          genderLink: user.gender.toString() == "Nam"
                              ? "assets/images/man-gender.png"
                              : "assets/images/woman-gender.png",
                          isShowGender: !state.isEdit,
                        );
                      },
                    ),
                  ),
                  renderInfomation(user)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget renderInfomation(User user) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.isEdit == false) {
          final titleStyle = TextStyle(fontSize: kFontSize - 4, color: nGray6);
          final subTitleStyle =
              TextStyle(fontSize: kFontSize - 2, color: kDarkTextColor);
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                alignment: Alignment.center,
                child: Text(
                  "${user.firstName} ${user.lastName}",
                  style: TextStyle(
                    fontSize: kFontSize + 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      title: Text("Email", style: titleStyle),
                      subtitle:
                          Text(user.email.toString(), style: subTitleStyle),
                    ),
                    Divider(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("Điện thoại", style: titleStyle),
                              subtitle: Text(user.phoneNum.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("Ngày sinh", style: titleStyle),
                              subtitle: Text(user.dateOfBirth.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Địa chỉ", style: titleStyle),
                      subtitle:
                          Text(user.address.toString(), style: subTitleStyle),
                    ),
                    Divider(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("Quận/Huyện", style: titleStyle),
                              subtitle: Text(user.district.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("Tỉnh/Thành phố", style: titleStyle),
                              subtitle: Text(user.city.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("Mã số thuế", style: titleStyle),
                              subtitle: Text(
                                  user.taxIdentificationNumber.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            width: 45.w,
                            child: ListTile(
                              title: Text("CMND/CCCD", style: titleStyle),
                              subtitle: Text(user.idCard.toString(),
                                  style: subTitleStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else
          return Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    maleGenderRadio(context),
                    femaleGenderRadio(context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    firstNameField(context, "Họ"),
                    lastNameField(context, "Tên"),
                  ],
                ),
                phoneNumField(context, "Điện thoại"),
                dateOfBirthField(),
                addressField(context, "Địa chỉ"),
                districtField(context, "Quận/huyện"),
                cityField(context, "Tỉnh/thành phố"),
                taxField(context, "Mã số thuế"),
                idCardField(context, "CMND/CCCD"),
                submitButton(context)
              ],
            ),
          );
      },
    );
  }

  Widget maleGenderRadio(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          width: 35.w,
          child: RadioListTile(
            title: Text("Nam", style: TextStyle(fontSize: kFontSize)),
            value: "Nam",
            groupValue: state.genderEdit,
            onChanged: (value) =>
                context.read<UserCubit>().onGenderChange(value.toString()),
            activeColor: kPrimaryColor,
          ),
        );
      },
    );
  }

  Widget femaleGenderRadio(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          width: 35.w,
          child: RadioListTile(
            title: Text("Nữ", style: TextStyle(fontSize: kFontSize)),
            value: "Nữ",
            groupValue: state.genderEdit,
            onChanged: (value) =>
                context.read<UserCubit>().onGenderChange(value.toString()),
            activeColor: kPrimaryColor,
          ),
        );
      },
    );
  }

  Widget firstNameField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          width: 50.w,
          child: RequiredTextField(
            onChangedString: context.read<UserCubit>().onFirstNameChange,
            title: title,
            currentText: state.userProfileEdit!.firstName.toString(),
            errorText: state.firstNameError != "" ? state.firstNameError : null,
          ),
        );
      },
    );
  }

  Widget lastNameField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          width: 35.w,
          child: RequiredTextField(
            onChangedString: context.read<UserCubit>().onLastNameChange,
            title: title,
            currentText: state.userProfileEdit!.lastName.toString(),
            errorText: state.lastNameError != "" ? state.lastNameError : null,
          ),
        );
      },
    );
  }

  Widget phoneNumField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onPhoneNumChange,
          title: title,
          currentText: state.userProfileEdit!.phoneNum.toString(),
          keyboardType: TextInputType.phone,
          errorText:
              state.phoneNumberError != "" ? state.phoneNumberError : null,
        );
      },
    );
  }

  Widget dateOfBirthField() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            border: Border.fromBorderSide(
              BorderSide(color: nGray4, width: 1.0),
            ),
          ),
          child: ListTile(
            onTap: () => showMaterialDatePicker(
              title: "Ngày sinh",
              context: context,
              selectedDate: new DateFormat("dd/MM/yyyy")
                  .parse(state.userProfileEdit!.dateOfBirth.toString()),
              onChanged: context.read<UserCubit>().onDateOfBirthChange,
              firstDate: DateFormat("dd/MM/yyyy").parse("01/01/1900"),
              lastDate: DateTime.now(),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            title: Text(
              "Ngày sinh:",
              style: TextStyle(
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
                color: nGray5,
              ),
            ),
            trailing: Text(
              state.userProfileEdit!.dateOfBirth.toString(),
              style: TextStyle(
                fontSize: kFontSize - 2,
                color: kDarkTextColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget addressField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onAddressChange,
          title: title,
          currentText: state.userProfileEdit!.address.toString(),
          errorText: state.addressError != "" ? state.addressError : null,
        );
      },
    );
  }

  Widget districtField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onDistrictChange,
          title: title,
          currentText: state.userProfileEdit!.district.toString(),
          errorText: state.districtError != "" ? state.districtError : null,
        );
      },
    );
  }

  Widget cityField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onCityChange,
          title: title,
          currentText: state.userProfileEdit!.city.toString(),
          errorText: state.cityError != "" ? state.cityError : null,
        );
      },
    );
  }

  Widget taxField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onTaxChange,
          title: title,
          currentText:
              state.userProfileEdit!.taxIdentificationNumber.toString(),
          keyboardType: TextInputType.number,
          errorText: state.taxError != "" ? state.taxError : null,
        );
      },
    );
  }

  Widget idCardField(BuildContext context, String title) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<UserCubit>().onIdCardChange,
          title: title,
          currentText: state.userProfileEdit!.idCard.toString(),
          keyboardType: TextInputType.number,
          errorText: state.idCardError != "" ? state.idCardError : null,
        );
      },
    );
  }

  Widget submitButton(BuildContext context) =>
      BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return SecondaryButton(
            title: "Lưu thay đổi",
            onPress: () => context.read<UserCubit>().onSubmit(),
            enabled: [
                  state.firstNameError,
                  state.lastNameError,
                  state.phoneNumberError,
                  state.addressError,
                  state.taxError
                ].where((x) => x != "").length ==
                0,
          );
        },
      );
}
