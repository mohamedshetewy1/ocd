abstract class ToDoState {}

class ToDoInitialState extends ToDoState {}

class ToDoLoadingState extends ToDoState {}

class ToDoSuccessState extends ToDoState {}

class ToDoFailedState extends ToDoState {
  String message;
  ToDoFailedState({required this.message});
}
