import 'package:test_task/domain/entities/event_entity.dart';

import '../../core/result.dart';

abstract class EventRepository {
  Future<Result<List<EventEntity>>> getEventList(
      {required String startDate, String? endDate});
}
