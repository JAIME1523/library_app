import 'package:flutter/material.dart';
import 'package:library_app/config/utils/utils.dart';
import 'package:library_app/presentation/page/home_page.dart';
import 'package:nav_service/nav_service.dart';

import 'config/theme/app_theme.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
 await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackService.messagerKey,
      navigatorKey: NavService.navigatorKey,
      title: 'Library App',
      home: const HomePage(),
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
