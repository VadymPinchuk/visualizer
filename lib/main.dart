import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/list_page.dart';
import 'package:visualizer/merge/merge_sort.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/theme/theme_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return ChangeNotifierProvider(
      create: (_) => ThemeConfig(),
      child: Consumer<ThemeConfig>(
        builder: (context, config, _) => MaterialApp(
          title: 'Sorting visualizer',
          theme: config.theme,
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<MergeSort>(create: (_) => MergeSort()),
              ChangeNotifierProvider<SelectionSort>(create: (_) => SelectionSort()),
              ChangeNotifierProvider<BubbleSort>(create: (_) => BubbleSort()),
              ChangeNotifierProvider<InsertionSort>(create: (_) => InsertionSort()),
            ],
            child: const ListPage(title: 'Sorting visualizer'),
          ),
        ),
      ),
    );
  }
}
