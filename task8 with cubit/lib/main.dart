import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/Cubits/cubit/changeselectedvalue_cubit.dart';
import 'package:task8/Cubits/cubit/cubit/radiotoggle_cubit.dart';
import 'package:task8/Cubits/cubit/cubit/replaceuicubit_cubit.dart';
import 'package:task8/Cubits/cubit/showpass/cubit/showhidepass_cubit.dart';
import 'package:task8/task8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeselectedvalueCubit>(
          create: (BuildContext context) => ChangeselectedvalueCubit(),
        ),BlocProvider<ShowhidepassCubit>(
          create: (BuildContext context) => ShowhidepassCubit(),
        ),BlocProvider<RadiotoggleCubit>(
          create: (BuildContext context) => RadiotoggleCubit(),
        ),BlocProvider<ReplaceuicubitCubit>(
          create: (BuildContext context) => ReplaceuicubitCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: task8(),
      ),
    );
  }
}
