import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/cubit/category_cubit.dart';
import 'package:form_validation/cubit/date_cubit.dart';
import 'package:form_validation/cubit/end_time_cubit.dart';
import 'package:form_validation/cubit/frequency_check_list_cubit.dart';
import 'package:form_validation/cubit/guest_can_cubit.dart';
import 'package:form_validation/cubit/location_check_list_cubit.dart';
import 'package:form_validation/cubit/start_time_cubit.dart';
import 'package:form_validation/cubit/week_cubit.dart';
import 'package:form_validation/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => DateCubit()),
        BlocProvider(create: (context) => StartTimeCubit()),
        BlocProvider(create: (context) => EndTimeCubit()),
        BlocProvider(
          create: (context) => FrequencyCheckListCubit(
            [...checkListFrequencyItems],
          ),
        ),
        BlocProvider(create: (context) => WeekCubit()),
        BlocProvider(
          create: (context) => LocationCheckListCubit(
            [...checkListLocationItems],
          ),
        ),
        BlocProvider(
          create: (context) => GuestCanCubit(
            [...guestCanList],
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansMonoTextTheme().apply(
            bodyColor: Colors.black,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
