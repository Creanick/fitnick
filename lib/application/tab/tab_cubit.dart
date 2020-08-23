import 'package:bloc/bloc.dart';
import 'package:fitnick/domain/page_tab/models/page_tab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_state.dart';
part 'tab_cubit.freezed.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState.initial());
  //events

  void init({@required List<PageTab> tabs, int currentTabIndex = 0}) {
    if (tabs.isEmpty) {
      return;
    }
    emit(TabState(
        tabs: [...tabs],
        currentTabIndex: currentTabIndex,
        pageController: PageController(initialPage: currentTabIndex)));
  }

  void changeTab(int newTabIndex) {
    if (newTabIndex < 0 || newTabIndex >= state.tabs.length) {
      return;
    }
    emit(state.copyWith(currentTabIndex: newTabIndex));
    state.pageController.animateToPage(newTabIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Future<void> close() {
    state.pageController?.dispose();
    return super.close();
  }
}
