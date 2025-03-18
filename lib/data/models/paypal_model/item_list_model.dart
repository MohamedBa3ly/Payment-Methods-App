class ItemModel {
  final String name;
  final int quantity;
  final double price;
  final String currency;

  ItemModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      quantity: json['quantity'],
      price: double.parse(json['price']),
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price.toString(),
      'currency': currency,
    };
  }
}

class ItemListModel {
  final List<ItemModel> items;

  ItemListModel({required this.items});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<ItemModel> itemsList = list.map((i) => ItemModel.fromJson(i)).toList();

    return ItemListModel(items: itemsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
