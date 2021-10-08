import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:recommendinator/cart/bloc/cart_bloc.dart';
import 'package:recommendinator/cart/cart.dart';
import 'package:recommendinator/item_detail/bloc/item_detail_bloc.dart';
import 'package:recommendinator/item_detail/item_detail.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'package:recommendinator/models/menu_item.dart';
import 'package:recommendinator/models/order_item.dart';
import 'package:recommendinator/settings/bloc/settings_bloc.dart';
import 'package:recommendinator/settings/settings.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('The Recommendinator'),
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
            return const Center(child: CircularProgressIndicator());
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

  GroupedListView _listView(List<MenuItem> menuItems) {
    return GroupedListView<MenuItem, String>(
        elements: menuItems,
        groupBy: (element) => element.group,
        groupComparator: (group1, group2) => group2.compareTo(group1),
        groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        itemBuilder: (context, menuItem) {
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
            subtitle: Text('\$${menuItem.price.toStringAsFixed(2)}'),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(menuItem.thumbnailURL)),
            trailing: GestureDetector(
              onTap: () {
                OrderItem item = OrderItem(menuItem, null);
                context.read<CartBloc>().add(AddToCart(item));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Added ${menuItem.name} to cart"),
                ));
              },
              child: const Icon(
                Icons.add, // add custom icons also
                color: Colors.blueAccent,
              ),
            ),
          ));
        });
  }
}
