import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/cart/bloc/cart_bloc.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'package:recommendinator/models/order_item.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return const Center(
              child: Text("Cart Empty -- Add some food!"),
            );
          } else if (state is CartPopulated) {
            return _listView(context, state.items);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView _listView(BuildContext context, List<OrderItem> orderItems) {
    return ListView.builder(
        itemCount: orderItems.length + 1,
        itemBuilder: (context, index) {
          if (index < orderItems.length) {
            var orderItem = orderItems[index];
            var menuItem = orderItem.item;
            return Card(
                child: ListTile(
              onTap: () {
                //TODO: Show modification interface?
              },
              title: Text(menuItem.name),
              subtitle: Text(menuItem.price.toString()),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(menuItem.thumbnailURL)),
              trailing: GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(RemoveFromCart(orderItem));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Removed ${menuItem.name} from cart"),
                  ));
                },
                child: const Icon(
                  Icons.remove, // add custom icons also
                ),
              ),
            ));
          } else {
            return _checkoutButtonContent(context);
          }
        });
  }

  Widget _checkoutButtonContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ElevatedButton(
        onPressed: () {
          context.read<CartBloc>().add(CheckoutCart());
          context.read<MenuBloc>().add(LoadMenu());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Thanks for your order!"),
          ));
        },
        child: const Text('Checkout'),
      ),
    );
  }
}
