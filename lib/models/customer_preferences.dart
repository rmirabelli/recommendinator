import 'package:recommendinator/models/menu_item.dart';

import '../models/menu_item.dart';

class CustomerPreferences {
  List<MenuItem> items;

  CustomerPreferences(this.items);

  add(MenuItem item) {
    items.add(item);
  }
}
