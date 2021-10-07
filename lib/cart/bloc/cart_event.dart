part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCart extends CartEvent {
  final OrderItem item;

  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final OrderItem item;

  RemoveFromCart(this.item);
}

class ResetCart extends CartEvent {}

class CheckoutCart extends CartEvent {}
