import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/date_cubit.dart';

class BottomDatePicker extends StatelessWidget {
  final DateEnumValue dateEnum;
  BottomDatePicker({super.key, required this.dateEnum});

  var updateDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Shoes date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Expanded(
            child: BlocBuilder<DateCubit, DateState>(
              builder: (context, state) {
                var initDate = DateTime.now();
                if (dateEnum == DateEnumValue.startDate) {
                  initDate = state.startDate;
                } else if (dateEnum == DateEnumValue.endDate &&
                    state.endDate != null) {
                  initDate = state.endDate!;
                }

                return CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initDate,
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime(2100),
                  onDateTimeChanged: (DateTime newDate) {
                    updateDate = newDate;
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final dateState = context.read<DateCubit>();

              if (dateEnum == DateEnumValue.endDate) {
                final difference = updateDate
                    .difference(dateState.state.startDate)
                    .inDays;

                if (difference.abs() < 7) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            "Error: date range must be at least 7 days!")),
                  );
                  Navigator.pop(context);
                  return;
                }
              }
              dateState.changeDate(updateDate, dateEnum);
              Navigator.pop(context);
            },
            child: const Text("Ready", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
