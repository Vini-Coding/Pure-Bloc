import 'package:bloc/app/home/bloc/counter_bloc.dart';
import 'package:bloc/app/home/bloc/event/counter_events.dart';
import 'package:bloc/app/home/bloc/state/counter_state.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CounterState>(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<CounterState> snapshot) {
        int count = snapshot.data?.count ?? 0;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Counter App with BLoC"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Press the buttons to increment, decrement or reset the Counter",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 80,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  bloc.inputCounter.add(IncrementCounterEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.inputCounter.add(DecrementCounterEvent());
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.inputCounter.add(ResetCounterEvent());
                },
                child: const Icon(Icons.loop),
              ),
            ],
          ),
        );
      },
    );
  }
}
