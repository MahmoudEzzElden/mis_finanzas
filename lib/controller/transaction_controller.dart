import 'package:flutter/material.dart';
import 'package:mis_finanzas/model/transaction_model.dart';
import 'package:mis_finanzas/services/database_helper.dart';

class TransactionController with ChangeNotifier{

  DateTime currentDate = DateTime.now();
  List<TransactionModel> list=[];
  int radioValue=1;
  double currentBalance=0;


  selectedValue(int newValue){
radioValue=newValue;
notifyListeners();
  }
  changeDate(DateTime newDate)async{
    currentDate=newDate;
   await getTransactions('All',currentDate.month);
    notifyListeners();
  }

  Future<List<TransactionModel>> getTransactions(String transactionType,int currentMonth)async{


    list = await DataBaseHandler.instance.getAllTransactions();
    if(transactionType=='All'){
    }
    else{
      list=list.where((element) => element.tType==transactionType).toList();
    }

    list = list.where((element) {
      return
      element.tDate!.month==currentMonth;
    },).toList();
    getTotalBalance();
    notifyListeners();
    return list;
  }

    getTotalBalance(){
    currentBalance=0;
    for(var transaction in list){
      if(transaction.tType=='Deposit'){
        currentBalance+=transaction.tAmount!;
      }
      else{
        currentBalance-=transaction.tAmount!;
      }
      notifyListeners();
    }
}
  Future<void> addTransaction(TransactionModel transactionModel) async {
   try{
    await DataBaseHandler.instance
        .addTransaction(transactionModel).then((value) =>
        getTransactions('All',currentDate.month));
        } catch  (e){

print(e);
    }
    notifyListeners();
  }

}