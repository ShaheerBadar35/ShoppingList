import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => NewItem()),
    );
    if (newItem == null) {
      return;
    }
    _groceryItems.add(newItem);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No item added yet.!"),
    );
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceryItems[index].category.color,
          ),
          trailing: Text(groceryItems[index].quantity.toString()),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries!'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
