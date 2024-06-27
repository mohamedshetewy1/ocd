abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class GetUserDataSuccessState extends LayoutStates {}

class GetUserDataLoadingState extends LayoutStates {}

class FailedToGetUserDataState extends LayoutStates {
  String error;
  FailedToGetUserDataState({required this.error});
}

class GetVideoLoadingState extends LayoutStates {}

class GetVideoSuccessState extends LayoutStates {}

class FailedToGetVideoState extends LayoutStates {}

class GetTaskLoadingState extends LayoutStates {}

class GetTaskSuccessState extends LayoutStates {}

class FailedToGetTaskState extends LayoutStates {}
