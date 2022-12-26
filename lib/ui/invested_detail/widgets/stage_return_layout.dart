import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:intl/intl.dart' as intl;

class StageReturnLayout extends StatefulWidget {
  final String projectId;
  const StageReturnLayout({Key? key, required this.projectId}) : super(key: key);

  @override
  State<StageReturnLayout> createState() => _StageReturnLayoutState();
}

class _StageReturnLayoutState extends State<StageReturnLayout> {
  @override
  void initState() {
    super.initState();
    context.read<StageReturnCubit>()
      ..init(projectId: widget.projectId)
      ..fetchReturnStages();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<StageReturnCubit, StageReturnState>(
            builder: (context, state) {
              return ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                dense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: kDefaultPadding),
                title: Text(
                  "Hiện tất cả giai đoạn",
                  style: TextStyle(fontSize: kFontSize, color: nGray6),
                ),
                trailing: Switch(
                  value: state.showAll,
                  activeColor: kSecondaryColor,
                  onChanged: context.read<StageReturnCubit>().onChangeSwitch,
                ),
              );
            },
          ),
          BlocBuilder<StageReturnCubit, StageReturnState>(
            builder: (context, state) {
              switch (state.status) {
                case StageReturnStatus.success:
                  if (state.stages.length == 0)
                    return renderEmpty();
                  else
                    return renderAvailable(context, state);
                case StageReturnStatus.loading:
                  return CircularLoading();
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget renderEmpty() {
    return Container(
      color: kBackgroundColor,
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
              'Hiện không có kì thanh toán nào cả !!!',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderAvailable(BuildContext context, StageReturnState state) {
    final formatter = intl.NumberFormat.decimalPattern();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final stage = state.stages[index];
            return Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: nWhite,
                borderRadius: BorderRadius.circular(kBorder),
                boxShadow: kBoxShadow,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                stage.name.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: kFontSize),
                              ),
                            ),
                            Text(
                              "${renderStageReturnStatus[stage.status]!.elementAt(0)}",
                              style: TextStyle(
                                color: renderStageReturnStatus[stage.status]!.elementAt(2),
                                fontWeight: FontWeight.bold,
                                fontSize: kFontSize - 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Builder(builder: (context) {
                              if (stage.name != "Giai đoạn thanh toán nợ") {
                                return ListTile(
                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  title: Text(
                                    "Doanh thu thực tế:",
                                    style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                                  ),
                                  trailing: Text(
                                    "${formatter.format(stage.actualAmount ?? 0)} đ",
                                    style: TextStyle(
                                        fontSize: kFontSize, fontWeight: FontWeight.bold, color: kDarkTextColor),
                                  ),
                                );
                              } else {
                                return SizedBox(height: 0);
                              }
                            }),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Chủ dự án phải thanh toán:",
                                style: TextStyle(
                                  fontSize: kFontSize - 2,
                                  color: nGray6,
                                ),
                              ),
                              trailing: Text(
                                "${formatter.format(stage.sharedAmount ?? 0)} đ",
                                style:
                                    TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: kDarkTextColor),
                              ),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Chủ dự án đã thanh toán:",
                                style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                              ),
                              trailing: Text(
                                "${formatter.format(stage.paidAmount ?? 0)} đ",
                                style:
                                    TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: kDarkTextColor),
                              ),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Số tiền bạn nhận được:",
                                style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                              ),
                              trailing: Text(
                                "+ ${formatter.format(stage.receivedAmount ?? 0)} đ",
                                style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: bGreen),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Đầu kì: ${stage.startDate}",
                                  style: TextStyle(fontSize: kFontSize - 4, color: nGray6),
                                ),
                                Builder(builder: (context) {
                                  if (stage.name != "Giai đoạn thanh toán nợ") {
                                    return Text(
                                      "Cuối kì: ${stage.endDate}",
                                      style: TextStyle(fontSize: kFontSize - 4, color: nGray6),
                                    );
                                  } else {
                                    return Text(
                                      "Cuối kì: Đến khi thanh toán hết nợ",
                                      style: TextStyle(fontSize: kFontSize - 4, color: nGray6),
                                    );
                                  }
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Builder(builder: (context) {
                      if (stage.name != "Giai đoạn thanh toán nợ") {
                        return Column(
                          children: [
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Cam kết doanh thu ban đầu của chủ dự án",
                                style:
                                    TextStyle(fontSize: kFontSize, color: kDarkTextColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Doanh thu thấp nhất:",
                                style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                              ),
                              trailing: Text(
                                "${formatter.format(stage.pessimisticExpectedAmount)} đ",
                                style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: bIndigo),
                              ),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Doanh thu bình thường:",
                                style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                              ),
                              trailing: Text(
                                "${formatter.format(stage.normalExpectedAmount)} đ",
                                style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: bYellow),
                              ),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              title: Text(
                                "Doanh thu cao nhất:",
                                style: TextStyle(fontSize: kFontSize - 2, color: nGray6),
                              ),
                              trailing: Text(
                                "${formatter.format(stage.optimisticExpectedAmount)} đ",
                                style:
                                    TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: kPrimaryColor),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(height: 0);
                      }
                    }),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      title: Text(
                        "Lịch sử thanh toán",
                        style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Builder(builder: (context) {
                      final payments = state.payments.where((e) => e.stageId == stage.id);
                      if (payments.length != 0) {
                        return Column(
                          children: payments
                              .map((e) => ListTile(
                                    dense: true,
                                    minLeadingWidth: 0,
                                    leading: Icon(
                                      Icons.wallet_giftcard,
                                      color: kSecondaryColor,
                                    ),
                                    title: Text(
                                      e.description!.split("của").first,
                                      style: TextStyle(fontSize: kFontSize - 2),
                                    ),
                                    trailing: Text(
                                      "+ ${formatter.format(e.amount)} đ",
                                      style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold, color: bGreen),
                                    ),
                                    subtitle: Text(
                                      e.createDate!,
                                      style: TextStyle(fontSize: kFontSize - 4),
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Center(child: Text("Hiện không có lịch sử thanh toán nào cho kỳ này"));
                      }
                    })
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: state.stages.length,
        ),
      ),
    );
  }
}
