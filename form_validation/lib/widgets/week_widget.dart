import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/cubit/week_cubit.dart';

class WeekWidget extends StatefulWidget {
  const WeekWidget({
    super.key,
    required this.title,
    required this.weekItem,
    required this.isEnable,
  });

  final String title;
  final List<String> weekItem;
  final bool isEnable;

  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final weekCubit = BlocProvider.of<WeekCubit>(context);

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.isEnable) {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              color: widget.isEnable ? Colors.blueAccent : Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weekCubit.state,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(
                    _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? (widget.weekItem.length * 50.0) : 0,
            child: _isExpanded
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.weekItem.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        weekCubit.updateWeek(widget.weekItem[index]);
                        setState(() {
                          _isExpanded =
                              false; // Collapse the container after selection
                        });
                      },
                      child: ListTile(
                        title: Text(widget.weekItem[index]),
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
