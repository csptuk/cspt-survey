abstract class DataVisualizeRepository {
  Future<List<Map<String, dynamic>>> fetchLocalDatabaseData();

  Future<List<Map<String, dynamic>>> modifyLocalDatabaseData(
      {required int key,
      required List<String> texts,
      required Map<String, dynamic> row});

  Future<void> deleteData({required int key});
}
