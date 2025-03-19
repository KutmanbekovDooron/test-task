import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/cubit/date_cubit.dart';

class DateItem extends StatelessWidget {
  final String name;
  final DateEnumValue dateEnum;
  final VoidCallback callback;

  const DateItem({
    super.key,
    required this.name,
    required this.callback, required this.dateEnum,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                BlocBuilder<DateCubit, DateState>(
                  builder: (context, state) {
                    DateTime? dateTime = state.startDate;
                    if(dateEnum == DateEnumValue.endDate){
                      dateTime = state.endDate;
                    }
                    return Text(
                      dateTime != null ? "${dateTime.day}-${dateTime.month}-${dateTime.year}" : '-',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    );
                  },
                )
              ],
            ),
            const Icon(Icons.calendar_today_outlined)
          ],
        ),
      ),
    );
  }
}
