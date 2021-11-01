import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/Visibility_Note/visibility_note.dart';
import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/visibility_Image/visibility_image.dart';
import 'package:financial/widget/Debts/visibility_repeted_debts.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class AllVisibility_Debts extends StatefulWidget {
  const AllVisibility_Debts({Key? key, this.descriptionController})
      : super(key: key);
  final TextEditingController? descriptionController;

  @override
  _AllVisibility_DebtsState createState() =>
      _AllVisibility_DebtsState(descriptionController);
}

// ignore: camel_case_types
class _AllVisibility_DebtsState extends State<AllVisibility_Debts> {
  final TextEditingController? descriptionController;
  bool isVisabile = false;

  _AllVisibility_DebtsState(this.descriptionController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            child: isVisabile == false
                ? Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                : Icon(
                    Icons.arrow_drop_up,
                    size: 35,
                  ),
            onTap: () {
              setState(() {
                isVisabile = !isVisabile;
              });
              //
            },
          ),
        ),
        Visibility(
          visible: isVisabile,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibal_RepatedDebts(),
                Visibility_Image(),
                Visibility_Note(
                  des: descriptionController,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}