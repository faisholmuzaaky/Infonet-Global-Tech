import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/cubit/survey_cubit.dart';
import 'package:survey/screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurveyCubit>(
          create: (context) => SurveyCubit(),
        ),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
