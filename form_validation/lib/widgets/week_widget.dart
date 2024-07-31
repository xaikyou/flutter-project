import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/cubit/week_cubit.dart';

class WeekWidget extends StatefulWidget {
  const WeekWidget({
    super.key,
    required this.title,
    required this.categoryItem,
    required this.isEnable,
  });

  final String title;
  final List<String> categoryItem;
  final bool isEnable;

  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  @override
  Widget build(BuildContext context) {
    final weekCubit = BlocProvider.of<WeekCubit>(context);
    final weekController = ExpansionTileController();

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: BlocBuilder<WeekCubit, String>(
          builder: (_, state) {
            return ExpansionTile(
              controller: weekController,
              enabled: widget.isEnable,
              title: Text(state),
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.categoryItem.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      weekCubit.updateWeek(widget.categoryItem[index]);
                      weekController.collapse();
                    },
                    child: ListTile(
                      title: Text(widget.categoryItem[index]),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
