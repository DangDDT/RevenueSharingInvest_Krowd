import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/progress_percent_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/properties_project_tile.dart';
import 'package:sizer/sizer.dart';

class OverviewTabView extends StatelessWidget {
  const OverviewTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final l10n = L10n.useL10n();
    final project =
        context.read<FetchProjectDetailCubit>().state.projectDetailById!;
    final progressPercentBar =
        renderProgressPercentBar(l10n, formatter, project);
    final listDetailInformation = renderListDetailInformation(project);

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: kDefaultPadding - 5,
        right: kDefaultPadding,
        left: kDefaultPadding,
      ),
      child: Column(
        children: [
          ...progressPercentBar,
          ...listDetailInformation,
        ],
      ),
    );
  }

  List<Widget> renderProgressPercentBar(
      l10n, intl.NumberFormat formatter, project) {
    final topTitle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          l10n.invested,
          style: TextStyle(fontSize: kFontSize),
        ),
        Text(
          l10n.target,
          style: TextStyle(fontSize: kFontSize),
        )
      ],
    );
    final progressPercentBar = Container(
      height: 5.h,
      child: ProgressPercentBar(
        currentPercent:
            ((project.investedCapital! / project.investmentTargetCapital!) *
                    100)
                .toInt(),
      ),
    );
    final bottomContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${formatter.format(project.investedCapital!.toInt())} đ",
          style: TextStyle(
            fontSize: kFontSize,
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${formatter.format(project.investmentTargetCapital!.toInt())} đ",
          style: TextStyle(
            fontSize: kFontSize,
            color: kSecondaryColor,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
    return [
      topTitle,
      progressPercentBar,
      bottomContent,
    ];
  }

  List<Widget> renderListDetailInformation(ProjectDetail project) {
    final data = [
      {
        "leading": "Doanh thu chia sẻ",
        "trailing": "${project.sharedRevenue.toString()} %",
      },
      {
        "leading": "Hệ số nhân",
        "trailing": "${project.multiplier.toString()}x",
      },
      {
        "leading": "Thời hạn",
        "trailing": "${project.duration.toString()} tháng",
      },
      {
        "leading": "Số kì thanh toán",
        "trailing": "${project.numOfStage.toString()} kì",
      },
    ];
    return data
        .map(
          (e) => Column(
            children: [
              renderDetailInformation(
                e["leading"],
                e["trailing"],
              ),
              renderDivider(e, data.last),
            ],
          ),
        )
        .toList();
  }

  Widget renderDetailInformation(leading, trailing) {
    final contentContainer = Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 5),
      child: PropertiesProjectTile(
        leading: leading,
        trailing: trailing,
      ),
    );

    return contentContainer;
  }

  Widget renderDivider(e, lastItem) {
    if (e != lastItem)
      return Divider(
        height: 2,
        color: kGrayBy6,
        thickness: 0.1,
      );
    return SizedBox(height: 0);
  }
}
