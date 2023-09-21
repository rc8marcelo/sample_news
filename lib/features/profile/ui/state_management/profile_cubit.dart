import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void init() {
    final items = [
      (
        title: 'Favorites',
        items: [
          'Some Favorite 1',
          'Some Favorite 2',
          'Some Favorite 3',
        ],
      ),
      (
        title: 'Watched articles',
        items: [
          'Some Watching 1',
          'Some Watching 2',
          'Some Watching 3',
        ],
      ),
      (
        title: 'Articles to read',
        items: [
          'Some Read 1',
          'Some Read 2',
          'Some Read 3',
        ],
      ),
    ];
    final list = items
        .map(
          (e) => generateListSection(e.title, e.items),
        )
        .toList();
    emit(state.copyWith(sections: list));
  }

  void onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    emit(state.copyWith(isProcessing: true));
    final newList = currentList;
    final movedItem = newList[oldListIndex].children.removeAt(oldItemIndex);
    newList[newListIndex].children.insert(newItemIndex, movedItem);
    emit(state.copyWith(isProcessing: false, sections: newList));
  }

  void onListReorder(
    int oldListIndex,
    int newListIndex,
  ) {
    emit(state.copyWith(isProcessing: true));
    final newList = currentList;
    final movedList = newList.removeAt(oldListIndex);
    newList.insert(newListIndex, movedList);
    emit(state.copyWith(isProcessing: false, sections: newList));
  }

  void onItemAdd(DragAndDropItem newItem, int listIndex, int itemIndex) {
    emit(state.copyWith(isProcessing: true));
    final newList = currentList;
    if (itemIndex == -1) {
      newList[listIndex].children.add(newItem);
    } else {
      newList[listIndex].children.insert(itemIndex, newItem);
    }
    emit(state.copyWith(isProcessing: false, sections: newList));
  }

  void onListAdd(DragAndDropListInterface newList, int listIndex) {
    emit(state.copyWith(isProcessing: true));
    final newList = currentList;
    if (listIndex == -1) {
      newList.add(newList as DragAndDropList);
    } else {
      newList.insert(listIndex, newList as DragAndDropList);
    }
    emit(state.copyWith(isProcessing: false, sections: newList));
  }

  DragAndDropList generateListSection(String title, List<String> items) {
    return DragAndDropList(
      children: items.map((i) => generateListSectionItem(i)).toList(),
      header: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      }),
    );
  }

  DragAndDropItem generateListSectionItem(String value) {
    return DragAndDropItem(
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }),
    );
  }

  List<DragAndDropList> get currentList =>
      List<DragAndDropList>.from(state.sections);
}
