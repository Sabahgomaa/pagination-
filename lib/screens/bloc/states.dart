
class SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
}

class SearchFailedState extends SearchStates {
  final String error;

  SearchFailedState(this.error);
}
