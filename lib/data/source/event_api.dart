import 'package:dio/dio.dart';
import 'package:test_task/core/result.dart';
import 'package:test_task/data/model/event_model.dart';

const kBASE_API = 'https://test-task-app-alpha.vercel.app/api/';

abstract class Api {
  Future<Result<List<EventModel>>> getEvents(
      {required String startDate, String? endDate});
}

class EventApi implements Api {
  final _dio = Dio(BaseOptions(baseUrl: kBASE_API));

  @override
  Future<Result<List<EventModel>>> getEvents(
      {required String startDate, String? endDate}) async {
    try {
      final response = await _dio.get('test-task',
          queryParameters: {"start_date": startDate, "end_date": endDate});
      final list = (response.data as List<dynamic>)
          .map((element) => EventModel.fromJson(element))
          .toList();

      return Result.success(list);
    } on DioException catch (dioError) {
      if(dioError.response != null){
        var errorDate = dioError.response!.data['message'];
        return Result.failure(errorDate);
      }
      return Result.failure({'service': 'unknown error'});
    }
  }
}
