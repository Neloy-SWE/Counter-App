import 'package:counter_app/utils/app_size.dart';
import 'package:counter_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllText.appTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // result text
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "${AllText.counterValueColon} ${state.counter}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          Gap.h20,

          // buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                    icon: const Icon(
                      Icons.remove,
                    ),
                    label: const Text(
                      AllText.decrease,
                    ),
                  ),
                ),
                Gap.w30,
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                    icon: const Icon(
                      Icons.add,
                    ),
                    label: const Text(
                      AllText.increase,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
