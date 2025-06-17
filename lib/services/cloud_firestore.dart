import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class CloudFirestore {
  CloudFirestore._();
  static final instance = CloudFirestore._();
  Future<void> set_data({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final ref = FirebaseFirestore.instance.doc(path);
    debugPrint('requst data   $data');
    await ref.set(data);
  }

  Future<void> delete_data({required String path}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    debugPrint("thpathto delete is$path");
    await ref.delete();
  }

  Stream<T> document_stream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String doc_id) builder,
  }) {
    final ref = FirebaseFirestore.instance.doc(path);
    final snaopshots = ref.snapshots();
    return snaopshots.map(
      (snaopshots) => builder(snaopshots.data(), snaopshots.id),
    );
  }

  Stream<List<T>> colection_stream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String doc_id) builder,
    Query Function(Query query)? query_builder,
    Function(T rhs, T lfs)? sort,
  }) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (query_builder != null) {
      query = query_builder(query);
    }
    final snapshot = query.snapshots();
    return snapshot.map((snapshot) {
      final result =
          snapshot.docs
              .map(
                (snapshot) => builder(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                ),
              )
              .where((value) => value != null)
              .toList();

      if (sort != null) {
        sort(result.first, result.last);
      }
      return result;
    });
  }
}
