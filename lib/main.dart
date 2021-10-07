import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/cart/bloc/cart_bloc.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'menu/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<CartBloc>(create: (_) => CartBloc())],
        child: MaterialApp(
          title: 'The Recommendinator',
          home: BlocProvider(
            create: (_) => MenuBloc(),
            child: const Menu(),
          ),
        ));
  }
}
