import 'package:example/counter/bloc/counter_bloc.dart';
import 'package:example/counter/cubit/brightness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.large(
            child: const Icon(Icons.brightness_6),
            onPressed: () => context.read<BrightnessCubit>().toggleBrightness(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton.large(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton.large(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton.large(
            child: const Icon(Icons.delete),
            onPressed: () => HydratedBloc.storage.clear(),
            tooltip: 'Delete ALl',
          ),
          const SizedBox(height: 4),
          FloatingActionButton.large(
            child: const Icon(Icons.delete_outline),
            onPressed: () => context.read<CounterBloc>().clear(),
            tooltip: 'Delete Counter',
          ),
          const SizedBox(height: 4),
          FloatingActionButton.large(
            child: const Icon(Icons.delete_forever),
            onPressed: () => context.read<BrightnessCubit>().clear(),
            tooltip: 'Delete Theme',
          ),
        ],
      ),
    );
  }
}
