import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:speeddatingapp/homemenu/navbar_items.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState(0, NavbarItem.home));

  void getNavBar(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const BottomNavigationState(0, NavbarItem.home));
        break;
      case NavbarItem.profile:
        emit(const BottomNavigationState(1, NavbarItem.profile));
        break;
      case NavbarItem.chat:
        emit(const BottomNavigationState(2, NavbarItem.chat));
        break;
      case NavbarItem.settings:
        emit(const BottomNavigationState(3, NavbarItem.settings));
        break;
    }
  }
}
