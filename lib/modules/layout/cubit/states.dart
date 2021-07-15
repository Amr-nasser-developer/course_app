abstract class HomeStates{}

class HomeInitial extends HomeStates{}

class HomeIndex extends HomeStates{}

class HomeSuccess extends HomeStates{}

class HomeError extends HomeStates{
  final error ;
  HomeError(this.error);
}

