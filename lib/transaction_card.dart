import 'package:flutter/material.dart';
import 'package:shop_ledger/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({required this.transaction,super.key});

  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return  Row(
     children: [
       Text(transaction.name,style: const TextStyle(
         fontSize: 16,
       ),),
       Text(transaction.amount.toString(),style: const TextStyle(
         fontSize: 16,
         fontWeight: FontWeight.bold,
         color: Colors.red,
       ),)
     ],
    );
  }
}
