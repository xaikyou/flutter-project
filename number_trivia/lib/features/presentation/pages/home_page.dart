import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_trivia/features/presentation/cubit/number_trivia_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Number  Trivia',
          style: GoogleFonts.heptaSlab(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildDisplayPanel(context),
          buildControlPanel(context),
        ],
      ),
    );
  }

  Widget buildDisplayPanel(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
        builder: (_, state) {
          if (state is LoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }
          if (state is DoneState) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.numberTrivia!.number.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                    SizedBox(
                      height: 50,
                      child: Divider(
                        thickness: 3,
                        color: Colors.teal[700],
                        indent: 50,
                        endIndent: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        state.numberTrivia!.text ?? '',
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildControlPanel(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final cubit = BlocProvider.of<NumberTriviaCubit>(context);

    void getInputNumber() {
      int? number;
      try {
        number = int.tryParse(textController.text);
        textController.clear();
      } catch (_) {
        number = 42;
      }
      cubit.getConcretNumberTrivia(number!);
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // Search number manually
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: TextFormField(
              controller: textController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (_) => getInputNumber(),
              maxLength: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: GestureDetector(
                  onTap: () => getInputNumber(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.teal.shade500,
                      size: 30,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.black45, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.black54, width: 2.0),
                ),
                hintText: "Enter a number",
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),

          const SizedBox(height: 25),

          // Random button
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(
                  const Size(double.infinity, 70)),
              elevation: WidgetStateProperty.all<double>(5.0),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black54),
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.teal.shade500),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black54,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            onPressed: () {
              cubit.getRandomNumberTrivia();
            },
            child: const Text(
              'Get Random Number',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
