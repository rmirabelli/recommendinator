part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartEmpty extends CartState {}

class CartPopulated extends CartState {
  final List<OrderItem> items;

  CartPopulated(this.items);
}
