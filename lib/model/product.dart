import 'package:takiro_store/utilities/image.dart';

class Product {

final String id ; // Unique identifier for the product
   final  int price;
   final String name ; 
   final String category ;
   final String imageUrl  ;
   final int? discount ;
   final int? rating; // Optional rating field
   final int? numberOfReviews ; // Default value for number of reviews
  // Constructor to initialize the product
 
 Product({
    required this.id,
    required this.price,
    required this.name,
    required this.category,
    required this.imageUrl,
     this.discount,
     this.rating,
    this.numberOfReviews , // Default value for number of reviews
  });

 factory Product.fromMap(Map<String, dynamic>? map,String doc_id) {
  return Product(
    id: doc_id,
    price: map?['price'] is int ? map!['price'] as int : 0,
    name: map?['name'] as String? ?? '',
    category: map?['category'] as String? ?? '',
    imageUrl: map?['imageUrl'] as String? ?? '',
    discount: map?['discount'] as int?,
    rating: map?['rating'] as int?,
    numberOfReviews: map?['numberOfReviews'] as int?,
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
  };
}


}




List<Product> products = [
  Product(
    id: '1',
    price: 100,
    name: 'Product 1',
    category: 'Category A',
    imageUrl: ImageUtil.img1web,
    discount: 10,
    rating: 4,
    numberOfReviews: 100, // Default value for number of reviews
  ),
  Product(
    id: '2',
    price: 200,
    name: 'Product 2',
    category: 'Category B',
    imageUrl: ImageUtil.img2web,
    discount: 20,
    rating: 5,
    numberOfReviews: 50, // Default value for number of reviews
  ),
  Product(
    id: '3',
    price: 150,
    name: 'Product 3',
    category: 'Category A',
    imageUrl: ImageUtil.img3web,
    discount: null, // No discount
    rating: null, // No rating
  ),
];

