part of 'app_cubit.dart';

sealed class AppState {}

final class AppInitial extends AppState {
  final String modeTheme;
  AppInitial({this.modeTheme = 'light'});
}

class ChangeSettings extends AppState {
  final String modeTheme;
  ChangeSettings(this.modeTheme);
}
