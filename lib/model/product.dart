import 'package:takiro_store/utilities/image.dart';

class Product {
  final String id; // Unique identifier for the product
  final int price;
  final String name;
  final String category;
  final String imageUrl;
  final int? discount;
  final int? rating; // Optional rating field
  final int? numberOfReviews;
  final String? description;  // Default value for number of reviews
  // Constructor to initialize the product
  bool is_favorite;
  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.category,
    required this.imageUrl,
    this.discount,
    this.rating,
    this.numberOfReviews,
    this.description,
    this.is_favorite = false, // Default value for number of reviews
  });

  factory Product.fromMap(Map<String, dynamic>? map, String doc_id) {
    return Product(
      id: doc_id,
      price: map?['price'] is int ? map!['price'] as int : 0,
      name: map?['name'] as String? ?? '',
      category: map?['category'] as String? ?? '',
      imageUrl: map?['imageUrl'] as String? ?? '',
      discount: map?['discount'] as int?,
      rating: map?['rating'] as int?,
      numberOfReviews: map?['numberOfReviews'] as int?,
      description: map?['description'] as String? ,
      is_favorite: map?['is_favorite'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'discount': discount,
      'rating': rating,
      'numberOfReviews': numberOfReviews,
      'description' : description,
      'is_favorite': is_favorite,
    };
  }
}
