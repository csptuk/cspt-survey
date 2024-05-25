import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';
import 'package:csspt_app/features/home/domain/repositories/home_repository.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:uuid/uuid.dart';

class HomeRepositoryImplementation implements HomeRepository {
  @override
  Future<void> addDataToLocalRepository(
      {required HomeDevoteeModel data}) async {
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
