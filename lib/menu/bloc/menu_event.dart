part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class LoadMenu extends MenuEvent {}

class MenuItemSelected extends MenuEvent {}
