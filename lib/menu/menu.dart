import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/cart/cart.dart';
import 'package:recommendinator/item_detail/bloc/item_detail_bloc.dart';
import 'package:recommendinator/item_detail/item_detail.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'package:recommendinator/models/menu_item.dart';
import 'package:recommendinator/settings/bloc/settings_bloc.dart';
import 'package:recommendinator/settings/settings.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Food Recommendinator'),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (_) => SettingsBloc(),
                    child: const Settings(),
                  );
                }));
              },
              child: const Icon(
                Icons.settings, // add custom icons also
              )),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Cart();
                  }));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.shopping_cart, // add custom icons also
                  ),
                ))
          ]),
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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BlocProvider(
                  create: (_) => ItemDetailBloc(menuItem),
                  child: const ItemDetail(),
                );
              }));
            },
            title: Text(menuItem.name),
            subtitle: Text(menuItem.price.toString()),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(menuItem.thumbnailURL)),
          ));
        });
  }
}
