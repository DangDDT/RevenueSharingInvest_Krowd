import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:rsi/ui/_management/widgets/withdraw_request_layout/widgets/approved_wr_list.dart';
import 'package:sizer/sizer.dart';

import 'widgets/partial_wr_list.dart';
import 'widgets/pending_wr_list.dart';
import 'widgets/reject_wr_list.dart';
import 'widgets/report_wr_list.dart';

class WithdrawRequestLayout extends StatefulWidget {
  const WithdrawRequestLayout({Key? key}) : super(key: key);

  @override
  State<WithdrawRequestLayout> createState() => _WithdrawRequestLayoutState();
}

class _WithdrawRequestLayoutState extends State<WithdrawRequestLayout> {
  List<String> _tabListNames = [
    "Đang xử lý",
    "Đã được duyệt",
    "Thành công",
    "Từ chối",
    "Báo cáo lỗi",
  ];
  @override
  void initState() {
    context.read<WithdrawRequestCubit>()
      ..init()
      ..fetchWithdrawRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: kFontSize - 4,
        color: kPrimaryColor,
        fontWeight: FontWeight.bold);
    final subTitleStyle = TextStyle(fontSize: kFontSize - 4);
    return PullRefresh(
      action: () => context.read<WithdrawRequestCubit>().fetchWithdrawRequest(),
      child: DefaultTabController(
        length: _tabListNames.length,
        initialIndex: 0,
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: Icon(
                      Icons.question_mark,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "Làm sao để rút tiền ?",
                      style: TextStyle(
                          fontSize: kFontSize - 2,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        dense: true,
                        minVerticalPadding: 0,
                        title: Text("Đang xử lý",
                            style: titleStyle
                                .merge(TextStyle(color: kPrimaryColor))),
                        subtitle: Text(
                            "Khi bạn tạo một lệnh rút tiền từ ví đầu tư chung/thu tiền",
                            style: subTitleStyle),
                      ),
                      ListTile(
                        dense: true,
                        minVerticalPadding: 0,
                        title: Text("Đã được duyệt",
                            style: titleStyle.merge(TextStyle(color: bIndigo))),
                        subtitle: Text(
                            "Lệnh rút tiền đã được hệ thống duyệt, bạn có thể xác nhận giao dịch hoặc báo cáo lỗi",
                            style: subTitleStyle),
                      ),
                      ListTile(
                        dense: true,
                        minVerticalPadding: 0,
                        title: Text("Từ chối",
                            style: titleStyle.merge(TextStyle(color: bRed))),
                        subtitle: Text(
                            "Lệnh rút tiền bị hệ thống từ chối. Số tiền sẽ được hoàn tác về ví mà bạn rút.",
                            style: subTitleStyle),
                      ),
                      ListTile(
                        dense: true,
                        minVerticalPadding: 0,
                        title: Text("Báo cáo lỗi",
                            style: titleStyle.merge(TextStyle(color: bOrange))),
                        subtitle: Text(
                            "Khi bạn thấy có vấn đề gì với các lệnh rút tiền đang chờ bạn xác nhận.",
                            style: subTitleStyle),
                      ),
                      ListTile(
                        dense: true,
                        minVerticalPadding: 0,
                        title: Text("Thành công",
                            style: titleStyle.merge(TextStyle(color: bGreen))),
                        subtitle: Text(
                            "Các lệnh rút tiền đã được bạn và hệ thống cùng xác nhận.",
                            style: subTitleStyle),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              leadingWidth: 0,
              elevation: 0,
              titleSpacing: 0,
              backgroundColor: nWhite,
              pinned: true,
              snap: true,
              floating: true,
              title: TabBar(
                isScrollable: true,
                onTap: (value) => context
                    .read<WithdrawRequestCubit>()
                    .onChangeStatusFilter(value),
                unselectedLabelColor: nGray3,
                labelColor: kSecondaryColor,
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: kFontSize - 4),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: kFontSize - 2),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: nWhite,
                ),
                tabs: buildWithdrawRequestTabBar(_tabListNames),
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            SliverToBoxAdapter(
              child: renderWithdrawRequestList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLoading() => Container(
      height: 70.h, alignment: Alignment.center, child: CircularLoading());

  Widget renderFailure() => Container();

  List<Widget> buildWithdrawRequestTabBar(List<String> listStatus) {
    return listStatus
        .map(
          (_status) => BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
            builder: (context, state) {
              return Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${_status.toString()} ${listStatus.indexOf(_status) == state.currentStatusFilterInt ? "(${state.numOfWithdrawRequest})" : ""}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        )
        .toList();
  }

  Widget renderWithdrawRequestList() {
    return BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
      builder: (context, state) {
        switch (state.status) {
          case WithdrawRequestStatus.loading:
            return renderLoading();
          case WithdrawRequestStatus.failure:
            return renderFailure();
          case WithdrawRequestStatus.success:
            {
              switch (state.currentStatusFilter) {
                case WRStatus.PENDING:
                  return PendingWithdrawRequestLayout();
                case WRStatus.PARTIAL:
                  return PatialWithdrawRequestLayout();
                case WRStatus.APPROVED:
                  return AprrovedWithdrawRequestLayout();
                case WRStatus.REJECTED:
                  return RejectWithdrawRequestLayout();
                case WRStatus.PARTIAL_ADMIN:
                  return ReportedWithdrawRequestLayout();
                default:
                  return Container();
              }
            }
          default:
            return renderLoading();
        }
      },
    );
  }
}
