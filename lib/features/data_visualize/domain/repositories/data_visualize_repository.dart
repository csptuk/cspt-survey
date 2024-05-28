abstract class DataVisualizeRepository {
  Future<List<Map<String, dynamic>>> fetchLocalDataBaseData();

  Future<void> deleteData({required int key});
}
