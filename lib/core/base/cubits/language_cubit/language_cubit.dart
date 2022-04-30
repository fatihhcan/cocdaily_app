import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<bool> {

  bool languageStateEN = false;
  LanguageCubit() : super(false);
  setLangState(bool langState) {
    languageStateEN = langState;
     emit(languageStateEN);

  }
}
