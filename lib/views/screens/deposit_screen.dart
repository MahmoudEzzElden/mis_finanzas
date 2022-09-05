import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mis_finanzas/controller/month_dropdown.dart';
import 'package:mis_finanzas/views/widgets/empty_list.dart';
import 'package:provider/provider.dart';

import '../../controller/transaction_controller.dart';
import '../../model/transaction_model.dart';
import '../widgets/error_message.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.green,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'DepositsTitle'.tr,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                        onChanged: (month) {
                          Provider.of<MonthDropDown>(context, listen: false)
                              .changeMonth(month as String);
                        },
                        value: Provider.of<MonthDropDown>(context)
                                    .monthOnDropDown ==
                                ''
                            ? null
                            : Provider.of<MonthDropDown>(context)
                                .monthOnDropDown,
                        hint: Text('SelectMonthDropDownButton'.tr),
                        menuMaxHeight: 200,
                        items:
                            Provider.of<MonthDropDown>(context, listen: false)
                                .months
                                .map((month) {
                          return DropdownMenuItem(
                            child: Text(month),
                            value: month,
                          );
                        }).toList(),
                      ),
                      Column(
                        children: [
                          Text(
                            'TotalDepositsText'.tr,
                          ),
                          Consumer<TransactionController>(
                            builder: (context, provider, child) {
                              return Text(NumberFormat.currency(symbol: 'EGP')
                                  .format(
                                provider.currentBalance
                              ));
                            },
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Expanded(
                child: FutureBuilder<List<TransactionModel>>(
              future: Provider.of<TransactionController>(context, listen: false)
                  .getTransactions(
                      'Deposit',
                      Provider.of<MonthDropDown>(context, listen: false)
                          .dropDownMonth),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data!.isEmpty
                        ?
                            EmptyList(text: 'emptyListText'.tr,)
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading:
                                    Image.asset('assets/images/deposit.png'),
                                title: Text(snapshot.data![index].tName!),
                                subtitle: Text(DateFormat('EEE - dd-MM-yyyy')
                                    .format(snapshot.data![index].tDate!)
                                    .toString()),
                                trailing: Text(NumberFormat.currency(
                                        symbol: 'EGP')
                                    .format(snapshot.data![index].tAmount!)),
                              );
                            })
                    : snapshot.hasError
                        ? ErrorScreen(errorText: snapshot.error.toString(),)
                        : CircularProgressIndicator();
              },
            ))
          ],
        ),
      ),
    );
  }
}
