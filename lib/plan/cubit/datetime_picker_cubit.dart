import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'datetime_picker_state.dart';

class DatetimePickerCubit extends Cubit<DatetimePickerState> {
  DatetimePickerCubit() : super(DatetimePickerInitial());

  Future<void> pickDateTime(BuildContext context) async {
    final initialState = state;
    if (initialState is DatetimePickerInitial) {
      DateTime selectedDateTime = initialState.value;

      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialState.value,
        firstDate: initialState.min,
        lastDate: initialState.max,
      );
      if (pickedDate != null && context.mounted) {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time != null) {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            time.hour,
            time.minute,
          );
          emit(DatetimePickerSelected(value: selectedDateTime));
        }
      }
    }
  }
}
