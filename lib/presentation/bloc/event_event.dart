part of 'event_bloc.dart';

sealed class EventsEvent extends Equatable {
  const EventsEvent();
}

class AllEvents extends EventsEvent {
  final DateTime startDate;
  final DateTime? endDate;

  const AllEvents({required this.startDate, this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];

}
