import 'package:flutter/material.dart';
import 'package:shop_ledger/models/transaction.dart';


class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {

  final _formKey = GlobalKey<FormState>();
  String name = '';
  double amount = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Builder(
          builder: (context) => Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Amount'),
                    validator: (value) {
                      if(value == null || value.isEmpty)
                        {
                          return 'Please Enter a value';
                        }
                    }
                  ),

                  TextFormField(
                    decoration:  const InputDecoration(labelText: 'Item'),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){

                        }
                      }, child: const Text('Submit'))
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
