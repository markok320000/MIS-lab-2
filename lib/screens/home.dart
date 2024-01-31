import 'package:flutter/material.dart';
import 'package:lab_2/constants/colors.dart';
import 'package:lab_2/widgets/shopping_item.dart';

import '../model/shoppingItem.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final shoppingItemList = ShoppingItemModel.shoppingItemList();
  final _toDoController = TextEditingController();
  List<ShoppingItemModel> _foundShoppingItems = [];

  @override
  void initState() {
    super.initState();
    _foundShoppingItems = shoppingItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "All Clothing",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ShoppingItemModel shoppingItem
                        in _foundShoppingItems.reversed)
                      ShoppingItem(
                        shoppingItem: shoppingItem,
                        onDeleteItem: _handleDeleteItem,
                        editItem: _editItem,
                      )
                  ],
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _toDoController,
                    decoration: const InputDecoration(
                      hintText: "Add Clothing",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 40, color: Colors.red),
                  ),
                  onPressed: () {
                    _handleAddItem(_toDoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(50, 50),
                    elevation: 10,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              child: Image.asset('assets/images/avatar.png'),
            ),
          )
        ],
      ),
    );
  }

  void _handleDeleteItem(String id) {
    setState(() {
      shoppingItemList.removeWhere((element) => element.id == id);
    });
  }

  void _handleAddItem(String text) {
    setState(() {
      shoppingItemList.add(ShoppingItemModel(
        id: DateTime.now().toString(),
        shoppingItemText: text,
      ));
    });
    _toDoController.clear();
  }

  void _runFilter(String keyword) {
    List<ShoppingItemModel> results = [];
    if (keyword.isEmpty) {
      results = shoppingItemList;
    } else {
      results = shoppingItemList
          .where((item) => item.shoppingItemText!
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundShoppingItems = results;
    });
  }

  void _editItem(String newTitle, String itemID) {
    print("Runs");
    setState(() {
      var item = shoppingItemList.firstWhere((item) => item.id == itemID);
      item.shoppingItemText = newTitle;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdblack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: tdGrey,
          ),
        ),
      ),
    );
  }
}
