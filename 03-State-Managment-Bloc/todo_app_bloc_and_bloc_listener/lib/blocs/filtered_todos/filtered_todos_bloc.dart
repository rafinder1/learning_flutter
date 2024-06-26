// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosBloc({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }

  // void setFilteredTodos() {
  //   List<Todo> _filteredTodos;

  //   switch (todoFilterBloc.state.filter) {
  //     case Filter.active:
  //       _filteredTodos = todoListBloc.state.todos.where((Todo todo) => !todo.completed).toList();
  //       break;
  //     case Filter.completed:
  //       _filteredTodos = todoListBloc.state.todos.where((Todo todo) => todo.completed).toList();
  //       break;
  //     case Filter.all:
  //     default:
  //       _filteredTodos = todoListBloc.state.todos;
  //       break;
  //   }

  //   if (todoSearchBloc.state.searchTerm.isNotEmpty) {
  //     _filteredTodos = _filteredTodos
  //         .where((Todo todo) =>
  //             todo.desc.toLowerCase().contains(todoSearchBloc.state.searchTerm.toLowerCase()))
  //         .toList();
  //   }

  //   add(CalculateFilteredTodosEvent(filteredTodos: _filteredTodos));
  // }
}
