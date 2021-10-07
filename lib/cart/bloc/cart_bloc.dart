import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommendinator/models/order_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<OrderItem> currentItems = [];

  CartBloc() : super(CartEmpty()) {
    on<AddToCart>((event, emit) {
      currentItems.add(event.item);
      emit(CartPopulated(currentItems));
    });

    on<RemoveFromCart>((event, emit) {
      currentItems.remove(event.item);
      if (currentItems.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartPopulated(currentItems));
      }
    });

    on<ResetCart>((event, emit) {
      currentItems = [];
      emit(CartEmpty());
    });
  }
}
