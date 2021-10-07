import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommendinator/models/menu_item.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) {
      // TODO: load menu from JSON file, etc
      List<MenuItem> menuItems = [
        MenuItem(
            name: "Taco",
            price: 4.99,
            ingredients: ["Beef", "Lettuce", "Tomato", "Salsa"],
            thumbnailURL:
                "https://upload.wikimedia.org/wikipedia/commons/3/3a/NCI_Visuals_Food_Taco.jpg",
            preparation: ["Grilled"]),
        MenuItem(
            name: "Taco",
            price: 4.99,
            ingredients: ["Beef", "Lettuce", "Tomato", "Salsa"],
            thumbnailURL:
                "https://upload.wikimedia.org/wikipedia/commons/3/3a/NCI_Visuals_Food_Taco.jpg",
            preparation: ["Grilled"]),
        MenuItem(
            name: "Taco",
            price: 4.99,
            ingredients: ["Beef", "Lettuce", "Tomato", "Salsa"],
            thumbnailURL:
                "https://upload.wikimedia.org/wikipedia/commons/3/3a/NCI_Visuals_Food_Taco.jpg",
            preparation: ["Grilled"]),
        MenuItem(
            name: "Taco",
            price: 4.99,
            ingredients: ["Beef", "Lettuce", "Tomato", "Salsa"],
            thumbnailURL:
                "https://upload.wikimedia.org/wikipedia/commons/3/3a/NCI_Visuals_Food_Taco.jpg",
            preparation: ["Grilled"]),
      ];
      emit(MenuLoaded(menuItems));
    });
  }
}
