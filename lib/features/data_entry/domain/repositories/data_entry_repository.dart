import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';

abstract class DataEntryRepository {
  Future<void> addDataToLocalRepository({required DataEntryDevoteeModel data});
}
