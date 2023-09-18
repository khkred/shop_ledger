import 'package:flutter/material.dart';
import 'package:shop_ledger/add_transaction_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Shop Ledger'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.person))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTransactionScreen()),
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
