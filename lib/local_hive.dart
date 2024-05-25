import 'package:csspt_app/devotee_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalHive {
  Box<DevoteeModel>? devoteeModel;

  Future<void> create() async {
    devoteeModel = await Hive.openBox<DevoteeModel>("devotee_box");
  }

  Future<void> close() async {
    devoteeModel!.close();
  }
}
