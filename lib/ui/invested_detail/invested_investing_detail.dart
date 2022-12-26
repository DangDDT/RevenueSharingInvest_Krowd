import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/invested_detail/widgets/overview_invest_layout.dart';

class InvestedInvestingDetailScreen extends StatefulWidget {
  final String projectId;
  const InvestedInvestingDetailScreen({Key? key, required this.projectId})
      : super(key: key);

  @override
  State<InvestedInvestingDetailScreen> createState() =>
      _InvestedInvestingDetailScreenState();
}

class _InvestedInvestingDetailScreenState
    extends State<InvestedInvestingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sổ tay đầu tư",
          style: TextStyle(
            color: kLightTextColor,
            fontSize: kFontSize + 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: OverviewInvestLayout(projectId: widget.projectId),
    );
  }
}
