import 'package:financial/common/applocal.dart';
import 'package:financial/widget/Wallet/widget_reports_wallet/card_fix_postions_in_page_reports.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class BankAccountReports extends StatefulWidget {
  const BankAccountReports({Key? key}) : super(key: key);

  @override
  _BankAccountReportsState createState() => _BankAccountReportsState();
}

class _BankAccountReportsState extends State<BankAccountReports> {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;
  String image = 'assets/wallet/account.png';

  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    walletId = arguments['walletId'];
    walletName = arguments['walletName'];
    walletCurrency = arguments['currencyId'];
    walletBalance = arguments['walletBalance'];
    image = arguments['image'];
    return Scaffold(
      appBar: CustomAppBar(
        Image(
          image: AssetImage('assets/homepage/wallet.png'),
        ),
        "${getLang(context, "Reports Bank Wallet")}",
        // "${getLang(context, "Add Wallet")}",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card_Fixpostion_in_Page_reports(
                  image: image,
                  walletName: walletName,
                  walletBalance: walletBalance,
                  walletCurrency: walletCurrency),
            ],
          ),
        ),
      ),
    );
  }
}
