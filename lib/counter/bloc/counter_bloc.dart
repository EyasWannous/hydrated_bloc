import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends HydratedBloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  @override
  int fromJson(Map<String, dynamic> json) => json['value'] as int;

  @override
  Map<String, int> toJson(int state) => {'value': state};

  // @override
  // Future<void> clear() {
  //   HydratedBloc.storage.delete(storageToken);
  //   return super.clear();
  // }
}
