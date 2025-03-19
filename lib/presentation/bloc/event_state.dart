part of 'event_bloc.dart';

enum StatusState { initial, loading, error, success }

class EventState extends Equatable {
  final StatusState status;
  final List<EventEntity> events;
  final Map<String, dynamic> errors;

  const EventState(
      {this.status = StatusState.initial,
      this.events = const [],
      this.errors = const {}});

  EventState copyWith(
      {required StatusState status,
      List<EventEntity> events = const [],
      Map<String, dynamic> errors = const {}}) {
    return EventState(status: status, events: events, errors: errors);
  }

  @override
  List<Object?> get props => [status, events, errors];
}
