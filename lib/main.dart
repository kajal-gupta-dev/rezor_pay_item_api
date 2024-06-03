import 'package:flutter/material.dart';
import 'package:rezor_pay_item_api/post_items.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostItems(),
    );
  }
}
