import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/data_base_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _supbase = Supabase.instance.client;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documnetId,
  }) async {
    if (documnetId != null) {
      await firestore.collection(path).doc(documnetId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  // @override
  // Future<dynamic> getData({
  //   required String path,
  //   String? documentId,
  //   Map<String, dynamic>? query,
  //   bool supabase = false,
  // }) async {
  //   print("Fetching data from: $path"); // Debugging: Print the path
  //   if (supabase) {
  //     PostgrestTransformBuilder<PostgrestList> data =
  //         _supbase.from(path).select('*');
  //     if (query != null) {
  //       if (query['orderBy'] != null) {
  //         var orderByField = query['orderBy'];
  //         var isDesending = query['descending'] ?? false;
  //         data = data.order(orderByField, ascending: !isDesending);
  //       }
  //       if (query['limit'] != null) {
  //         var limit = query['limit'];
  //         data = data.limit(limit);
  //       }
  //     }
  //     var response = await data;
  //     print(
  //       "Response from Supabase: $response",
  //     ); // Debugging: Print the response
  //     return response;
  //   }
  //   if (documentId != null) {
  //     var data = await firestore.collection(path).doc(documentId).get();
  //     print(
  //         "Firestore document data: ${data.data()}"); // Debugging: Print Firestore data
  //     return data.data() as Map<String, dynamic>;
  //   } else {
  //     var data = await firestore.collection(path).get();
  //     print(
  //         "Firestore collection data: ${data.docs.map((e) => e.data()).toList()}"); // Debugging: Print Firestore data
  //     return data.docs.map((e) => e.data()).toList();
  //   }
  // }
  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
    bool supabase = true,
  }) async {
    print("Fetching data from: $path (Supabase: $supabase)");

    try {
      if (supabase) {
        PostgrestTransformBuilder<PostgrestList> data =
            _supbase.from(path).select('*');

        if (query != null) {
          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var isDescending = query['ascending'] ?? false;
            data = data.order(orderByField, ascending: !isDescending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'];
            data = data.limit(limit);
          }
        }

        var response = await data;
        print("✅ Response from Supabase: $response");
        return response;
      } else {
        if (documentId != null) {
          var data = await firestore.collection(path).doc(documentId).get();
          print("Firestore document data: ${data.data()}");
          return data.data() as Map<String, dynamic>;
        } else {
          var data = await firestore.collection(path).get();
          print(
              "Firestore collection data: ${data.docs.map((e) => e.data()).toList()}");
          return data.docs.map((e) => e.data()).toList();
        }
      }
    } catch (e) {
      print("❌ Error fetching data: $e");
      return null;
    }
  }

  @override
  Future<bool> checkDataExixts({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
