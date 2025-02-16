import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/errors/custom_exception.dart';
import 'package:e_commerce_app/core/services/data_base_services.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final supbase = Supabase.instance.client;
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

  // get data auth firebase
  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        var data = await firestore.collection(path).doc(documentId).get();
        return data.data() as Map<String, dynamic>;
      } else {
        var data = await firestore.collection(path).get();
        return data.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      throw CustomException(
        message: LocaleKeys.FirbaseExecption_serverFailure.tr(),
      );
    }
  }

  // get data supabase
  @override
  Future getDataSupbase({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      PostgrestTransformBuilder<PostgrestList> data =
          supbase.from(path).select('*');

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
      return response;
    } catch (e) {
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
