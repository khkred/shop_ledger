import 'package:flutter/material.dart';
import 'package:shop_ledger/add_transaction_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Get Changes in database and update the app.

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
