import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'package:recommendinator/models/menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Recommendinator')),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuInitial) {
            context.read<MenuBloc>().add(LoadMenu());
            return const CircularProgressIndicator();
          } else if (state is MenuLoaded) {
            return _listView(state.menuItems);
          } else {
            //Everything else defaults to empty container
            return Container();
          }
        },
      ),
    );
  }

  ListView _listView(List<MenuItem> menuItems) {
    return ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          var menuItem = menuItems[index];
          return Card(
              child: ListTile(
            title: Text(menuItem.name),
            subtitle: Text(menuItem.price.toString()),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(menuItem.thumbnailURL)),
          ));
        });
  }
}
