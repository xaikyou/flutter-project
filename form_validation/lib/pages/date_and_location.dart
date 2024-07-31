import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/cubit/date_cubit.dart';
import 'package:form_validation/cubit/end_time_cubit.dart';
import 'package:form_validation/cubit/frequency_check_list_cubit.dart';
import 'package:form_validation/cubit/location_check_list_cubit.dart';
import 'package:form_validation/cubit/start_time_cubit.dart';
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
    final startTimeCubit = BlocProvider.of<StartTimeCubit>(context);
    final endTimeCubit = BlocProvider.of<EndTimeCubit>(context);
    final locationCubit = BlocProvider.of<LocationCheckListCubit>(context);
    final frequencyCubit = BlocProvider.of<FrequencyCheckListCubit>(context);

    final weekController = TextEditingController();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != DateTime.now()) {
        dateCubit.updateDate(picked);
      }
    }

    Future<void> selectStartTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null && picked != TimeOfDay.now()) {
        startTimeCubit.updateTime(picked);
      }
    }

    Future<void> selectEndTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null && picked != TimeOfDay.now()) {
        endTimeCubit.updateTime(picked);
      }
    }

    void validate() {
      if (locationCubit.state.checkListItems
          .every((item) => item['value'] == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose a frequency')),
        );
        return;
      }
      if (frequencyCubit.state.checkListItems
          .every((item) => item['value'] == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose a location')),
        );
        return;
      }
      frequencyCubit.resetItem();
      locationCubit.resetItem();
      nextButton();
    }

    void backFunc() {
      frequencyCubit.resetItem();
      locationCubit.resetItem();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => selectDate(context),
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
                  textTitleWidget(' from '),
                  GestureDetector(
                    onTap: () => selectStartTime(context),
                    child: Card(
                      margin: EdgeInsets.zero,
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
                  ),
                  textTitleWidget(' to '),
                  GestureDetector(
                    onTap: () => selectEndTime(context),
                    child: Card(
                      margin: EdgeInsets.zero,
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
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Frequency
              textTitleWidget('Frequency'),
              BlocBuilder<FrequencyCheckListCubit, FrequencyCheckListState>(
                builder: (_, state) {
                  return Column(
                    children: List.generate(
                      state.checkListItems.length,
                      (index) => CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        contentPadding: EdgeInsets.zero,
                        overlayColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          checkListFrequencyItems[index]["title"],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        value: state.checkListItems[index]['value'],
                        onChanged: (value) => frequencyCubit.toggleItem(index),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.height / 3,
                  child: BlocBuilder<FrequencyCheckListCubit,
                      FrequencyCheckListState>(
                    builder: (_, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: NumberInputWithIncrementDecrement(
                              controller: weekController,
                              min: 1,
                              max: 999,
                              initialValue: 0,
                              enabled: state.checkListItems.last['value']
                                  ? true
                                  : false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: WeekWidget(
                              title: '',
                              categoryItem: weekItems,
                              isEnable: state.checkListItems.last['value'],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
