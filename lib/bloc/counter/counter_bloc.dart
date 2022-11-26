import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
  }
}
