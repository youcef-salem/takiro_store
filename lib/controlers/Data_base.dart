import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/services/cloud_firestore.dart';

abstract class DataBase {
  Stream<List<Product>> stream_product();
}

class fire_store_db implements DataBase {
  final cloud_fire = CloudFirestore.instance;

  @override
  Stream<List<Product>> stream_product() =>
  //i can do the builder : (data!,document_id)=> Product.fromMap(data,document_id)
      cloud_fire.colection_stream(path: "products/", builder: Product.fromMap);





}
