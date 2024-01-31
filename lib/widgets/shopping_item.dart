import 'package:flutter/material.dart';
import 'package:lab_2/constants/colors.dart';
import 'package:lab_2/model/shoppingItem.dart';
import 'package:lab_2/screens/edit_screen.dart';

class ShoppingItem extends StatelessWidget {
  final ShoppingItemModel shoppingItem;
  final onDeleteItem;
  final editItem;
  const ShoppingItem(
      {Key? key,
      required this.shoppingItem,
      required this.onDeleteItem,
      required this.editItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        title: Text(
          shoppingItem.shoppingItemText!,
          style: TextStyle(
            fontSize: 16,
            color: tdblack,
          ),
        ),
        trailing: Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  color: Colors.red,
                  iconSize: 18,
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // onDeleteItem(shoppingItem.id!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                            onEditItem: editItem,
                            shoppingItem: shoppingItem,
                          ),
                        ));
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  color: Colors.red,
                  iconSize: 18,
                  icon: Icon(Icons.delete),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Delete this Item?',
                                style: TextStyle(color: Colors.blue)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    onDeleteItem(shoppingItem.id!);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Yes',
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
