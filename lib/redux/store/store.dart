import 'package:demo/redux/app_state.dart';
import 'package:demo/redux/middleware/app_middleware.dart';
import 'package:demo/redux/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> appStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: AppMiddleware().createMiddleware(),
  );
}
