// tab_event.dart
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TabEvent {}
class UpdateTabEvent extends TabEvent {
  final int tabIndex;
  UpdateTabEvent(this.tabIndex);
}

// tab_state.dart
abstract class TabState {}
class TabInitialState extends TabState {}
class TabLoadedState extends TabState {
  final int tabIndex;
  TabLoadedState(this.tabIndex);
}

// tab_bloc.dart
class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitialState()) {
    on<UpdateTabEvent>((event, emit) {
      emit(TabLoadedState(event.tabIndex));
    });
  }
}