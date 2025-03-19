import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:test_task/domain/entities/event_entity.dart';
import 'package:test_task/domain/usecase/event_use_case.dart';

part 'event_event.dart';

part 'event_state.dart';

class EventBloc extends Bloc<EventsEvent, EventState> {
  final EventUseCase _eventUseCase;

  EventBloc(this._eventUseCase) : super(const EventState()) {
    on<AllEvents>(onGetEvents);
  }

  onGetEvents(AllEvents event, Emitter<EventState> emit) async {
    emit(state.copyWith(status: StatusState.loading));

    String formatStart =
        "${event.startDate.day}-${event.startDate.month}-${event.startDate.year}";
    String? formatEnd;
    if (event.endDate != null) {
      formatEnd =
          "${event.endDate?.day}-${event.endDate?.month}-${event.endDate?.year}";
    }

    final result = await _eventUseCase.getEvents(
        startDate: formatStart, endDate: formatEnd);

    if (result.isSuccess) {
      (result.data ?? []).sort((a, b) {
        final dateFormat = DateFormat('dd-MM-yyyy');
        final dateA = dateFormat.parse(a.date);
        final dateB = dateFormat.parse(b.date);
        return dateA.compareTo(dateB);
      });

      emit(state.copyWith(
          status: StatusState.success, events: result.data ?? []));
    } else {
      emit(state.copyWith(status: StatusState.error, errors: result.error ?? {}));
    }
  }
}
