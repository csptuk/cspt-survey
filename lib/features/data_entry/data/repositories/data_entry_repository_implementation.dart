import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/domain/repositories/data_entry_repository.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:uuid/uuid.dart';

class DataEntryRepositoryImplementation implements DataEntryRepository {
  @override
  Future<void> addDataToLocalRepository(
      {required DataEntryDevoteeModel data}) async {
    LocalHive localHive = sl.get<LocalHive>();

    Map<String, dynamic> devoteeModelJson =
        DevoteeModel.fromJson(data.toJson()).toJson();

    devoteeModelJson["date"] = DateTime.now();
    devoteeModelJson["id"] = const Uuid().v4();

    DevoteeModel devotee = DevoteeModel.fromJson(devoteeModelJson);

    localHive.devoteeModel!.add(devotee);
    localHive.devoteeModel!.clear();
  }
}