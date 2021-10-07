import 'package:recommendinator/models/menu_item.dart';

import '../models/order_item.dart';

class CustomerPreferences {
  List<OrderItem> items;

  CustomerPreferences(this.items);

  add(OrderItem item) {
    items.add(item);
  }
}
