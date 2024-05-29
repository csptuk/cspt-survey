import 'package:csspt_app/devotee_model.dart';
import 'package:csspt_app/features/home/presentation/views/home_view.dart';
import 'package:csspt_app/firebase_options.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(DevoteeModelAdapter());

  await sl.get<LocalHive>().create();

  runApp(const CSPTSurveyApp());
}

class CSPTSurveyApp extends StatelessWidget {
  const CSPTSurveyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void onPopInvoked(value) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      title: "CSPT Survey",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PopScope(
        canPop: false,
        onPopInvoked: onPopInvoked,
        child: const SafeArea(
          child: HomeView(),
        ),
      ),
    );
  }
}
