abstract class CounterState {
  int count;

  CounterState({
    required this.count,
  });
}

class CounterInitialState extends CounterState {
  CounterInitialState({required int count}) : super(count: count);
}

class CounterSuccessState extends CounterState {
  CounterSuccessState({required int count}) : super(count: count);
}
