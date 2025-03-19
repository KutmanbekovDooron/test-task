import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/bloc/event_bloc.dart';
import 'package:test_task/presentation/cubit/date_cubit.dart';
import '../widgets/bottom_date_picker.dart';
import '../widgets/date_item.dart';
import '../widgets/list_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _showDatePicker(BuildContext context, DateEnumValue dateEnum) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<DateCubit>(),
          child: BottomDatePicker(
            dateEnum: dateEnum,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Calendar',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: DateItem(
                  name: 'Start',
                  callback: () {
                    _showDatePicker(context, DateEnumValue.startDate);
                  },
                  dateEnum: DateEnumValue.startDate,
                )),
                Expanded(
                    child: DateItem(
                  name: 'end',
                  callback: () {
                    _showDatePicker(context, DateEnumValue.endDate);
                  },
                  dateEnum: DateEnumValue.endDate,
                )),
              ],
            ),
            const Expanded(child: ListEvent())
          ],
        ),
      ),
    );
  }
}
