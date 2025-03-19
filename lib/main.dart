import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/repositories/event_repository_impl.dart';
import 'package:test_task/data/source/event_api.dart';
import 'package:test_task/domain/usecase/event_use_case.dart';
import 'package:test_task/presentation/bloc/event_bloc.dart';
import 'package:test_task/presentation/cubit/date_cubit.dart';
import 'package:test_task/presentation/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StateProviders(),
    );
  }
}

class StateProviders extends StatefulWidget {
  const StateProviders({super.key});

  @override
  State<StateProviders> createState() => _StateProvidersState();
}

class _StateProvidersState extends State<StateProviders> {
  late final EventUseCase _eventUseCase;

  @override
  void initState() {
    final api = EventApi();
    final repo = EventRepositoryImpl(api: api);

    _eventUseCase = EventUseCase(repo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(_eventUseCase),
      child: BlocProvider(
        create: (context) => DateCubit(context.read<EventBloc>()),
        child: const MainScreen(),
      ),
    );
  }
}
