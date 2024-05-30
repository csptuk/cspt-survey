import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_devotee_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';
import 'package:csspt_app/helper/string_casting_extension.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
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
    try {
      for (int i = 0; i < 5; i++) {
        volunteeringService[i]["value"] =
            texts[8 + i].trim().toLowerCase() == "yes" ? "Yes" : "";
      }
    } catch (e) {
      for (int i = 0; i < 5; i++) {
        volunteeringService[i]["value"] =
            row["volunteering"].trim().toLowerCase() == "yes" ? "Yes" : "";
      }
    }

    DevoteeModel devotee =
        DevoteeModel.fromJson(DataVisualizeDevoteeModel.fromJson(row)
            .copyWith(
              id: row["id"],
              firstName: texts.length > 1 ? texts[0] : row["first_name"],
              lastName: texts.length > 2 ? texts[1] : row["last_name"],
              email: texts.length > 3 ? texts[2] : row["email"],
              mobileNumber: texts.length > 4 ? texts[3] : row["mobile_number"],
              inGroup: texts.length > 5 ? texts[4] : row["in_group"],
              joinGroup: texts.length > 6 ? texts[5] : row["join_group"],
              picturesForSocialMedia: texts.length > 7
                  ? texts[6]
                  : row["pictures_for_social_media"],
              volunteering: texts.length > 8 ? texts[7] : row["volunteering"],
              volunteeringService: volunteeringService,
              sendToCloud: true,
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
  Future<String> uploadLocalData() async {
    if (!await _checkConnectivity()) return "Network not Connected";

    List<Map<String, dynamic>> localData = await fetchLocalDatabaseData();
    List<Map<String, dynamic>> cloudData =
        localData.map((e) => DevoteeModel.fromJson(e).toJson()).toList();

    cloudData = cloudData.where((e) => e["send_to_cloud"] == true).toList();

    for (var e in cloudData) {
      e["send_to_cloud"] = false;
      localHive.devoteeModel!.put(
          localData.firstWhere((ele) => ele["id"] == e["id"])["key"],
          DevoteeModel.fromJson(e));
      e.remove("send_to_cloud");
    }

    CollectionReference ref = firestore.collection("devotees");
    for (var doc in cloudData) {
      QuerySnapshot snapshot =
          await ref.where("id", isEqualTo: doc["id"]).get();

      if (snapshot.docs.length > 1) {
        await ref
            .doc(snapshot.docs.first.id)
            .update(doc.cast<String, dynamic>());
      } else {
        await ref.add(doc.cast<String, dynamic>());
      }
    }
    return "Uploaded to Cloud";
  }

  @override
  Future<String> exportCloudData() async {
    if (!await _checkConnectivity()) return "Network not Connected";

    CollectionReference ref = firestore.collection("devotees");
    QuerySnapshot snapshot = await ref.get();

    final List<Map<String, dynamic>> cloudData = snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .cast<Map<String, dynamic>>();

    await _exportToExcel(
      data: cloudData,
      isCloud: true,
    );

    return "Exported Cloud Data";
  }

  @override
  Future<String> exportLocalData() async {
    await _exportToExcel(
      data: await fetchLocalDatabaseData(),
      isCloud: false,
    );
    return "Exported Local Data";
  }

  Future<bool> _checkConnectivity() async {
    Connectivity connectivity = Connectivity();
    List<ConnectivityResult> result = await connectivity.checkConnectivity();

    if (result.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }

  Future<void> _exportToExcel(
      {required List<Map<String, dynamic>> data, required bool isCloud}) async {
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

    int column = 0;
    int row = 0;
    while (row <= data.length) {
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
            cell.value = TextCellValue(field.value != "id"
                ? data[row - 1][field.value].toString().toTitleCase()
                : data[row - 1][field.value].toString());
          } else {
            cell.value = TextCellValue(data[row - 1]["volunteering_service"]
                    [int.parse(field.value!)]["value"]
                .toString()
                .toTitleCase());
          }
          column++;
        }
      }
      row++;
    }

    await Permission.storage.request();

    final directory = await getDownloadDirectory();

    String fileName =
        "CSPT-Survey-${isCloud ? "cloud" : "local"}-${DateFormat("yyyy-MM-dd").format(DateTime.now())}.xlsx";

    String path = "${directory.path}/$fileName";

    List<int> excelFileBytes = excel.save(fileName: fileName)!;

    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excelFileBytes);
  }
}
