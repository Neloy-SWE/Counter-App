import 'package:counter_app/utils/app_size.dart';
import 'package:counter_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

/*
Bloc e 2 dhoroner widget use hoi.
1. BlocListener: BlocListener er 2 ta property achhe. ekta holo listener jeta listen er kaj kore. mane ami
jodi kono result show korate chai tahole listener use korbo. eita state dhore state bornona korbe. ar arekta
holo child jekhane ami amar widget dite parbo.

2. BlocBuilder: eita sudhu widget building er jonno use hoi er kono listener nai.

tobe ami chaile BlocConsumer widget use kore ek sathe listener ar builder er kaj korate pari. (best practice)
 */

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
            child: BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is IncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        AllText.successfullyIncreased,
                      ),
                      duration: Duration(microseconds: 100),
                    ),
                  );
                } else if (state is DecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        AllText.successfullyDecreased,
                      ),
                      duration: Duration(microseconds: 100),
                    ),
                  );
                }
              },
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
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(CounterDecrementEvent()),
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
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(CounterIncrementEvent()),
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
