import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSheetCubit extends Cubit<bool> {
  HomeSheetCubit() : super(false);

  void onHomeSheetChanged({required bool value}) {
    emit(value);
  }
}
