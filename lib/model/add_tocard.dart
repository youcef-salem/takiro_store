// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddTocard {
  int quantity;
  final String color;
  final String size;
  final String id; // Unique identifier for the product
  final int price;
  final String name;
  final String category;
  final String imageUrl;
  final int discount;
  final String pr_id;
  AddTocard({
    this.quantity = 1,
    this.color = 'black',
    required this.size,
    required this.id,
    required this.price,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.pr_id,
    this.discount = 0,
  });

  AddTocard copyWith({
    int? quantity,
    String? color,
    String? size,
    String? id,
    int? price,
    String? name,
    String? category,
    String? imageUrl,
    int? discount,
    String? pr_id
  }) {
    return AddTocard(
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      pr_id: pr_id?? this.pr_id ,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'color': color,
      'size': size,
      'id': id,
      'price': price,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'pr_id' : pr_id,
      'discount': discount,
    };
  }

  factory AddTocard.fromMap(Map<String, dynamic> map, String doc_id) {
    return AddTocard(
      quantity: map['quantity'] as int,
      color: map['color'] as String,
      size: map['size'] as String,
      id: doc_id,
      price: map['price'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      pr_id: map['pr_id'] as String,
      discount: map['discount'] as int,
    );
  }

  @override
  String toString() {
    return 'AddTocard(quantity: $quantity, color: $color, size: $size, id: $id, price: $price, name: $name, category: $category, imageUrl: $imageUrl, discount: $discount)';
  }

  @override
  bool operator ==(covariant AddTocard other) {
    if (identical(this, other)) return true;

    return other.quantity == quantity &&
        other.color == color &&
        other.size == size &&
        other.id == id &&
        other.price == price &&
        other.name == name &&
        other.category == category &&
        other.imageUrl == imageUrl &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return quantity.hashCode ^
        color.hashCode ^
        size.hashCode ^
        id.hashCode ^
        price.hashCode ^
        name.hashCode ^
        category.hashCode ^
        imageUrl.hashCode ^
        discount.hashCode;
  }
}
