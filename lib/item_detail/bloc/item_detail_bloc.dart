import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommendinator/models/menu_item.dart';

part 'item_detail_event.dart';
part 'item_detail_state.dart';

class ItemDetailBloc extends Bloc<ItemDetailEvent, ItemDetailState> {
  ItemDetailBloc(MenuItem item) : super(ItemDetailInitial(item)) {
    on<ItemDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
