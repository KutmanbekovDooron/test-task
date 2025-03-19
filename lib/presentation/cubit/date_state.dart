part of 'date_cubit.dart';

enum DateEnumValue { startDate, endDate }

class DateState extends Equatable {
  final DateTime startDate;
  final DateTime? endDate;

  const DateState(this.startDate, this.endDate);

  DateState copyWith({DateTime? startDate, DateTime? endDate, String error = ''}) {
    return DateState(startDate ?? this.startDate, endDate ?? this.endDate);
  }

  @override
  List<Object?> get props => [startDate, endDate];
}
