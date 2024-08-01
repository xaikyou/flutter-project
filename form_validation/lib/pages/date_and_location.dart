import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/config/summary_value.dart';
import 'package:form_validation/cubit/date_cubit.dart';
import 'package:form_validation/cubit/date_to_cubit.dart';
import 'package:form_validation/cubit/end_time_cubit.dart';
import 'package:form_validation/cubit/frequency_check_list_cubit.dart';
import 'package:form_validation/cubit/location_check_list_cubit.dart';
import 'package:form_validation/cubit/num_week_cubit.dart';
import 'package:form_validation/cubit/start_time_cubit.dart';
import 'package:form_validation/cubit/week_cubit.dart';
import 'package:form_validation/widgets/icon_button_widget.dart';
import 'package:form_validation/widgets/text_title_widget.dart';
import 'package:form_validation/widgets/week_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class DateAndLocation extends StatelessWidget {
  const DateAndLocation({
    super.key,
    required this.nextButton,
    required this.backButton,
  });

  final Function nextButton;
  final Function backButton;

  @override
  Widget build(BuildContext context) {
    final dateCubit = BlocProvider.of<DateCubit>(context);
    final dateToCubit = BlocProvider.of<DateToCubit>(context);
    final startTimeCubit = BlocProvider.of<StartTimeCubit>(context);
    final endTimeCubit = BlocProvider.of<EndTimeCubit>(context);
    final locationCubit = BlocProvider.of<LocationCheckListCubit>(context);
    final frequencyCubit = BlocProvider.of<FrequencyCheckListCubit>(context);
    final weekCubit = BlocProvider.of<WeekCubit>(context);
    final numWeekCubit = BlocProvider.of<NumWeekCubit>(context);

    final weekController = TextEditingController();

    Future<void> selectDate(BuildContext context, DateTime? saveDate) async {
      DateTime? picked = dateCubit.state;

      picked = await showDatePicker(
        context: context,
        initialDate: dateCubit.state,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        currentDate: dateCubit.state,
      );
      if (picked != null && picked != DateTime.now()) {
        dateCubit.updateDate(picked);
      }
    }

    Future<void> selectEndDate(BuildContext context, DateTime? saveDate) async {
      DateTime? picked = saveDate;

      picked = await showDatePicker(
        context: context,
        initialDate: dateToCubit.state,
        firstDate: dateToCubit.state,
        lastDate: DateTime(2050),
        currentDate: dateToCubit.state,
      );
      if (picked != null && picked != DateTime.now()) {
        dateToCubit.updateDate(picked);
      }
    }

    Future<void> selectStartTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: startTimeCubit.state,
      );
      if (picked != null && picked != TimeOfDay.now()) {
        startTimeCubit.updateTime(picked);
      }
    }

    int compareTo(TimeOfDay start, TimeOfDay end) {
      if (start.hour < end.hour) return -1;
      if (start.hour > end.hour) return 1;
      if (start.minute < end.minute) return -1;
      if (start.minute > end.minute) return 1;
      return 0;
    }

    Future<void> selectEndTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: endTimeCubit.state,
      );
      if (picked != null && picked != TimeOfDay.now()) {
        if (compareTo(picked, startTimeCubit.state) == 1) {
          endTimeCubit.updateTime(picked);
        } else {
          endTimeCubit.updateTime(startTimeCubit.state);
          startTimeCubit.updateTime(picked);
        }
      }
    }

    void validate() {
      if (frequencyCubit.state.checkListItems
          .every((item) => item['value'] == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose a frequency')),
        );
        return;
      }
      if (locationCubit.state.checkListItems
          .every((item) => item['value'] == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose a location')),
        );
        return;
      }
      startDate = dateCubit.state.toLocal().toString().split(' ')[0];
      endDate = dateToCubit.state.toLocal().toString().split(' ')[0];

      if (compareTo(startTimeCubit.state, endTimeCubit.state) == 1) {
        TimeOfDay temp = startTimeCubit.state;
        startTimeCubit.updateTime(endTimeCubit.state);
        endTimeCubit.updateTime(temp);
      }
      startTime = '${startTimeCubit.state.hour.toString().padLeft(2, '0')}'
          ':${startTimeCubit.state.minute.toString().padLeft(2, '0')}';
      endTime = '${endTimeCubit.state.hour.toString().padLeft(2, '0')}'
          ':${endTimeCubit.state.minute.toString().padLeft(2, '0')}';

      if (frequencyCubit.state.checkListItems.first['value'] == true) {
        frequency = frequencyCubit.state.checkListItems.first['title'];
      } else {
        frequency = "${frequencyCubit.state.checkListItems.last['title']} "
            "${numWeekCubit.state} ${weekCubit.state}";
      }

      location = locationCubit.state.checkListItems.first['value']
          ? locationCubit.state.checkListItems.first['title']
          : locationCubit.state.checkListItems.last['title'];

      nextButton();
    }

    void backFunc() {
      backButton();
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitleWidget('Date'),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textTitleWidget('from'),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => selectDate(context, dateCubit.state),
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: BlocListener<DateCubit, DateTime>(
                            listener: (context, state) {
                              dateToCubit.updateDate(state);
                            },
                            child: BlocBuilder<DateCubit, DateTime>(
                              builder: (_, state) {
                                return Text(
                                  '${state.toLocal()}'.split(' ')[0],
                                  style: const TextStyle(fontSize: normalSize),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    textTitleWidget('to'),
                    const SizedBox(width: 20),
                    BlocBuilder<DateToCubit, DateTime>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () =>
                              selectEndDate(context, dateToCubit.state),
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '${state.toLocal()}'.split(' ')[0],
                                style: const TextStyle(fontSize: normalSize),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              textTitleWidget('Time'),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textTitleWidget('from'),
                  GestureDetector(
                    onTap: () => selectStartTime(context),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Card(
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: BlocBuilder<StartTimeCubit, TimeOfDay>(
                              builder: (_, state) {
                                return Text(
                                  '${state.hour.toString().padLeft(2, '0')}'
                                  ':${state.minute.toString().padLeft(2, '0')}',
                                  style: const TextStyle(fontSize: normalSize),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  textTitleWidget(' to '),
                  GestureDetector(
                    onTap: () => selectEndTime(context),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Card(
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: BlocBuilder<EndTimeCubit, TimeOfDay>(
                              builder: (_, state) {
                                return Text(
                                  '${state.hour.toString().padLeft(2, '0')}'
                                  ':${state.minute.toString().padLeft(2, '0')}',
                                  style: const TextStyle(fontSize: normalSize),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Frequency
              textTitleWidget('Frequency'),
              BlocBuilder<FrequencyCheckListCubit, FrequencyCheckListState>(
                builder: (_, state) {
                  return Column(
                    children: [
                      Column(
                        children: List.generate(
                          state.checkListItems.length,
                          (index) => CheckboxListTile(
                            checkboxShape: const CircleBorder(),
                            contentPadding: EdgeInsets.zero,
                            activeColor: Colors.blue,
                            overlayColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              checkListFrequencyItems[index]['title'],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            value: state.checkListItems[index]['value'],
                            onChanged: (value) =>
                                frequencyCubit.toggleItem(index),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height / 2.5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: NumberInputWithIncrementDecrement(
                                  controller: weekController,
                                  min: 1,
                                  max: 999,
                                  initialValue: numWeekCubit.state,
                                  enabled: state.checkListItems.last['value']
                                      ? true
                                      : false,
                                  onIncrement: (newValue) =>
                                      numWeekCubit.update(newValue.toInt()),
                                  onDecrement: (newValue) =>
                                      numWeekCubit.update(newValue.toInt()),
                                  onSubmitted: (newValue) =>
                                      numWeekCubit.update(newValue.toInt()),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: WeekWidget(
                                  title: weekItems.first,
                                  weekItem: weekItems,
                                  isEnable: state.checkListItems.last['value'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 15),

              // Location
              textTitleWidget('Location'),
              const SizedBox(height: 15),
              BlocBuilder<LocationCheckListCubit, LocationCheckListState>(
                builder: (_, state) {
                  return Column(
                    children: List.generate(
                      state.checkListItems.length,
                      (index) => CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        contentPadding: EdgeInsets.zero,
                        activeColor: Colors.blue,
                        overlayColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          checkListLocationItems[index]["title"],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        value: state.checkListItems[index]['value'],
                        onChanged: (value) => locationCubit.toggleItem(index),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWidget(
                    onPressedFunc: () => backFunc(),
                    icon: const Icon(
                      LineAwesomeIcons.arrow_left_solid,
                    ),
                  ),
                  IconButtonWidget(
                    onPressedFunc: () => validate(),
                    icon: const Icon(
                      LineAwesomeIcons.arrow_right_solid,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
