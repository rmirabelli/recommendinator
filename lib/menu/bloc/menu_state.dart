part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuItem> menuItems;

  MenuLoaded(this.menuItems);
}
