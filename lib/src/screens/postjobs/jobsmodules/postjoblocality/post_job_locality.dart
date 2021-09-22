import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_locality_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_locality_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/screens/postjobs/bottom_navigations_buttons_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class PostJobLocality extends StatefulWidget {
  final String jobId;
  final Function moveBackward;

  const PostJobLocality({Key key, this.moveBackward, this.jobId}) : super(key: key);

  @override
  _PostJobLocalityState createState() => _PostJobLocalityState();
}

class _PostJobLocalityState extends State<PostJobLocality> {
  /// Global key for maintaining the state of the form.
  final _locationFormKey = GlobalKey<FormBuilderState>();

  /// Store instance to use further
  Store<AppState> store;

  /// States of the application
  JobDescriptionData jobDescriptionData;
  ClientAddressData postJobAddressData;
  ClientAddressResponseModel postJobAddressResponseModel;

  AddressReturnModel addressReturnModel;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    jobDescriptionData = store.state.postJobDescriptionState.postJobDescriptionResponseModel.data;
    postJobAddressResponseModel = store.state.postJobLocalityState.clientAddressResponseModel;
    postJobAddressData = store.state.postJobLocalityState.clientAddressResponseModel.data;
    if (postJobAddressData == null) {
      store.dispatch(PostJobLocalityFetchAction(jobId: widget.jobId != null ? widget.jobId : jobDescriptionData.jobId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LocationViewModel>(
        converter: (store) => LocationViewModel(
              store,
              state: store.state.postJobsState,
              localityState: store.state.postJobLocalityState,
            ),
        builder: (context, LocationViewModel vm) {
          if (vm.localityState?.clientAddressResponseModel?.data != null &&
              vm.localityState?.currentAction == PostJobLocalityFetchSuccessAction) {
            postJobAddressData = vm.localityState?.clientAddressResponseModel?.data;
            postJobAddressResponseModel = vm.localityState?.clientAddressResponseModel;
          }

          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseAddressWidget(
                        locationFormKey: _locationFormKey,
                        clientAddressData: vm.localityState?.clientAddressResponseModel?.data,
                        onAddressChanged: (AddressReturnModel addressReturnModel) =>
                            this.addressReturnModel = addressReturnModel,
                      ),
                      const SizedBox(height: 12.0),
                      postJobButtonsNavigation(),
                    ],
                  ),
                ),
              ),
              if (vm.localityState.isLoading) ...[
                BaseLoadingWidget(),
              ]
            ],
          );
        });
  }

  /// Widget function which gives the bottom button navigation widget.
  /// This have two buttons, [BACK] and [NEXT].
  Widget postJobButtonsNavigation() {
    return PostJobBottomNavigation(
      moveAhead: () => moveAheadTap(),
      moveBackward: () => moveBackTap(),
      backEnabled: true,
      forwardEnabled: true,
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [moveBackTap], [moveAheadTap], [onSuggestionsClicked], [onSuggestionsCallback] and
  /// [checkAllValidations].
  void moveAheadTap() {
    if (checkAllValidations()) {
      List<String> address = [
        this.addressReturnModel.subLocality2,
        this.addressReturnModel.subLocality1,
        this.addressReturnModel.locality
      ];
      if (!Utils.isProfileDataAdded(postJobAddressResponseModel)) {
        store.dispatch(
          PostJobLocalityAddAction(
              addressCreateRequestModel: AddressCreateRequestModel(
                streetNumber: this.addressReturnModel.streetNumber,
                streetName: this.addressReturnModel.streetRoute,
                line1: this.addressReturnModel.subLocality3,
                line2: Utils().getSeparatedAddress(address),
                addressType: Constants.mailingText,
                city: this.addressReturnModel.city,
                county: this.addressReturnModel.state,
                zipCode: this.addressReturnModel.postalCode,
                timezone: this.addressReturnModel.selectedTimeZone,
                country: this.addressReturnModel.country,
              ),
              jobId: widget.jobId != null
                  ? widget.jobId
                  : jobDescriptionData?.jobId?.isNotEmpty == true
                      ? jobDescriptionData.jobId
                      : null),
        );
      } else {
        store.dispatch(
          PostJobLocalityUpdateAction(
            addressCreateRequestModel: AddressCreateRequestModel(
              streetNumber: this.addressReturnModel.streetNumber,
              streetName: this.addressReturnModel.streetRoute,
              line1: this.addressReturnModel.subLocality3,
              line2: Utils().getSeparatedAddress(address),
              addressType: Constants.mailingText,
              city: this.addressReturnModel.city,
              county: this.addressReturnModel.state,
              zipCode: this.addressReturnModel.postalCode,
              timezone: this.addressReturnModel.selectedTimeZone,
              country: this.addressReturnModel.country,
            ),
          ),
        );
      }
    } else {
      Toast.show(FormBuilderLocalizations.of(context).addAllDetailsErrorText, context);
    }
  }

  void moveBackTap() {
    widget.moveBackward(null);
  }

  bool checkAllValidations() {
    return _locationFormKey.currentState.validate() && this.addressReturnModel?.selectedTimeZone?.isNotEmpty == true;
  }
}

class LocationViewModel {
  final Store<AppState> appState;
  final PostJobsState state;
  final PostJobLocalityState localityState;

  LocationViewModel(this.appState, {this.state, this.localityState});
}
