import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/services/cloud_firestore.dart';

abstract class DataBase {
  Stream<List<Product>> stream_product();
}

class fire_store_db implements DataBase {
  final String uuid;
  final cloud_fire = CloudFirestore.instance;
  fire_store_db({required this.uuid});
  @override
  Stream<List<Product>> stream_product() =>
  //i can do the builder : (data!,document_id)=> Product.fromMap(data,document_id)
  cloud_fire.colection_stream(path: "products/", builder :(data ,document_id) => Product.fromMap(data!,document_id) );
}
