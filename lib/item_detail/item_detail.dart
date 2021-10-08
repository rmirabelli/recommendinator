import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/cart/bloc/cart_bloc.dart';
import 'package:recommendinator/item_detail/bloc/item_detail_bloc.dart';
import 'package:recommendinator/models/menu_item.dart';
import 'package:recommendinator/models/order_item.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: BlocBuilder<ItemDetailBloc, ItemDetailState>(
        builder: (context, state) {
          if (state is ItemDetailInitial) {
            return _itemDetailContent(context, state.item);
          } else {
            //Return empty container for unsupported states
            return Container();
          }
        },
      ),
    );
  }

  Widget _itemDetailContent(BuildContext context, MenuItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          child: Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.network(item.thumbnailURL),
            ),
          ),
        ),
        _itemTextContent(context, item),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            widthFactor: 10,
            child: _itemButtonContent(context, item),
          ),
        ),
      ],
    );
  }

  Widget _itemTextContent(BuildContext context, MenuItem item) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Ingredients: " + item.ingredients.join(","),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name),
              Text('\$ ' + item.price.toString()),
            ],
          ),
          const SizedBox(height: 20),
          Text('Cooking method: ' + item.preparation.join(','))
        ],
      ),
    );
  }

  Widget _itemButtonContent(BuildContext context, MenuItem menuItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ElevatedButton(
        onPressed: () {
          OrderItem item = OrderItem(menuItem, null);
          context.read<CartBloc>().add(AddToCart(item));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Added ${menuItem.name} to cart"),
          ));
          Navigator.of(context).pop();
        },
        child: const Text('Add to cart'),
      ),
    );
  }
}
