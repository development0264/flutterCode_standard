import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/middleware/app_middleware.dart';
import 'package:khontext/redux/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> appStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: AppMiddleware().createMiddleware(),
  );
}
