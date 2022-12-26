import 'package:rsi/models/field/field.dart' as FieldModel;
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/remote/project_update/project_update_services.dart';
import 'package:tuple/tuple.dart';

import 'remote/account_transaction/account_transaction_services.dart';
import 'remote/bill/bill_service.dart';
import 'remote/daily_report/daily_report_service.dart';
import 'remote/field/field_service.dart';
import 'remote/investment/investment_services.dart';
import 'remote/money_overview/money_overview_services.dart';
import 'remote/notification/notification_service.dart';
import 'remote/package/package_services.dart';
import 'remote/payment/payment_service.dart';
import 'remote/pitch/pitch_services.dart';
import 'remote/project/project_services.dart';
import 'remote/stage/stage_services.dart';
import 'remote/topup/topup_service.dart';
import 'remote/user/user_service.dart';
import 'remote/wallet/wallet_service.dart';
import 'remote/wallet_transaction/wallet_transaction_services.dart';
import 'remote/withdraw/withdraw_service.dart';

class Repository {
  ProjectService _projectService = new ProjectService();

  PitchService _pitchService = new PitchService();

  WalletService _walletService = new WalletService();

  UserService _userService = new UserService();

  StageService _stageService = new StageService();

  TopupService _topupService = new TopupService();

  PackageService _packageService = new PackageService();

  InvestmentService _investmentService = new InvestmentService();

  WalletTransactionService _walletTransactionService = new WalletTransactionService();

  AccountTransactionService _accountTransactionService = new AccountTransactionService();

  DailyReportService _dailyReportService = new DailyReportService();

  BillService _billService = new BillService();

  WithdrawService _withdrawService = new WithdrawService();

  NotificationService _notificationService = new NotificationService();

  FieldService _fieldService = new FieldService();

  OverviewService _overviewService = new OverviewService();

  ProjectUpdateService _projectUpdateService = new ProjectUpdateService();

  PaymentService _paymentService = new PaymentService();
  //Projects
  Future<Tuple2<num?, List<BasicProject>?>> fetchProjects(int page, String? fieldId) async =>
      await _projectService.fetchProjects(page, fieldId);

  Future<ProjectDetail?> fetchProjectById(String id) async => await _projectService.fetchProjectById(id);

  Future<num?> fetchProjectCounter() async => await _projectService.fetchProjectCounter();

  Future<Pitch?> fetchPitchById(String id) async => await _pitchService.fetchPitchById(id);

  Future<Tuple2<int?, List<InvestedProject>?>> fetchInvestedProjects() async => _projectService.fetchInvestedProjects();

  Future<InvestedProjectDetail?> fetchInvestedProjectsById(String projectId) async =>
      _projectService.fetchInvestedProjectsById(projectId);

  //Wallets
  Future<Tuple2<double?, List<Wallet>?>> fetchWallets() async => await _walletService.fetchWallets();

  Future<TransferWalletResponse?> transfer(String fromWalletId, String toWalletId, num amount) async =>
      await _walletService.transfer(fromWalletId, toWalletId, amount);

  //WalletTransactions
  Future<List<WalletTransaction>?> fetchWalletTransactions(String walletId) async =>
      await _walletTransactionService.fetchWalletTransactionsByWalletId(walletId);

  Future<Tuple2<num?, List<WalletTransaction>?>> fetchWalletTransactionsByParams(
          {required Map<String, dynamic> params}) async =>
      await _walletTransactionService.fetchWalletTransactionsByParams(params: params);

  //User Profile
  Future<User?> loadUserProfile() async => _userService.loadUserProfile();

  Future<void> putUserProfile(User newUser) async => _userService.putUserProfile(newUser);

  //ProjectDetail Stage
  Future<Tuple2<int?, List<Stage>?>> fetchStageByProjectId(String projectId) async =>
      await _stageService.fetchStageByProjectId(projectId);

  Future<List<StageChart>?> fetchStageChartByProjectId(String projectId) async =>
      _stageService.fetchStageChartByProjectId(projectId);

  Future<Tuple2<num?, List<StageReturn>?>> fetchReturnStageByProjectId(String projectId,
          {Map<String, dynamic>? params}) async =>
      _stageService.fetchReturnStageByProjectId(projectId, params: params);

  //Momo
  Future<MomoResponse?> callMomoTopup(MomoRequest req) async => _topupService.callMomoTopup(req);

  //Packages
  Future<Tuple2<int?, List<Package>?>> fetchPackages(String projectId) async =>
      _packageService.fetchPackages(projectId);

  //Investments
  Future<InvestmentResponsePost> postInvestmentRequest(InvestmentRequestPost req) async =>
      _investmentService.postInvestmentRequest(req);
  Future<Tuple2<num?, List<Investment>?>> fetchInvestments({Map<String, dynamic>? params}) async =>
      _investmentService.fetchInvestments(params: params);
  Future<bool?> cancelInvestment(String investmentId) async => _investmentService.cancelInvestment(investmentId);
  //AccountTransaction
  Future<List<AccountTransaction>?> fetchAccountTransactions() async =>
      _accountTransactionService.fetchAccountTransactions();

  //DailyReport
  Future<Tuple2<int?, List<DailyReport>?>> fetchDailyReport({required String projectId, String? stageId}) async =>
      _dailyReportService.fetchDailyReport(
        projectId: projectId,
        stageId: stageId,
      );
  //Bill
  Future<Tuple2<int?, List<Bill>?>> fetchBills({required String dailyReportId}) async =>
      _billService.fetchBills(dailyReportId: dailyReportId);

  //WithdrawRequest
  Future<WithdrawResponse?> postWithdrawRequest(WithdrawRequestPost req) async =>
      _withdrawService.postWithdrawRequest(req);
  Future<Tuple2<num, List<WithdrawRequest>?>> fetchWithdrawRequest({Map<String, dynamic>? params}) async =>
      _withdrawService.fetchWithdrawRequest(params: params);
  Future<void> confirmWithdrawRequest(String withdrawRequestId) async =>
      _withdrawService.confirmWithdrawRequest(withdrawRequestId);
  Future<void> reportWithdrawRequest(String withdrawRequestId, String reportMessage) async =>
      _withdrawService.reportWithdrawRequest(withdrawRequestId, reportMessage);
  //Notifications

  Future<Tuple3<num?, num?, List<Notification>?>> fetchNotifications(bool seen) async =>
      _notificationService.fetchNotifications(seen);

  //Fields
  Future<Tuple2<num?, List<FieldModel.Field>?>> fetchFields() async => _fieldService.fetchFields();

  //Overview
  Future<InvestorOverview?> fetchMoneyOverview() async => _overviewService.fetchMoneyOverview();

  //Project Update
  Future<List<ProjectUpdate>?> fetchProjectUpdate(String projectId) async =>
      _projectUpdateService.fetchProjectUpdate(projectId);

  //Payment
  Future<Tuple2<num, List<Payment>?>> fetchPeriodRevenuePaymentByProjectId({required String projectId}) async =>
      _paymentService.fetchPeriodRevenuePaymentByProjectId(projectId: projectId);
}
