import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateRevenueCategory extends StatelessWidget {
  int? exchangeId;
  String? exchangeName;
  String? catImage;

  TextEditingController nameController = TextEditingController();

  UpdateRevenueCategory({
    Key? key,
    this.exchangeId,
    this.exchangeName,
    this.catImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    exchangeId = arguments['categoryId'];
    exchangeName = arguments['categoryName'];
    catImage = arguments['categoryIcon'];
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset('assets/homepage/dollar.png'), 'Update Categoray'),
      body: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (context, state) {
          if (state is UpdateExchangesToDatabaseState) {
            ExchangeCubit.get(context).chosenImage = '';
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/category');
                          },
                          child: ExchangeCubit.get(context).chosenImage == ''
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    image: DecorationImage(
                                      scale: 0.5,
                                      image: AssetImage('$catImage'),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    border: Border.all(
                                      color: Colors.amber[400]!,
                                      width: 2,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    image: DecorationImage(
                                      scale: 0.5,
                                      image: AssetImage(
                                          '${ExchangeCubit.get(context).chosenImage}'),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    border: Border.all(
                                      color: Colors.amber[400]!,
                                      width: 2,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Custom_Text(
                        label: 'Name Category',
                        controller: nameController =
                            TextEditingController(text: '$exchangeName'),
                        prefix: Icons.category),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomRaisdButton(
                            onPressed: () {
                              ExchangeCubit.get(context).updateExchangeDatabase(
                                isIncome: 1,
                                isId: exchangeId,
                                exchangeName: nameController.text,
                                icon: ExchangeCubit.get(context).chosenImage ==
                                        ''
                                    ? catImage
                                    : ExchangeCubit.get(context).chosenImage,
                              );
                            },
                            text: 'Update'),
                        CustomRaisdButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: 'Cancel'),
                      ],
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}