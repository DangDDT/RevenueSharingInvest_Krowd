import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/ui_config.dart';
import 'package:rsi/resources/global.dart';

class L10n {
  static const Map<int, Locale> support = {
    0: Locale("vi"),
    1: Locale("en"),
  };
  static AppLocalizations useL10n() {
    final context = Global.useContext();
    return AppLocalizations.of(context!)!;
  }

  static List<String> getListCategory(localeProvider) {
    return LIST_CATEGORY_ITEM
        .singleWhere((e) => e.containsKey(localeProvider.locale.toString()))
        .values
        .single;
  }

  static List<String> getListScrollBarItem(localeProvider) {
    return LIST_SCROLL_ITEM
        .singleWhere((e) => e.containsKey(localeProvider.locale.toString()))
        .values
        .single;
  }

  static List<String> getListTabBar(localeProvider) {
    return LIST_TAB_BAR
        .singleWhere((e) => e.containsKey(localeProvider.locale.toString()))
        .values
        .single;
  }

  static List<Map<String, String>> getListNavBar(localeProvider) {
    return NAV_LIST
        .singleWhere((e) => e.containsKey(localeProvider.locale.toString()))
        .values
        .single;
  }

  static Map<WalletTransactionFilter, String> getListTabbarTransaction(
      localeProvider) {
    if (localeProvider.locale.toString() == "vi") {
      return {
        WalletTransactionFilter.ALL: "Tất cả",
        WalletTransactionFilter.CASH_IN: "Tiền vào",
        WalletTransactionFilter.CASH_OUT: "Tiền ra"
      };
    } else {
      return {
        WalletTransactionFilter.ALL: "All",
        WalletTransactionFilter.CASH_IN: "Cash in",
        WalletTransactionFilter.CASH_OUT: "Cash out"
      };
    }
  }

  static Map<String, String> getTransactionDescriptions(localeProvider) {
    if (localeProvider.locale.toString() == "vi") {
      return {
        "Deposit money into I1 wallet": "Nạp vào ví tạm thời",
        "Transfer money from I1 wallet to I2 wallet":
            "Chuyển sang ví đầu tư chung",
        "Receive money from I1 wallet to I2 wallet": "Nhận từ ví tạm thời",
        "Transfer money from I2 wallet to I3 wallet to invest":
            "Đã đầu tư vào dự án",
        "Receive money from I2 wallet to I3 wallet to invest":
            "Tạm ứng thành công dự án",
        "Transfer money from I3 wallet to P3 wallet to prepare for activation":
            "Chuyển sang ví của chủ dự án",
        "Receive money from I2 wallet to I1 wallet":
            "Tạo lệnh rút từ ví đầu tư",
        "Transfer money from I2 wallet to I1 wallet": "Tạo lệnh rút tiền",
        "Withdraw money out of I1 wallet": "Rút tiền thành công",
        "Receive money from P4 wallet to I4 wallet for stage payment":
            "Nhận từ dự án",
        "Transfer money from I4 wallet to I5 wallet": "Chuyển sang ví thu tiền",
        "Receive money from I4 wallet to I5 wallet":
            "Nhận từ ví dự án thanh toán",
        "Transfer money from I5 wallet to I2 wallet":
            "Chuyển sang ví đầu tư chung",
        "Receive money from I5 wallet to I2 wallet": "Nhận từ ví thu tiền",
        "Receive money from I5 wallet to I1 wallet":
            "Tạo lệnh rút từ ví thu tiền",
        "Transfer money from I5 wallet to I1 wallet":
            "Chuyển về ví tạm thời: Tạo lệnh rút tiền",
        "Transfer money from I3 wallet to I2 wallet due to investment cancellation":
            "Chuyển về ví đầu tư chung: Do hủy đầu tư",
        "Receive money from I3 wallet to I2 wallet due to investment cancellation":
            "Nhận từ ví tạm ứng: Do hủy đầu tư",
        "Transfer money from I3 wallet to I2 wallet due to unsuccessful project calling for investment":
            "Chuyển về ví đầu tư chung: Hoàn tiền từ dự án kêu gọi thất bại",
        "Receive money from I3 wallet to I2 wallet due to unsuccessful project calling for investment":
            "Hoàn tiền từ dự án kêu gọi thất bại",
      };
    } else {
      return {
        "Deposit money into I1 wallet": "Topup to temp wallet",
        "Transfer money from I1 wallet to I2 wallet":
            "Transfered to invesment wallet",
        "Receive money from I1 wallet to I2 wallet":
            "Received from temp wallet",
        "Transfer money from I2 wallet to I3 wallet to invest":
            "Invested in the project",
        "Receive money from I2 wallet to I3 wallet to invest":
            "Invested in the project",
        "Receive money from I2 wallet to I1 wallet":
            "Create withdrawal orders from investment wallets",
        "Transfer money from I2 wallet to I1 wallet":
            "Create withdrawal orders",
        "Withdraw money out of I1 wallet": "Withdraw successfully",
        "Receive money from P4 wallet to I4 wallet for stage payment":
            "Received from project",
        "Transfer money from I4 wallet to I5 wallet":
            "Transfer to collection wallet",
        "Receive money from I4 wallet to I5 wallet":
            "Received from payment project wallet",
        "Transfer money from I5 wallet to I2 wallet":
            "Transfer to investment wallet",
        "Receive money from I5 wallet to I2 wallet":
            "Received from collection wallet",
        "Receive money from I5 wallet to I1 wallet":
            "Create withdrawal orders from collection wallets",
        "Transfer money from I5 wallet to I1 wallet":
            "Create withdrawal orders",
        "Transfer money from I3 wallet to I2 wallet due to investment cancellation":
            "Transfer to investment wallet due to investment cancellation",
        "Receive money from I3 wallet to I2 wallet due to investment cancellation":
            "Receive advance wallet due to investment cancellation",
        "Receive money from I3 wallet to I2 wallet due to unsuccessful project calling for investment":
            "Receive from failed calling project",
      };
    }
  }
}
