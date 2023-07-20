// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoodModel{
   static List<Item> items = [
  ];
}

class Item {
  final String? name;
   final String? image;

  Item(
    this.name,
    this.image,
  );

  Item copyWith({
    String? name,
    String? image,
  }) {
    return Item(
      name ?? this.name,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['name'] != null ? map['name'] as String : null,
      map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(name: $name, image: $image)';

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
