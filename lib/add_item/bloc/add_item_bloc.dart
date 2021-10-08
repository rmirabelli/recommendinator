import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc() : super(AddItemInitial()) {
    on<AddItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
