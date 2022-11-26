import 'package:counter_app/screens/homepage.dart';
import 'package:counter_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: const MaterialApp(
        title: AllText.appTitle,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
