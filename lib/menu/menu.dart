import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Recommendinator')),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
