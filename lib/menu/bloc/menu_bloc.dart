import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recommendinator/models/customer_preferences.dart';
import 'package:recommendinator/models/k_nearest_neighbor.dart';
import 'package:recommendinator/models/menu_item.dart';
import 'package:flutter/services.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) async {
      List<MenuItem> allMenuItems = [];

      // Load menu from local JSON
      String jsonString = await rootBundle.loadString('assets/menu.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      List<MenuItem> menuItems =
          jsonMap["items"].map<MenuItem>((e) => MenuItem.fromJSON(e)).toList();

      //Generate recommended items and append
      KNearestNeighbor recommendinatorModel = KNearestNeighbor(menuItems);
      CustomerPreferences? preferences =
          await CustomerPreferences.loadCustomerPreferences();
      if (preferences != null) {
        var recommendedItems =
            recommendinatorModel.recommend(preferences).map((e) {
          // Change these items to the "Recommended" group
          var newItem = e;
          newItem.group = "Recommended";
          return newItem;
        });

        allMenuItems.addAll(recommendedItems);
      }

      //Add them all in one list
      allMenuItems.addAll(menuItems);

      emit(MenuLoaded(allMenuItems));
    });
  }
}
