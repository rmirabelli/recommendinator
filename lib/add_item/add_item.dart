import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/add_item/bloc/add_item_bloc.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: BlocBuilder<AddItemBloc, AddItemState>(
        builder: (context, state) {
          return const Center(child: Text("Haven't implemented this yet."));
        },
      ),
    );
  }
}
