import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recommendinator/models/menu_item.dart';
import 'package:flutter/services.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) async {
      String jsonString = await rootBundle.loadString('assets/menu.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      List<dynamic> menuItems =
          jsonMap["items"].map<MenuItem>((e) => MenuItem.fromJSON(e)).toList();
      print(menuItems as List<MenuItem>);
      emit(MenuLoaded(menuItems));
    });
  }
}
