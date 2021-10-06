import 'package:financial/models/currency.dart';

import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/Wallet/text_wallet_currency.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePlannerSave extends StatelessWidget {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController ammountController = TextEditingController();
  int dropdownValue = 1;

  int? isID;
  String? image = 'assets/wallet/revenue.png';

  UpdatePlannerSave({Key? key}) : super(key: key);

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
          'Update Wallet'),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is UpdateWalletsToDatabaseState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Image_Wallet(
                image: image!,
                scale: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Name_Wallet(
                name: 'Planner Save',
              ),
              SizedBox(
                height: 20,
              ),
              Custom_Text(
                label: 'Planner\n Name',
                controller: nameController =
                    TextEditingController(text: '$walletName'),
                type: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Name(
                label: 'Planner\nAmount',
                controller: ammountController,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Balance(
                  label: 'Primary\nBalance',
                  controller: balanceController =
                      TextEditingController(text: '$walletBalance'),
                  type: TextInputType.number,
                  namecurrency: 'S.P'),
              SizedBox(
                height: 20,
              ),
              checkbox_wallet(),
              BlocConsumer<CurrencyCubit, CurrencyStates>(
                listener: (context, state) {
                  if (state is InsertCurrenciesToDatabaseState) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomRaisdButton(
                          text: 'Edit',
                          onPressed: () {
                            WalletCubit.get(context).updateWalletDatabase(
                                isId: walletId,
                                icon: image,
                                walletName: nameController.text,
                                walletBalance: balanceController.text,
                                currencyId: CurrencyCubit.get(context)
                                    .chosenCurrency!
                                    .id);
                          }),
                    ],
                  );
                },
              )
            ]),
          );
        },
      ),
    );
  }
}
