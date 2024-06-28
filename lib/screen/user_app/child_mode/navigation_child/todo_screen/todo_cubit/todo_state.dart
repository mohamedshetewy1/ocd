abstract class ToDoState {}

class ToDoInitialState extends ToDoState {}

class ToDoLoadingState extends ToDoState {}

class ToDoSuccessState extends ToDoState {}

class ToDoFailedState extends ToDoState {
  String message;
  ToDoFailedState({required this.message});
}

class CreateTasksInitialState extends ToDoState {}

class CreateTasksLoadingState extends ToDoState {}

class CreateTasksSuccessState extends ToDoState {}

class CreateTasksFailedState extends ToDoState {
  String message;
  CreateTasksFailedState({required this.message});
}
