part of 'profile_cubit.dart';

typedef ReorderableLabeledList = ({String title, List<String> items});

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required List<DragAndDropList> sections,
    required bool isProcessing,
  }) = _Initial;

  factory ProfileState.initial() => const ProfileState(
        sections: [],
        isProcessing: false,
      );
}
