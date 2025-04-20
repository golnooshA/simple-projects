import 'package:calculator/page/counter.dart';
import 'package:provider/provider.dart';
import 'data/counter_model.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(
  //   MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: const CalculatorView(),
  //   ),
  // );

  runApp(
      ChangeNotifierProvider(create: (_) => CounterModel(), child: MaterialApp(
        title: 'Advanced Counter',
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Counter(),
      ))

  );
}
