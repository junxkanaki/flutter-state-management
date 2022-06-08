class HomePageState {
  const HomePageState({this.counter = 0});
  final int counter;

  HomePageState copyWith(int counter) => HomePageState(counter: counter);
}