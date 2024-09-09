import 'package:flutter/material.dart';
import 'package:flutter_application_4/homescreen.dart';
import 'package:flutter_application_4/my_theme_data.dart';
import 'package:flutter_application_4/providers/app_congfig_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCE8u24FhOd6wAfowfCrY7GuV0z88LuuOA',
          appId: 'com.example.flutter_application_4',
          messagingSenderId: '169781421182',
          projectId: 'flutter1-274c2'));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => AppConfigProvider()..getConfigData()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
    );
  }
}
