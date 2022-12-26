import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';

class ManagerTabView extends StatelessWidget {
  const ManagerTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final project =
        context.read<FetchProjectDetailCubit>().state.projectDetailById!;
    final manager = project.manager!;
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding - 10, horizontal: kDefaultPadding),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  manager.image.toString(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) =>
                      Image.asset(
                    "assets/images/default_man.png",
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress?.cumulativeBytesLoaded ==
                        loadingProgress?.expectedTotalBytes) {
                      return child;
                    }
                    return ShimmerWidget.circular(width: 100, height: 100);
                  },
                ),
              ),
            ),
            Container(
              child: Text(
                "${manager.firstName} ${manager.lastName}"
                    .toString()
                    .toUpperCase(),
                style: TextStyle(
                  color: kDarkTextColor,
                  fontSize: kFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListTile(
                title: Text(
                  'Giới tính:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkTextColor,
                    fontSize: kFontSize - 2,
                  ),
                ),
                trailing: Text(
                  manager.gender == null
                      ? "<Chưa cập nhật>"
                      : manager.gender == "Male"
                          ? "Nam"
                          : "Nữ",
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                  ),
                )),
            ListTile(
                title: Text(
                  'Ngày sinh:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkTextColor,
                    fontSize: kFontSize - 2,
                  ),
                ),
                trailing: Text(
                  manager.dateOfBirth ?? "<Chưa cập nhật>",
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                  ),
                )),
            ListTile(
                title: Text(
                  'Email:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkTextColor,
                    fontSize: kFontSize - 2,
                  ),
                ),
                trailing: Text(
                  manager.email.toString(),
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                  ),
                )),
            ListTile(
                title: Text(
                  'Số điện thoại:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkTextColor,
                    fontSize: kFontSize - 2,
                  ),
                ),
                trailing: Text(
                  manager.phoneNum ?? "<Chưa cập nhật>",
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                  ),
                )),
            ListTile(
                title: Text(
                  'Địa chỉ:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkTextColor,
                    fontSize: kFontSize - 2,
                  ),
                ),
                trailing: Text(
                  manager.city ?? "<Chưa cập nhật>",
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                  ),
                )),
          ],
        ));
  }
}
