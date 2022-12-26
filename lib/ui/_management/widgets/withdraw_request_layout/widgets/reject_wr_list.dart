import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/withdraw_request/withdraw_request_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;

class RejectWithdrawRequestLayout extends StatelessWidget {
  const RejectWithdrawRequestLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
      builder: (context, state) {
        final pendingWRs = state.withdrawRequests
            .where((e) => e.status == "REJECTED")
            .toList();
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
                      style:
                          TextStyle(color: bRed, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Hệ thống từ chối giao dịch rút ${formatter.format(pendingWR.amount.toInt())} đ",
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
                        title: Text('Từ chối lúc:',
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
                        trailing: Text(pendingWR.refusalReason,
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold,
                                color: bRed)),
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
