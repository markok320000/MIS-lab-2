import 'package:flutter/material.dart';
import 'package:lab_2/constants/colors.dart';
import 'package:lab_2/model/shoppingItem.dart';
import 'package:lab_2/widgets/shopping_item.dart';

class EditScreen extends StatefulWidget {
  final Function(String, String) onEditItem;
  final ShoppingItemModel shoppingItem;

  EditScreen({Key? key, required this.onEditItem, required this.shoppingItem})
      : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: const Text("Edit Item"),
      ),
      body: Center(
        child: Column(
          children: [
            searchBox(),
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            'Are you sure you want to edit this item name?',
                            style: TextStyle(color: Colors.blue)),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            widget.onEditItem(
                                titleController.text, widget.shoppingItem.id!);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  widget.onEditItem(titleController.text,
                                      widget.shoppingItem.id!);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No',
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: Text('Edit Item'),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: titleController, // Assign titleController to the TextField
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.edit,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: widget.shoppingItem.shoppingItemText!,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
