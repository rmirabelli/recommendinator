import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/item_detail/bloc/item_detail_bloc.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailBloc, ItemDetailState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
