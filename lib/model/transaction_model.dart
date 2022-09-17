



import '../core/constants/db_constants.dart';

class TransactionModel {
  final int? id;
  final String? tName;
  final String? tType;
  //final int? tAmount;
  final double? tAmount;
  final DateTime? tDate;

  TransactionModel({this.id, this.tName, this.tType, this.tAmount, this.tDate});

  Map<String, dynamic> toMap() {
    return {
      transactionID: id,
      transactionName: tName,
      transactionType: tType,
      transactionAmount: tAmount,
      transactionDate: tDate!.toIso8601String(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map[transactionID],
      tName: map[transactionName],
      tType: map[transactionType] ,
      tAmount: map[transactionAmount],
      tDate: DateTime.parse(map[transactionDate].toString()),
    );
  }
}
