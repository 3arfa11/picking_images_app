import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picking/home_view.dart';
import 'package:image_picking/image_picking_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickingCubit(),
      child: const MaterialApp(
        title: 'Image Picker',
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
