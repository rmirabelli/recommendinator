part of 'item_detail_bloc.dart';

@immutable
abstract class ItemDetailState {}

class ItemDetailInitial extends ItemDetailState {
  final MenuItem item;

  ItemDetailInitial(this.item);
}
