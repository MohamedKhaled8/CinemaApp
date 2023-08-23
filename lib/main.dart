import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/view/home_screen.dart';
import 'package:cinmaapp/view/mail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cinema App',
          home: HomeScreen(),
        );
      },
    );
  }
}
