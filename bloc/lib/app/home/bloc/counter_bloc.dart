import 'dart:async';
import 'package:bloc/app/home/bloc/event/counter_events.dart';
import 'package:bloc/app/home/bloc/state/counter_state.dart';

class CounterBloc {
  int _count = 0;
  final StreamController<CounterEvent> _inputCounterController =
      StreamController<CounterEvent>();
  final StreamController<CounterState> _outputCounterController =
      StreamController<CounterState>();

  Sink<CounterEvent> get inputCounter => _inputCounterController.sink;
  Stream<CounterState> get stream => _outputCounterController.stream;

  CounterBloc() {
    _inputCounterController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent counterEvent) {
    if (counterEvent is ResetCounterEvent) {
      _count = 0;
      _outputCounterController.add(CounterInitialState(count: _count));
      return;
    } 
    
    if (counterEvent is IncrementCounterEvent) {
      _count++;
    } else if (counterEvent is DecrementCounterEvent) {
      _count--;
    }

    _outputCounterController.add(CounterSuccessState(count: _count));
  }
}
