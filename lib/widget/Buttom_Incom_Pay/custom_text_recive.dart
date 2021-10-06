import 'package:financial/common/constant/constants.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custom_Text_recive extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;

  const Custom_Text_recive({
    Key? key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.label,
    this.prefix,
    this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Text(
            label.toString(),
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff16c8b1)),
            autofocus: true,
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
            enabled: isClickable,
            onTap: onTap,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          child: BlocConsumer<CurrencyCubit, CurrencyStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Text(
                CurrencyCubit.get(context).chosenCurrency != null ? CurrencyCubit.get(context).chosenCurrency!.name : kDefaultCurrency.code,
                style: TextStyle(fontSize: 15),
              );
            },
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
        ),
      ]),
    );
  }
}
