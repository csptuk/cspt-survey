import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';

abstract class HomeRepository {
  Future<void> addDataToLocalRepository({required HomeDevoteeModel data});
}
