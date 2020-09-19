import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/bubble/bubble_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/insertion/insertion_sort_widget.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/selection/selection_sort_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<SelectionSort>(create: (_) => SelectionSort()),
          ChangeNotifierProvider<BubbleSort>(create: (_) => BubbleSort()),
          ChangeNotifierProvider<InsertionSort>(create: (_) => InsertionSort()),
        ],
        child: MyHomePage(title: 'Sorting visualizer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: SelectionSortWidget(),
            ),
            Expanded(
              child: BubbleSortWidget(),
            ),
            Expanded(
              child: InsertionSortWidget(),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<SelectionSort>(context, listen: false).performSorting();
                  Provider.of<BubbleSort>(context, listen: false).performSorting();
                  Provider.of<InsertionSort>(context, listen: false).performSorting();
                },
                tooltip: 'Sort',
                child: Icon(Icons.sort),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<SelectionSort>(context, listen: false).generateData();
                Provider.of<BubbleSort>(context, listen: false).generateData();
                Provider.of<InsertionSort>(context, listen: false).generateData();
              },
              tooltip: 'Generate',
              child: Icon(Icons.settings),
            ),
          ],
        ),
      );
}
