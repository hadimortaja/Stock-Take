import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stocktake/value/app_get.dart';
import 'package:stocktake/value/colors.dart';
import 'package:stocktake/view/about_screen.dart';
import 'package:stocktake/view/home_page.dart';
import 'package:stocktake/view/option_screen.dart';
import 'package:stocktake/view/qr_code_server_settings_screen.dart';
import 'package:stocktake/view/sql_server_setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(AppGet());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      //allowFontScaling: true,
      builder: () {
        return GetMaterialApp(
          theme: ThemeData(
              fontFamily: "Tajawal-Regular",
              scaffoldBackgroundColor: AppColors.primaryColor,
              primaryColor: AppColors.primaryColor),
          debugShowCheckedModeBanner: false,
          locale: Locale('en'),
          fallbackLocale: Locale('en'),
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', 'US'),
          ],
          home: HomePage(),
        );
      },
    );
  }
}
