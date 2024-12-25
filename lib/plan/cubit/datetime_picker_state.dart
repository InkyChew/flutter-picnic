part of 'datetime_picker_cubit.dart';

sealed class DatetimePickerState extends Equatable {
  const DatetimePickerState();

  @override
  List<Object> get props => [];
}

final class DatetimePickerInitial extends DatetimePickerState {
  final DateTime value;
  final DateTime min;
  final DateTime max;

  DatetimePickerInitial({
    DateTime? value,
    DateTime? min,
    DateTime? max,
  })  : value = value ?? DateTime.now(),
        min = min ?? DateTime(2000),
        max = max ?? DateTime(2100);

  @override
  List<Object> get props => [value, min, max];
}

final class DatetimePickerSelected extends DatetimePickerState {
  final DateTime value;

  const DatetimePickerSelected({required this.value});

  @override
  List<Object> get props => [value];
}
