import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/bloc/event_bloc.dart';

class ListEvent extends StatelessWidget {
  const ListEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (BuildContext context, EventState state) {
        if (state.errors.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: state.errors.entries.map((entry) {
                  return Text("${entry.key}: ${entry.value[0]}",
                      style: const TextStyle(color: Colors.white));
                }).toList(),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == StatusState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == StatusState.success) {
          final list = state.events;
          return ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(list[index].eventName,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(list[index].description),
                  ),
                  Text(list[index].date,
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 15))
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text("List is empty"),
        );
      },
    );
  }
}
