part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

class IncrementState extends CounterState{
 const IncrementState(int increasedValue) : super(counter: increasedValue);
}

class DecrementState extends CounterState{
  const DecrementState(int decreasedValue) : super(counter: decreasedValue);
}