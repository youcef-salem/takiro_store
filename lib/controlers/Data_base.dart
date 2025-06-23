import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/services/cloud_firestore.dart';
import 'package:takiro_store/utilities/api_path.dart';

abstract class DataBase {
  Stream<List<Product>> strream_pr_sales();
  Stream<List<Product>> strream_pr_new();
}

class fire_store_db implements DataBase {
  final String uuid;
  final cloud_fire = CloudFirestore.instance;
  fire_store_db({required this.uuid});
  @override
  Stream<List<Product>> strream_pr_sales() =>
  //i can do the builder : (data!,document_id)=> Product.fromMap(data,document_id)
  cloud_fire.colection_stream(
    path: ApiPath.products,
    builder: (data, document_id) => Product.fromMap(data!, document_id),
    query_builder: (query) => query.where('discount', isNotEqualTo: 0),
  );
  
  @override
  Stream<List<Product>> strream_pr_new() => cloud_fire.colection_stream(
    path: ApiPath.products,
    builder: (data, document_id) => Product.fromMap(data!, document_id),
   
  );
}
