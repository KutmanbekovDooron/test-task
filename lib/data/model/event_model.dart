import 'package:test_task/domain/entities/event_entity.dart';

class EventModel extends EventEntity {

  const EventModel(
      {required super.eventName,
      required super.description,
      required super.date});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        eventName: json['event_name'] ?? '',
        description: json['description'] ?? '',
        date: json['date'] ?? '');
  }
}
