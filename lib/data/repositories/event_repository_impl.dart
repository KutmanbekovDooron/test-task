import 'package:test_task/data/source/event_api.dart';
import 'package:test_task/domain/entities/event_entity.dart';

import '../../core/result.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventApi _api;

  EventRepositoryImpl({required EventApi api}) : _api = api;

  @override
  Future<Result<List<EventEntity>>> getEventList(
      {required String startDate, String? endDate}) async {
    final result = await _api.getEvents(startDate: startDate);

    return result;
  }
}
