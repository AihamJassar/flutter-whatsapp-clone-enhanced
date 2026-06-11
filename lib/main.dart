import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/models/setting_model.dart';
import 'package:whats_app_clone/screens/chat_details_screen.dart';
import 'package:whats_app_clone/screens/setting_screen.dart';
import 'package:whats_app_clone/test_widget.dart';
import 'package:whats_app_clone/whats_app_home.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingModel(),
      child: const MaterialApp(
        // routes: {
        //   '/test': (context) => TestWidget(),
      
        //   },
        debugShowCheckedModeBanner: false,
        home: WhatsAppHome(),
      ),
    ),
  );
  // runApp(
  //   const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home:
  //   ChatDetailsScreen()
  //   ));
}
