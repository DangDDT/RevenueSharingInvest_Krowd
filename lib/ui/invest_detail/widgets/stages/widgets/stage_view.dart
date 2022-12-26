import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class StageView extends StatelessWidget {
  const StageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<StageCubit, StageState>(builder: (context, state) {
      if (state.currentTab == StageTab.CARD) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (state.status == StageStatus.loading)
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ShimmerWidget.rectangular(height: 300),
                );
              else if (state.status == StageStatus.success) {
                final stage = state.filteredStages!.elementAt(index);
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  margin: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: nWhite,
                    boxShadow: kBoxShadow,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "${stage.name}",
                          style: const TextStyle(
                              fontSize: kFontSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding),
                                child: Text(
                                  "Doanh thu dự kiến",
                                  style:
                                      const TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Chip(
                                avatar: Icon(
                                  Icons.circle,
                                  color: bIndigo,
                                ),
                                backgroundColor: nWhite,
                                label: Text(
                                    "${formatter.format(stage.pessimisticExpectedAmount)} đ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 4)),
                              ),
                              Chip(
                                avatar: Icon(
                                  Icons.circle,
                                  color: bYellow,
                                ),
                                backgroundColor: nWhite,
                                label: Text(
                                    "${formatter.format(stage.normalExpectedAmount)} đ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 4)),
                              ),
                              Chip(
                                avatar: Icon(
                                  Icons.circle,
                                  color: kPrimaryColor,
                                ),
                                backgroundColor: nWhite,
                                label: Text(
                                    "${formatter.format(stage.optimisticExpectedAmount)} đ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 4)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding),
                                child: Text(
                                  "Tỉ lệ đạt được (%)",
                                  style:
                                      const TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (stage.pessimisticExpectedRatio == 0 ||
                                      stage.normalExpectedRatio == 0 ||
                                      stage.optimisticExpectedRatio == 0) {
                                    return Container(
                                      width: 150,
                                      height: 100,
                                      alignment: Alignment.center,
                                      child: Text("Chưa có dữ liệu"),
                                    );
                                  }
                                  return Container(
                                    width: 150,
                                    height: 150,
                                    child: PieChart(
                                      PieChartData(
                                        sections: [
                                          PieChartSectionData(
                                            value: stage
                                                .pessimisticExpectedRatio!
                                                .toDouble(),
                                            color: bIndigo,
                                            titleStyle: TextStyle(
                                              color: kDarkTextColor,
                                              fontSize: kFontSize - 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          PieChartSectionData(
                                            value: stage.normalExpectedRatio!
                                                .toDouble(),
                                            color: bYellow,
                                            titleStyle: TextStyle(
                                              color: kDarkTextColor,
                                              fontSize: kFontSize - 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          PieChartSectionData(
                                            value: stage
                                                .optimisticExpectedRatio!
                                                .toDouble(),
                                            color: kPrimaryColor,
                                            titleStyle: TextStyle(
                                              color: kDarkTextColor,
                                              fontSize: kFontSize - 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35.w,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(0),
                                horizontalTitleGap: 0,
                                title: Text("Đầu kỳ:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 4)),
                                trailing: Text(
                                  "${stage.startDate.toString().substring(0, 10)}",
                                  style: TextStyle(fontSize: kFontSize - 4),
                                ),
                              ),
                            ),
                            Container(
                              width: 40.w,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(0),
                                horizontalTitleGap: 0,
                                title: Text("Cuối kỳ:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 4)),
                                trailing: Text(
                                  "${stage.endDate.toString().substring(0, 10)}",
                                  style: TextStyle(fontSize: kFontSize - 4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else
                return Container(
                  decoration: BoxDecoration(
                    color: nWhite,
                    borderRadius: BorderRadius.circular(kBorder),
                    boxShadow: kBoxShadow,
                  ),
                  padding: EdgeInsets.only(bottom: kDefaultPadding),
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        EMPTY_IMAGE,
                        width: 250,
                        height: 250,
                      ),
                      Center(
                        child: Text(
                          'Lỗi bất ngờ, vui lòng thử lại sau giây lát',
                          style: TextStyle(fontSize: kFontSize),
                        ),
                      ),
                    ],
                  ),
                );
            },
            childCount: state.filteredStages?.length ?? state.numOfStage,
          ),
        );
      } else if (state.currentTab == StageTab.CHART)
        return SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (state.status == StageStatus.loading)
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ShimmerWidget.rectangular(height: 250),
              );
            else if (state.status == StageStatus.success) {
              final stageChart = state.stageCharts!.elementAt(index);
              final stageLineStyle = {
                stageChart.lineList![0].name: kPrimaryColor,
                stageChart.lineList![1].name: bYellow,
                stageChart.lineList![2].name: bIndigo,
              };
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                decoration: BoxDecoration(
                  color: nWhite,
                  boxShadow: kBoxShadow,
                ),
                child: Column(
                  children: [
                    Text(
                      stageChart.chartName.toString(),
                      style: TextStyle(
                          fontSize: kFontSize, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 100.w,
                      height: 200,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: LineChart(
                        LineChartData(
                          minY: 0,
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                interval: 1,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: const Border(
                              bottom: BorderSide(color: Color(0xff4e4965)),
                              left: BorderSide(color: Colors.transparent),
                              right: BorderSide(color: Colors.transparent),
                              top: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          gridData: FlGridData(
                              drawHorizontalLine: true,
                              drawVerticalLine: false),
                          lineBarsData: stageChart.lineList!
                              .map((_line) => LineChartBarData(
                                    isCurved: true,
                                    barWidth: 2,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                    color: stageLineStyle[_line.name],
                                    spots: _line.data!.asMap().entries.map(
                                      (entry) {
                                        int x = entry.key;
                                        int y = entry.value;
                                        return FlSpot(
                                            x.toDouble() + 1, y.toDouble());
                                      },
                                    ).toList(),
                                  ))
                              .toList(),
                        ),
                        swapAnimationDuration:
                            Duration(milliseconds: 250), // Optional
                        swapAnimationCurve: Curves.linear, // Optional
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                padding: EdgeInsets.only(bottom: kDefaultPadding),
                margin: EdgeInsets.only(top: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      EMPTY_IMAGE,
                      width: 250,
                      height: 250,
                    ),
                    Center(
                      child: Text(
                        'Lỗi bất ngờ, vui lòng thử lại sau giây lát',
                        style: TextStyle(fontSize: kFontSize),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          childCount: state.stageCharts?.length,
        ));
      else
        return SliverToBoxAdapter(child: Container());
    });
  }
}
