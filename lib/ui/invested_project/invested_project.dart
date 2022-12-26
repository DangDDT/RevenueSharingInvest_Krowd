import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class InvestedProjectScreen extends StatelessWidget {
  const InvestedProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dự án đã đầu tư",
          style: TextStyle(
            color: kLightTextColor,
            fontSize: kFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: PullRefresh(
        action: () =>
            context.read<FetchInvestedProjectCubit>().loadInvestedProjects(),
        child: SingleChildScrollView(
          child: Container(
            color: nWhite,
            child: BlocBuilder<FetchInvestedProjectCubit,
                FetchInvestedProjectState>(
              builder: (context, state) {
                if (state.status == FetchInvestedProjectStatus.loading) {
                  return renderLoading();
                } else if (state.status == FetchInvestedProjectStatus.success) {
                  if (state.projects!.length == 0) {
                    return renderEmpty();
                  } else {
                    final projects = state.projects!;
                    return renderAvailableContent(state, projects);
                  }
                } else {
                  return renderError();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget renderLoading() => CircularLoading();

Widget renderEmpty() {
  return Container(
    padding: EdgeInsets.only(bottom: kDefaultPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          EMPTY_IMAGE,
          width: 300,
          height: 250,
        ),
        Center(
          child: Text(
            'Hiện bạn chưa đầu tư vào dự án nào cả !!!',
            style: TextStyle(fontSize: kFontSize),
          ),
        ),
      ],
    ),
  );
}

Widget renderAvailableContent(
    FetchInvestedProjectState state, List<InvestedProject> projects) {
  final formatter = intl.NumberFormat.decimalPattern();
  return Container(
    padding: EdgeInsets.only(
        left: kDefaultPadding, right: kDefaultPadding, bottom: kDefaultPadding),
    decoration: BoxDecoration(
      color: nWhite,
      borderRadius: BorderRadius.circular(kBorder),
      boxShadow: kBoxShadow,
    ),
    child: Column(
      children: [
        BlocBuilder<InvestorOverviewCubit, InvestorOverviewState>(
          builder: (context, state) {
            final headingStyle = TextStyle(
                fontSize: kFontSize,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold);
            final titleStyle = TextStyle(fontSize: kFontSize, color: nGray6);
            final subTitleStyle = TextStyle(
                fontSize: kFontSize - 2,
                color: kDarkTextColor,
                fontWeight: FontWeight.bold);
            final overview = state.overview;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: nWhite,
                borderRadius: BorderRadius.circular(kBorder),
                boxShadow: kBoxShadow,
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Số dự án đã đầu tư:", style: headingStyle),
                    trailing: Text(
                      "${overview.numOfInvestedProject} dự án",
                      style: TextStyle(
                        fontSize: kFontSize + 2,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DashLineSeparator(
                    color: nGray5,
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(Icons.timelapse, size: 16, color: bOrange),
                    minLeadingWidth: 0,
                    title: Text("Dự án đang đợi kêu gọi:", style: titleStyle),
                    trailing: Text(
                        "${overview.numOfCallingForInvestmentInvestedProject} dự án",
                        style: subTitleStyle),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(Icons.run_circle, size: 16, color: bGreen),
                    minLeadingWidth: 0,
                    title: Text("Dự án đang hoạt động:", style: titleStyle),
                    trailing: Text(
                        "${overview.numOfActiveInvestedProject} dự án",
                        style: subTitleStyle),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    leading:
                        Icon(CupertinoIcons.return_icon, size: 16, color: bRed),
                    minLeadingWidth: 0,
                    title: Text("Dự án kêu gọi thất bại:", style: titleStyle),
                    trailing: Text(
                        "${overview.numOfCallingTimeIsOverInvestedProject} dự án",
                        style: subTitleStyle),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.numOfProject!,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final project = projects[index];
              return InkWell(
                onTap: () {
                  switch (project.status) {
                    case "ACTIVE":
                      Navigator.pushNamed(context, investedActiveDetailRoute,
                          arguments: project.id);
                      break;
                    case "CALLING_FOR_INVESTMENT":
                      Navigator.pushNamed(context, investedInvestingDetailRoute,
                          arguments: project.id);
                      break;
                    case "CALLING_TIME_IS_OVER":
                      Navigator.pushNamed(context, investedOvertimeDetailRoute,
                          arguments: project.id);
                      break;
                    default:
                      {}
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: nWhite,
                    borderRadius: BorderRadius.circular(kBorder),
                    boxShadow: kBoxShadow,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorder),
                            topRight: Radius.circular(kBorder)),
                        child: Image.network(
                          project.image.toString(),
                          width: 100.w,
                          height: 160,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return ShimmerWidget.rectangular(
                              width: 100.w,
                              height: 100,
                              hasMargin: false,
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                                  StackTrace? stackTrace) =>
                              Container(
                            height: 100.w,
                            width: 100,
                            alignment: Alignment.center,
                            child: Text(
                              "Hình ảnh không khả dụng",
                              style: TextStyle(fontSize: kFontSize - 6),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: kDefaultPadding),
                              title: Text(
                                project.name.toString(),
                                style: TextStyle(
                                  fontSize: kFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: kDefaultPadding),
                              title: Text(
                                "Ngày đầu tư gần nhất:",
                                style: TextStyle(
                                    fontSize: kFontSize, color: nGray6),
                              ),
                              trailing: Text(
                                project.lastestInvestmentDate
                                    .toString()
                                    .substring(0, 10),
                                style: TextStyle(fontSize: kFontSize - 2),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: kDefaultPadding),
                                title: Text(
                                  "Tiền đầu tư:",
                                  style: TextStyle(
                                      fontSize: kFontSize, color: nGray6),
                                ),
                                trailing: Text(
                                  "${formatter.format(project.investedAmount!.toInt())} đ",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: kDefaultPadding),
                                title: Text(
                                  "Đã nhận:",
                                  style: TextStyle(
                                      fontSize: kFontSize, color: nGray6),
                                ),
                                trailing: Text(
                                  "${formatter.format(project.receivedAmount!.toInt())} đ",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: kDefaultPadding),
                                title: Text(
                                  "Số kỳ:",
                                  style: TextStyle(
                                      fontSize: kFontSize, color: nGray6),
                                ),
                                trailing: Text(
                                  "${project.numOfStage} kỳ",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: kDefaultPadding),
                                title: Text(
                                  "Trạng thái:",
                                  style: TextStyle(
                                      fontSize: kFontSize, color: nGray6),
                                ),
                                trailing: Text(
                                    renderProjectStatus[project.status]!
                                        .elementAt(0),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSize - 2,
                                      color:
                                          renderProjectStatus[project.status]!
                                              .elementAt(2),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) => SizedBox(height: 10),
          ),
        ),
      ],
    ),
  );
}

Widget renderError() {
  return Container(
    padding: EdgeInsets.only(bottom: kDefaultPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          EMPTY_IMAGE,
          width: 300,
          height: 250,
        ),
        Center(
          child: Text(
            'Lỗi bất ngờ, vui lòng thử lại sau !!!',
            style: TextStyle(fontSize: kFontSize),
          ),
        ),
      ],
    ),
  );
}
