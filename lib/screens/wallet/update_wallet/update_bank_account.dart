import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/services/bloc/wallet/states.dart';
import 'package:taskBee/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:taskBee/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:taskBee/widget/Wallet/checkbox_wallet.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/Wallet/text_wallet_currency.dart';
import 'package:taskBee/widget/custom_alert_dialog.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../wallet_home.dart';

// ignore: must_be_immutable
class UpdateBankAccount extends StatelessWidget {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;

  int? isID;
  String? image = 'assets/wallet/account.png';

  UpdateBankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double space1 = MediaQuery.of(context).size.height / 35;
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
        "${getLang(context, "Update Wallet")}",
      ),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is UpdateWalletsToDatabaseState) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              Image_Wallet(
                image: image!,
                scale: 9.0,
              ),
              SizedBox(
                height: space1,
              ),
              Name_Wallet(
                name: "${getLang(context, "Bank Account")}",
              ),
              SizedBox(
                height: space1,
              ),
              Custom_Text(
                label: "${getLang(context, "Name")}",
                controller: nameController =
                    TextEditingController(text: '$walletName'),
                type: TextInputType.text,
              ),
              SizedBox(
                height: space1,
              ),
              Text_Wallet_Name(
                label: "${getLang(context, "Total")}",
                controller: balanceController =
                    TextEditingController(text: '$walletBalance'),
                type: TextInputType.number,
              ),
              SizedBox(
                height: space1,
              ),
              checkbox_wallet(),
              SizedBox(
                height: space1,
              ),
              BlocConsumer<CurrencyCubit, CurrencyStates>(
                listener: (context, state) {
                  if (state is InsertCurrenciesToDatabaseState) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return RaisedButtonWallets(
                      text: "${getLang(context, "Edit")}",
                      onPressed: () {
                        WalletCubit.get(context).updateWalletDatabase(
                            isId: walletId,
                            icon: image,
                            walletName: nameController.text,
                            walletBalance: balanceController.text,
                            currencyId:
                                CurrencyCubit.get(context).chosenCurrency!.id);
                      });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              BlocConsumer<WalletCubit, WalletStates>(
                  listener: (BuildContext context, WalletStates state) {},
                  builder: (BuildContext context, WalletStates state) {
                    WalletCubit cubit = WalletCubit.get(context);
                    CurrencyCubit currencyCubit = CurrencyCubit.get(context);
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialogWallet(
                            content:
                                "${getLang(context, "dialog delete wallet")}",
                            cancelMethod: () {
                              Navigator.of(context).pop();
                            },
                            submitMethod: () {
                              cubit.deleteWalletFromDatabase(id: walletId);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "${getLang(context, "Delete Wallet")}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red[700],
                        ),
                      ),
                    );
                  }),
            ]),
          );
        },
      ),
    );
  }
}
