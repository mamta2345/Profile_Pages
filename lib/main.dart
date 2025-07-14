import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_pages/Home_Pages_UI/profile_page.dart';
import 'package:profile_pages/Host_pages_ui/capacity_page.dart';
import 'package:profile_pages/Host_pages_ui/choosing_theam.dart';
import 'package:profile_pages/Host_pages_ui/detail_host.dart';
import 'package:profile_pages/Host_pages_ui/host_details.dart';
import 'package:profile_pages/Host_pages_ui/host_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: HostDetails(),

      // home: ProfilePage(),
    );
  }
}
