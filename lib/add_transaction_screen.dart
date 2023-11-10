import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:shop_ledger/models/database.dart';


class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {

  final _formKey = GlobalKey<FormState>();

  final _amountController = TextEditingController();
  final _itemNameController = TextEditingController();


  void _submit() async {
    final database = AppDatabase();
    if (_formKey.currentState!.validate()) {
      print("AMOUNT ENTERED: ${_amountController.text}");
      int amount = int.parse(_amountController.text);
      if (_itemNameController.text.isEmpty) {
        await database.into(database.transactionItems).insert(
            TransactionItemsCompanion.insert(amount: amount));
      } else {
        String item = _itemNameController.text.toString();
        await database.into(database.transactionItems).insert(
            TransactionItemsCompanion.insert(amount: amount, item: drift.Value(item)));
      }
    }
    List<TransactionItem> allItems = await database.select(
        database.transactionItems).get();

    print('Items in database: $allItems');
  }


  @override
  void dispose() {
    _amountController.dispose();
    _itemNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Builder(
          builder: (context) =>
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Amount'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a value';
                            }
                            return null;
                          }

                      ),

                      TextFormField(
                        controller: _itemNameController,
                        decoration: const InputDecoration(labelText: 'Item'),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: () {
                            _submit();
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
