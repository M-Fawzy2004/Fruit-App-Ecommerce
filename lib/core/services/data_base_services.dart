abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documnetId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
  });

  Future<bool> checkDataExixts({
    required String path,
    required String documentId,
  });
}
