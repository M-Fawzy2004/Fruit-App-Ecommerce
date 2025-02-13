abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documnetId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
    bool supabase,
  });

  Future<bool> checkDataExixts({
    required String path,
    required String documentId,
  });
}
