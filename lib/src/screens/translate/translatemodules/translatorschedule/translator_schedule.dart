import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorschedule/fetch_translator_schedules.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_schedule_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/events_model.dart';
import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';

class TranslatorSchedulePage extends StatefulWidget {
  const TranslatorSchedulePage({Key key}) : super(key: key);

  @override
  _TranslatorSchedulePageState createState() => _TranslatorSchedulePageState();
}

class _TranslatorSchedulePageState extends State<TranslatorSchedulePage> {
  /// [CalendarController] for the use of the calender.
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslatorScheduleViewModel>(
      converter: (store) => TranslatorScheduleViewModel(store.state.translateScheduleState, store),
      onInit: (store) => store.dispatch(TranslateScheduleFetchAction(
          currentDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))),
      builder: (context, vm) {
        List<Event> eventsList = [];
        if (vm.translateScheduleState.translateScheduleList.isNotEmpty) {
          eventsList = vm.translateScheduleState
              .translateScheduleList[vm.translateScheduleState.translateScheduleList.keys.first];
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                calendarController: _calendarController,
                availableGestures: AvailableGestures.horizontalSwipe,
                initialCalendarFormat: CalendarFormat.week,
                availableCalendarFormats: {
                  CalendarFormat.week: 'Week',
                },
                calendarStyle: CalendarStyle(markersMaxAmount: 1),
                events: vm.translateScheduleState.translateScheduleList,
                onDaySelected: (time, events, holidays) {
                  vm.store.dispatch(TranslateScheduleFetchAction(
                      currentDate: DateTime(time.year, time.month, time.day)));
                },
              ),
              const SizedBox(height: 10.0),
              Divider(height: 2, color: Colors.black),
              eventsList.isNotEmpty
                  ? ListView.builder(
                      itemCount: eventsList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _commonCardWidget(
                          children: [
                            FormBuilderText(message: eventsList[index].eventTitle),
                            const SizedBox(height: 8.0),
                            FormBuilderText(
                                message:
                                    'Start : ${eventsList[index].eventStartTime.hour}:${eventsList[index].eventStartTime.minute}'),
                            const SizedBox(height: 8.0),
                            FormBuilderText(
                                message:
                                    'End : ${eventsList[index].eventEndTime.hour}:${eventsList[index].eventEndTime.minute}'),
                          ],
                          onCardTap: () {},
                        );
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: FormBuilderText(
                          message: FormBuilderLocalizations.of(context).noEventsText),
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FormBuilderCard(
          onCardTap: () => onCardTap(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children)),
    );
  }
}

class TranslatorScheduleViewModel {
  final TranslateScheduleState translateScheduleState;
  final Store<AppState> store;

  TranslatorScheduleViewModel(this.translateScheduleState, this.store);
}
