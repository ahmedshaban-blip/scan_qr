import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/barcode_cubit.dart';
import 'screens/barcode_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarcodeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BarcodeScreen(),
      ),
    );
  }
}
