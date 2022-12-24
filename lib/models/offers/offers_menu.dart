import 'dart:convert';

class OffersMenu {
  String imageUrl;
  String? id;

  OffersMenu({required this.imageUrl, this.id});

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory OffersMenu.fromMap(Map<String, dynamic> map) {
    return OffersMenu(imageUrl: map['imageUrl'] ?? '', id: map['id'] ?? ' ');
  }

  String toJson() => json.encode(toMap());

  factory OffersMenu.fromJson(String source) =>
      OffersMenu.fromMap(json.decode(source));
}
