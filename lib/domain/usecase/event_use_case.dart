import 'package:test_task/core/result.dart';
import 'package:test_task/domain/entities/event_entity.dart';
import 'package:test_task/domain/repositories/event_repository.dart';

class EventUseCase {
  final EventRepository _repository;

  EventUseCase(this._repository);

  Future<Result<List<EventEntity>>> getEvents(
      {required String startDate, String? endDate}) async {

    final result =
        await _repository.getEventList(startDate: startDate, endDate: endDate);

    return result;
  }
}
