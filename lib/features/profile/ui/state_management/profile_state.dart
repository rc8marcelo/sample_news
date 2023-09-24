part of 'profile_cubit.dart';

typedef ReorderableLabeledList = ({String title, List<String> items});

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.ready({required List<DragAndDropList> sections}) =
      _Ready;

  const factory ProfileState.processing(
      {required List<DragAndDropList> sections}) = _Processing;
}
