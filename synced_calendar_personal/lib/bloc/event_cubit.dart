import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_calendar_personal/model/event.dart';

class EventCubit extends Cubit<List<Event>> {
  EventCubit() : super([]);

  void addEvent(Event event) {
    state.add(event);
    emit(state);
  }

  void removeEvent(int id) {
    state.removeWhere((event) => event.id == id);
    emit(state);
  }
}
