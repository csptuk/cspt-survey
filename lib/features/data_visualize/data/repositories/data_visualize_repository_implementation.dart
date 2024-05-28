import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_devotee_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';
import 'package:csspt_app/helper/string_casting_extension.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';

class DataVisualizeRepositoryImplementation implements DataVisualizeRepository {
  LocalHive localHive = sl.get<LocalHive>();

  @override
  Future<List<Map<String, dynamic>>> fetchLocalDatabaseData() async {
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
  Future<List<Map<String, dynamic>>> modifyLocalDatabaseData(
      {required int key,
      required List<String> texts,
      required Map<String, dynamic> row}) async {
    texts = texts.map((e) => e.trim().toTitleCase()).toList();

    List<Map<String, dynamic>> volunteeringService =
        row["volunteering_service"];
    for (int i = 0; i < 5; i++) {
      volunteeringService[i]["value"] =
          texts[8 + i].trim().toLowerCase() == "yes" ? true : false;
    }

    DevoteeModel devotee =
        DevoteeModel.fromJson(DataVisualizeDevoteeModel.fromJson(row)
            .copyWith(
              id: row["id"],
              firstName: texts[0],
              lastName: texts[1],
              email: texts[2],
              mobileNumber: texts[3],
              inGroup: texts[4],
              joinGroup: texts[5],
              picturesForSocialMedia: texts[6],
              volunteering: texts[7],
              volunteeringService: volunteeringService,
            )
            .toJson());

    await localHive.devoteeModel!.put(key, devotee);

    return fetchLocalDatabaseData();
  }

  @override
  Future<void> deleteData({required int key}) async {
    await localHive.devoteeModel!.delete(key);
  }
}
