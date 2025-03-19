import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/presentation/bloc/event_bloc.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  final EventBloc eventBloc;

  DateCubit(this.eventBloc) : super(DateState(DateTime.now(), null)){
    eventBloc
        .add(AllEvents(startDate: state.startDate, endDate: state.endDate));
  }

  changeDate(DateTime time, DateEnumValue dateEnum) {
    if (dateEnum == DateEnumValue.startDate) {
      emit(state.copyWith(startDate: time));
    } else {
      emit(state.copyWith(endDate: time));
    }

    eventBloc
        .add(AllEvents(startDate: state.startDate, endDate: state.endDate));
  }
}
