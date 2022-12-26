import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rsi/blocs/cubit/withdraw_request/withdraw_request_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

class ReportedWithdrawRequestLayout extends StatelessWidget {
  const ReportedWithdrawRequestLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
      builder: (context, state) {
        final f = DateFormat('dd/MM/yyyy hh:mm:ss');
        final pendingWRs = state.withdrawRequests;
        pendingWRs.sort(
            (a, b) => f.parse(b.updateDate!).compareTo(f.parse(a.updateDate!)));
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final pendingWR = pendingWRs[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      "${formatter.format(pendingWR.amount.toInt())} đ",
                      style: TextStyle(
                          color: bIndigo, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Bạn đã rút thành công ${formatter.format(pendingWR.amount.toInt())} đ",
                      style: TextStyle(
                          color: kDarkTextColor, fontSize: kFontSize - 4),
                    ),
                    children: <Widget>[
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Chủ tài khoản:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(pendingWR.accountName,
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Tên ngân hàng:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(pendingWR.bankName,
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Số tài khoản:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(pendingWR.bankAccount,
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Nguồn tiền:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(
                            pendingWR.fromWalletName ?? "Chưa cập nhật",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Lệnh tạo lúc:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(pendingWR.createDate ?? "Chưa cập nhật",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Báo lỗi lúc:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(pendingWR.updateDate ?? "Chưa cập nhật",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Lý do:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(
                            pendingWR.reportMessage ?? "Chưa cập nhật",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Text(
                          "Krowd sẽ liên hệ trong chậm nhất 24h kể từ lúc báo cáo, rất tiếc vì sự bất tiện này !",
                          style: TextStyle(
                              fontSize: kFontSize - 2, color: bOrange),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Hình ảnh chứng minh:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        subtitle: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: Image.network(
                            pendingWR.description,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return ShimmerWidget.rectangular(
                                hasMargin: false,
                              );
                            },
                            errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) =>
                                Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Hình ảnh không khả dụng",
                                style: TextStyle(fontSize: kFontSize - 6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: pendingWRs.length,
          ),
        );
      },
    );
  }
}
