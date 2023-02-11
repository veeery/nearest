import 'package:flutter/material.dart';
import 'package:nearest/constant/app_size_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Scaffold(
      body: Center(
        child: Text('Home', style: TextStyle(fontFamily: 'Poppins')),
      ),
    );
  }
}
