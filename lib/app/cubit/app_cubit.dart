// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:food_app/app/cache/shared_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  String theme = "light";
  final SharedHelper sharedHelper;

  AppCubit(this.sharedHelper, this.theme) : super(AppInitial());

  Future<void> init() async {
    theme = await sharedHelper.getTheme() ?? "light";
    emit(AppInitial(modeTheme: theme));
  }

  void changeTheme(String newTheme) {
    theme = newTheme;
    sharedHelper.saveTheme(theme);
    emit(ChangeSettings(theme));
  }
}
