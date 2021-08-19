import 'package:financial/screens/exchange_category/update_exchange.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_exchange.dart';

class ExchangeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeCubit, ExchangeStates>(
      listener: (BuildContext context, ExchangeStates state) {},
      builder: (BuildContext context, ExchangeStates state) {
        ExchangeCubit cubit = ExchangeCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('Exchang Category'),
              centerTitle: true,
              backgroundColor: Colors.amber[400],
            ),
            body:  ListView.builder(
                  itemCount: cubit.exchanges!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(1),
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: cubit.exchanges![index].icon == ''
                                      ? Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            border: Border.all(
                                              color: Colors.amber[400]!,
                                              width: 2,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            image: DecorationImage(
                                              scale: 0.5,
                                              image: AssetImage(cubit
                                                  .exchanges![index].icon),
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
                                Container(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      cubit.exchanges![index].name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.analytics_outlined,
                                    size: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>Navigator.of(context).pushNamed(
                                      '/updateExchange',
                                        arguments: {
                                        'categoryId': cubit.exchanges![index].id,
                                        'categoryName' :cubit.exchanges![index].name,
                                        'categoryIcon' :cubit.exchanges![index].icon,
                                        }
                                        ),
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.deleteExchangeFromDatabase(
                                        id: cubit.exchanges![index].id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    );
                  },
                ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addExchange'),
            ));
      },
    );
  }
}
