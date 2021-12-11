class Product {
  int? id;
  String? name;
  String? description;
  int? off;
  String? imageURL;

  Product({this.id, this.name, this.description, this.off, this.imageURL});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    off = json['off'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['off'] = off;
    data['imageURL'] = imageURL;

    return data;
  }
}
