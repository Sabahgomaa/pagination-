import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pagination/screens/view.dart';
import 'package:pagination/shared/cache_helper.dart';
import 'package:pagination/shared/kiwi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  initKiwi();
  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchView(),
    );
  }
}
