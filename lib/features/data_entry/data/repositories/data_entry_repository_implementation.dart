import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/data_entry/domain/repositories/data_entry_repository.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:uuid/uuid.dart';

class DataEntryRepositoryImplementation implements DataEntryRepository {
  @override
  Future<void> addDataToLocalRepository(
      {required Map<String, dynamic> data}) async {
    LocalHive localHive = sl.get<LocalHive>();

    Map<String, dynamic> devoteeModelJson =
        DevoteeModel.fromJson(data).toJson();

    devoteeModelJson["date"] = DateTime.now();
    devoteeModelJson["id"] = const Uuid().v4();
    devoteeModelJson["send_to_cloud"] = true;

    DevoteeModel devotee = DevoteeModel.fromJson(devoteeModelJson);

    await localHive.devoteeModel?.add(devotee);
  }
}
