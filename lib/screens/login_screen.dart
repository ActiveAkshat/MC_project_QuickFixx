import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickfixx_app_flutter/screens/auth.dart';


class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}