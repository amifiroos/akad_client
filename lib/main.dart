import 'package:akad/pages/CreateDokPage.dart';
import 'package:akad/pages/EditPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// untuk bisa menggunakan widget dri luar, cuma perlu import filenya saja
// dan pakai seperti biasa
import 'package:akad/pages/LoginPage.dart';
import 'package:akad/pages/HomePage.dart';
import 'package:akad/pages/DetailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // Tambah screenutil untuk responsive => https://pub.dev/packages/flutter_screenutil
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () {
        //
        // integrasi flutter get => https://pub.dev/packages/get
        // MaterialApp jadi GetMaterialApp
        return GetMaterialApp(
          title: 'Page Detail',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          // membuat route yang mirip dengan route di web menggunakan package get => https://github.com/jonataslaw/getx#breaking-changes-from-20
          // GetPage(name: '/ini-nama-route', page: () => IniWidgetHalamannya()),
          // WARNING : routenya jangan pakai slash kosong ('/') ya, ada bug di sidebarnya
          getPages: [
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/home', page: () => Home()),
            GetPage(name: '/tambah', page: () => CreateDokumen()),
            GetPage(name: '/detail/:id', page: () => DetailDokumen()),
            GetPage(name: '/edit/:id', page: () => UpdateDokumen()),
          ],

          // route yang di load pertama kali
          // Nanti kalau login nya dah jadi, ganti jadi /login
          initialRoute: '/home',
        );
      },
    );
  }
}
