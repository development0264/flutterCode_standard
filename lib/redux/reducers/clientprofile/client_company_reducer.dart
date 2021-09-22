import 'package:khontext/redux/actions/clientprofile/client_company_action.dart';
import 'package:khontext/redux/states/clientprofile/client_company_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<ClientCompanyState> clientCompanyReducer = combineReducers([
  /// Client Company
  TypedReducer<ClientCompanyState, ClientCompanyFetchAction>(clientCompanyFetch),
  TypedReducer<ClientCompanyState, ClientCompanyFetchErrorAction>(clientCompanyFetchError),
  TypedReducer<ClientCompanyState, ClientCompanyFetchSuccessAction>(clientCompanyFetchSuccess),

  /// Client Add Company
  TypedReducer<ClientCompanyState, ClientCompanyAddAction>(clientAddCompany),
  TypedReducer<ClientCompanyState, ClientCompanyAddErrorAction>(clientAddCompanyError),
  TypedReducer<ClientCompanyState, ClientCompanyAddSuccessAction>(clientAddCompanySuccess),

  /// Client Add Company Image
  TypedReducer<ClientCompanyState, ClientCompanyAddImageAction>(clientAddCompanyImage),
  TypedReducer<ClientCompanyState, ClientCompanyAddImageErrorAction>(clientAddCompanyImageError),
  TypedReducer<ClientCompanyState, ClientCompanyAddImageSuccessAction>(clientAddCompanyImageSuccess),

  /// Client Update Company
  TypedReducer<ClientCompanyState, ClientCompanyUpdateAction>(clientUpdateCompany),
  TypedReducer<ClientCompanyState, ClientCompanyUpdateErrorAction>(clientUpdateCompanyError),
  TypedReducer<ClientCompanyState, ClientCompanyUpdateSuccessAction>(clientUpdateCompanySuccess),

  /// Client Update Company Image
  TypedReducer<ClientCompanyState, ClientCompanyUpdateImageAction>(clientUpdateCompanyImage),
  TypedReducer<ClientCompanyState, ClientCompanyUpdateImageErrorAction>(clientUpdateCompanyImageError),
  TypedReducer<ClientCompanyState, ClientCompanyUpdateImageSuccessAction>(clientUpdateCompanyImageSuccess),
]);

/// Client company : It contains client company data and client company image data.
ClientCompanyState clientCompanyFetch(ClientCompanyState state, ClientCompanyFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientCompanyFetchAction);
}

ClientCompanyState clientCompanyFetchError(ClientCompanyState state, ClientCompanyFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientCompanyFetchErrorAction);
}

ClientCompanyState clientCompanyFetchSuccess(ClientCompanyState state, ClientCompanyFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientCompanyFetchSuccessAction,
    clientCompanyResponseModel: action.clientCompanyResponseModel,
    clientCompanyProfileImageResponseModel: action.clientCompanyProfileImageResponseModel,
  );
}

/// Client add company.
ClientCompanyState clientAddCompany(ClientCompanyState state, ClientCompanyAddAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientCompanyAddAction);
}

ClientCompanyState clientAddCompanyError(ClientCompanyState state, ClientCompanyAddErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientCompanyAddErrorAction);
}

ClientCompanyState clientAddCompanySuccess(ClientCompanyState state, ClientCompanyAddSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientCompanyAddSuccessAction,
    clientCompanyResponseModel: action.clientCompanyResponseModel,
  );
}

/// Client add company image.
ClientCompanyState clientAddCompanyImage(ClientCompanyState state, ClientCompanyAddImageAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientCompanyAddImageAction);
}

ClientCompanyState clientAddCompanyImageError(ClientCompanyState state, ClientCompanyAddImageErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientCompanyAddImageErrorAction);
}

ClientCompanyState clientAddCompanyImageSuccess(ClientCompanyState state, ClientCompanyAddImageSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientCompanyAddImageSuccessAction,
    clientCompanyProfileImageResponseModel: action.clientCompanyImageResponseModel,
  );
}

/// Client update company.
ClientCompanyState clientUpdateCompany(ClientCompanyState state, ClientCompanyUpdateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientCompanyUpdateAction);
}

ClientCompanyState clientUpdateCompanyError(ClientCompanyState state, ClientCompanyUpdateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientCompanyUpdateErrorAction);
}

ClientCompanyState clientUpdateCompanySuccess(ClientCompanyState state, ClientCompanyUpdateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientCompanyUpdateSuccessAction,
    clientCompanyResponseModel: action.clientCompanyResponseModel,
  );
}

/// Client update company image.
ClientCompanyState clientUpdateCompanyImage(ClientCompanyState state, ClientCompanyUpdateImageAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientCompanyUpdateImageAction);
}

ClientCompanyState clientUpdateCompanyImageError(ClientCompanyState state, ClientCompanyUpdateImageErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientCompanyUpdateImageErrorAction);
}

ClientCompanyState clientUpdateCompanyImageSuccess(
    ClientCompanyState state, ClientCompanyUpdateImageSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientCompanyUpdateImageSuccessAction,
    clientCompanyProfileImageResponseModel: action.clientCompanyImageResponseModel,
  );
}
