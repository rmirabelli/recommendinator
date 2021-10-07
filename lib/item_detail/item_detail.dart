import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/item_detail/bloc/item_detail_bloc.dart';
import 'package:recommendinator/models/menu_item.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: BlocBuilder<ItemDetailBloc, ItemDetailState>(
        builder: (context, state) {
          if (state is ItemDetailInitial) {
            return _itemDetailContent(state.item);
          } else {
            //Return empty container for unsupported states
            return Container();
          }
        },
      ),
    );
  }

  Widget _itemDetailContent(MenuItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: SizedBox(
            child: Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: Image.network(item.thumbnailURL),
              ),
            ),
          ),
        ),
        _itemTextContent(item),
        _itemButtonContent(),
      ],
    );
  }

  Widget _itemTextContent(MenuItem item) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              "Ingredients: " + item.ingredients.join(","),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: Text(
              item.name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemButtonContent() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ElevatedButton(
        onPressed: () {
          print('add to cart pressed');
        },
        child: const Text('Add to cart'),
      ),
    );
  }
}
