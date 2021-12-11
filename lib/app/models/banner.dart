class BannerData {
  int? id;
  String? name;
  String? description;
  String? imageURL;

  BannerData({this.id, this.name, this.description, this.imageURL});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageURL'] = imageURL;

    return data;
  }
}
