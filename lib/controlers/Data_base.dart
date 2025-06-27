import 'package:takiro_store/model/add_tocard.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/model/user_data.dart';
import 'package:takiro_store/services/cloud_firestore.dart';
import 'package:takiro_store/utilities/api_path.dart';

abstract class DataBase {
  Stream<List<Product>> strream_pr_sales();
  Stream<List<Product>> strream_pr_new();
  Future<void> set_user_data(UserData data);
  Future<void> add_tocard(AddTocard add_tocard);
}

class fire_store_db implements DataBase {
  final String uuid;
  final cloud_fire = CloudFirestore.instance;

  fire_store_db({required this.uuid}) {
    if (uuid.isEmpty) {
      throw Exception('User ID cannot be empty');
    }
  }

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
  Future<void> togle_fav(Product pr) async {
    pr.is_favorite = !pr.is_favorite;
    await cloud_fire.set_data(
      path: '${ApiPath.products}${pr.id}/',
      data: pr.toMap(),
    );
  }

  @override
  Future<void> set_user_data(UserData data) async {
    if (uuid.isEmpty) {
      throw Exception('Cannot set user data: User is not logged in');
    }
    await cloud_fire.set_data(path: ApiPath.User(uuid), data: data.toMap());
  }

  @override
  Future<void> add_tocard(AddTocard add_tocard) async {
    if (uuid.isEmpty) {
      throw Exception('Cannot add to cart: User is not logged in');
    }
    await cloud_fire.set_data(
      path: ApiPath.Add_tocard(uuid, add_tocard.id),
      data: add_tocard.toMap(),
    );
  }
}
