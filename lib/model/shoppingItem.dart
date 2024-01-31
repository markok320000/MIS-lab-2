class ShoppingItemModel {
  String? id;
  String? shoppingItemText;

  ShoppingItemModel({
    required this.id,
    required this.shoppingItemText,
  });

  static List<ShoppingItemModel> shoppingItemList() {
    return [
      ShoppingItemModel(
        id: '1',
        shoppingItemText: 'Scarf',
      ),
      ShoppingItemModel(
        id: '2',
        shoppingItemText: 'T-shirt',
      ),
      ShoppingItemModel(
        id: '3',
        shoppingItemText: 'Shoes',
      ),
    ];
  }
}
