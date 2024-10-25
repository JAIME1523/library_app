import 'package:flutter/material.dart';
import 'package:library_app/infrastrcuture/datasource/open_library_datasource.dart';
import 'package:nav_service/snack/snack_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackService.messagerKey,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                OpenLibraryDatasource().getBooksByQuery("the lord of the rings");
              },
              child: Text('Hello World')),
        ),
      ),
    );
  }
}
