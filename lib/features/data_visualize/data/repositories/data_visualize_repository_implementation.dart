import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_devotee_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';
import 'package:csspt_app/helper/string_casting_extension.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DataVisualizeRepositoryImplementation implements DataVisualizeRepository {
  final LocalHive localHive = sl.get<LocalHive>();
  final firestore = FirebaseFirestore.instance;

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

  @override
  Future<void> uploadLocalData() async {
    List<Map<String, dynamic>> localData = await fetchLocalDatabaseData();
    List<Map<String, dynamic>> cloudData =
        localData.map((e) => DevoteeModel.fromJson(e).toJson()).toList();

    print(cloudData);
  }

  @override
  Future<void> exportCloudData() async {}

  @override
  Future<void> exportLocalData() async {
    Excel excel = Excel.createExcel();

    excel.rename("Sheet1", "Devotee");
    Sheet sheetObject = excel["Devotee"];

    List<DataVisualizeColumnModel> columns = const [
      DataVisualizeColumnModel(title: "Date", value: "date"),
      DataVisualizeColumnModel(title: "Id", value: "id"),
      DataVisualizeColumnModel(title: "First Name", value: "first_name"),
      DataVisualizeColumnModel(title: "Last Name", value: "last_name"),
      DataVisualizeColumnModel(title: "Email", value: "email"),
      DataVisualizeColumnModel(title: "Mobile Number", value: "mobile_number"),
      DataVisualizeColumnModel(title: "Already In Group", value: "in_group"),
      DataVisualizeColumnModel(title: "Join Group", value: "join_group"),
      DataVisualizeColumnModel(
          title: "Pics For Social Media", value: "pictures_for_social_media"),
      DataVisualizeColumnModel(title: "Volunteering", value: "volunteering"),
      DataVisualizeColumnModel(title: "Prep & Org Event", value: "0"),
      DataVisualizeColumnModel(
          title: "Prasad Prep / Serve / Inv main", value: "1"),
      DataVisualizeColumnModel(title: "Fund Raising", value: "2"),
      DataVisualizeColumnModel(title: "Front Desk", value: "3"),
      DataVisualizeColumnModel(title: "Social Media", value: "4"),
    ];
    List<Map<String, dynamic>> localData = await fetchLocalDatabaseData();

    int column = 0;
    int row = 0;
    while (row <= localData.length) {
      column = 0;
      if (row == 0) {
        for (var field in columns) {
          var cell = sheetObject.cell(
              CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row));
          cell.value = TextCellValue(field.title!);
          column++;
        }
      } else {
        for (var field in columns) {
          var cell = sheetObject.cell(
              CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row));
          if (int.tryParse(field.value!) == null) {
            cell.value = TextCellValue(
                localData[row - 1][field.value].toString().toTitleCase());
          } else {
            cell.value = TextCellValue(localData[row - 1]
                    ["volunteering_service"][int.parse(field.value!)]["value"]
                .toString()
                .toTitleCase());
          }
          column++;
        }
      }
      row++;
    }

    await Permission.storage.request();

    final directory = await getDownloadsDirectory();

    String fileName =
        "CSPT-Survey-${DateFormat("yyyy-MM-dd").format(DateTime.now())}.xlsx";

    String path = "${directory!.path}/$fileName";

    List<int> excelFileBytes = excel.save(fileName: fileName)!;

    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excelFileBytes);
  }
}
