import 'package:example/counter/cubit/brightness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/view/counter_page.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrightnessCubit, Brightness>(
      builder: (context, brightness) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: brightness),
          home: const CounterPage(),
        );
      },
    );
  }
}
