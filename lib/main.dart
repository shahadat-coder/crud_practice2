import 'package:flutter/material.dart';
import 'package:rest_api/Rest%20Api/Rest_Client.dart';

import 'Screens/ProductGridviewScreen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud App',
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      home: GridViewListScreen(),
    );
  }
}
