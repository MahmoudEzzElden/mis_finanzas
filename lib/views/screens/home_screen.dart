import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:mis_finanzas/controller/transaction_controller.dart';
import 'package:mis_finanzas/views/widgets/empty_list.dart';
import 'package:mis_finanzas/views/widgets/error_message.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constants/colors.dart';
import '../../model/transaction_model.dart';
import '../styles/add_transaction_style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final amountController = TextEditingController();

  final descriptionController = TextEditingController();
  Future<List<TransactionModel>>? future;

  @override
  void initState() {
    super.initState();
    future = Provider.of<TransactionController>(context, listen: false)
        .getTransactions(
            'All',
            Provider.of<TransactionController>(context, listen: false)
                .currentDate
                .month);
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: homePageGradient),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'balanceText'.tr,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: 'EGP').format(
                      Provider.of<TransactionController>(context)
                          .currentBalance),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          Consumer<TransactionController>(
            builder: (context, provider, child) {
              return TableCalendar(
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonVisible: false,
                ),
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false, outsideDaysVisible: false),
                rowHeight: 0,
                daysOfWeekVisible: false,
                focusedDay: provider.currentDate,
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2024, 1, 1),
                onPageChanged: (date) {
                  provider.changeDate(date);
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Text(
                    'yourTransactionsText'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder<List<TransactionModel>>(
            future: future,
            builder: (context, snapshot) {

              return snapshot.hasData?
                  Provider.of<TransactionController>(context,listen: false).list.isEmpty
                      ? EmptyList(text: 'emptyListText'.tr,)
                      : ListView.separated(
                          itemCount: Provider.of<TransactionController>(context)
                              .list
                              .length,
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 10,
                              thickness: 5,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Provider.of<TransactionController>(
                                              context)
                                          .list[index]
                                          .tType ==
                                      'Withdraw'
                                  ? Image.asset(
                                      'assets/images/withdraw.png',
                                    )
                                  : Image.asset('assets/images/deposit.png'),
                              title: Text(
                                  Provider.of<TransactionController>(context)
                                      .list[index]
                                      .tName!),
                              subtitle: Text(DateFormat.yMd()
                                  .format(Provider.of<TransactionController>(
                                          context)
                                      .list[index]
                                      .tDate!)
                                  .toString()),
                              trailing: Text(
                                  NumberFormat.currency(symbol: 'EGP').format(
                                      Provider.of<TransactionController>(
                                              context)
                                          .list[index]
                                          .tAmount!)),
                            );
                          },
                        )
                  : snapshot.hasError
                      ? ErrorScreen(errorText: snapshot.error.toString(),)
                      : Center(child: CircularProgressIndicator(
                strokeWidth: 10,
                            valueColor:
                            AlwaysStoppedAnimation(Colors.green),
                            backgroundColor: Colors.blue,
              ));
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Dialogs.materialDialog(
              titleStyle: TextStyle(fontSize: 20, color: Colors.white),
              color: Colors.blue,
              title: 'AddTransaction'.tr,
              actions: [
                Consumer<TransactionController>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: amountController,
                          decoration:
                              dialogFormField(labelText: 'EnterAmount'.tr),
                        ),
                        RadioListTile<int>(
                            activeColor: Colors.white,
                            title: Text('DepositRadioButton'.tr,
                                style: TextStyle(color: Colors.white)),
                            value: 1,
                            groupValue: provider.radioValue,
                            onChanged: (newVal) {
                              provider.selectedValue(newVal!);
                            }),
                        RadioListTile<int>(
                            activeColor: Colors.white,
                            title: Text(
                              'WithdrawRadioButton'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 2,
                            groupValue: provider.radioValue,
                            onChanged: (newVal) {
                              provider.selectedValue(newVal!);
                            }),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: descriptionController,
                          decoration: dialogFormField(labelText: 'DescriptionText'.tr),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('CancelButton'.tr),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                provider
                                    .addTransaction(
                                      TransactionModel(
                                        tName:
                                            descriptionController.text.trim(),
                                        tAmount:
                                            double.parse(amountController.text),
                                        tDate: DateTime.now(),
                                        tType: provider.radioValue == 1
                                            ? 'Deposit'
                                            : 'Withdraw',
                                      ),
                                    )
                                    .then((value) => Navigator.pop(context));
                                amountController.clear();
                                descriptionController.clear();
                              },
                              child: Text('ConfirmButton'.tr),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ],
              context: context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
