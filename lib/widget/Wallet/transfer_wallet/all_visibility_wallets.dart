import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/Visibility_Note/visibility_note.dart';
import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/visibility_Image/visibility_image.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class AllVisibility_Wallets extends StatefulWidget {
  const AllVisibility_Wallets({Key? key}) : super(key: key);

  @override
  _AllVisibility_WalletsState createState() => _AllVisibility_WalletsState();
}

// ignore: camel_case_types
class _AllVisibility_WalletsState extends State<AllVisibility_Wallets> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();

  bool isVisabile = false;

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
                Visibility_Image(),
                Visibility_Note(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}