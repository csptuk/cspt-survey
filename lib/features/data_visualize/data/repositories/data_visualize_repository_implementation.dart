import 'package:csspt_app/features/data_visualize/data/models/data_visualize_devotee_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';

class DataVisualizeRepositoryImplementation implements DataVisualizeRepository {
  LocalHive localHive = sl.get<LocalHive>();

  @override
  Future<List<Map<String, dynamic>>> fetchLocalDataBaseData() async {
    List<Map<String, dynamic>> localData = [];

    for (var key in localHive.devoteeModel!.keys) {
      localData.add(DataVisualizeDevoteeModel.fromJson({
        "key": key,
        ...localHive.devoteeModel?.get(key)?.toJson() ?? {},
        "edit_state": false,
      }).toJson());
    }

    localData.sort((a, b) => b["date"].compareTo(a["date"]));

    return localData;
  }

  @override
  Future<void> deleteData({required int key}) async {
    await localHive.devoteeModel!.delete(key);
  }
}
