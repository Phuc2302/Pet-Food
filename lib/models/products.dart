class ProductsModel {
  static List<Item> items;

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  // Xây dựng một items mới từ cấu trúc map
  factory Item.fromJon(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      price: json["price"],
      color: json["color"],
      image: json["image"],
    );
  }
  // Chuyển đổi item (instance into a map)
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
