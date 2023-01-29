import 'package:kiwi/kiwi.dart';

import '../screens/bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => SearchBloc());

}
