import 'package:flutter/material.dart';
import 'package:recipe_app_/pages/splash.page.dart';
import 'package:recipe_app_/services/prefrences.service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var preference = await SharedPreferences.getInstance();

    GetIt.I.registerSingleton<SharedPreferences>(preference);

    // if (PrefrencesService.prefs != null) {
    //   print(
    //       '========================= prefrences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Hellix',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffF55A00),
          primary: Color(0xffF55A00),
        ),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
