import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/cubit/category_cubit.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget(
      {super.key, required this.title, required this.categoryItem});

  final String title;
  final List<String> categoryItem;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    final categoryController = ExpansionTileController();

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: BlocBuilder<CategoryCubit, String>(
          builder: (_, state) {
            return ExpansionTile(
              controller: categoryController,
              title: Text(state),
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.categoryItem.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      categoryCubit.updateCategory(widget.categoryItem[index]);
                      categoryController.collapse();
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
