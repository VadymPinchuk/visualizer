import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/bubble/bubble_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/insertion/insertion_sort_widget.dart';
import 'package:visualizer/merge/merge_sort.dart';
import 'package:visualizer/merge/merge_sort_widget.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/selection/selection_sort_widget.dart';
import 'package:visualizer/theme/theme_config.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: Provider.of<ThemeConfig>(context, listen: false).changeTheme,
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            MergeSortWidget(),
            SelectionSortWidget(),
            BubbleSortWidget(),
            InsertionSortWidget(),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<MergeSort>(context, listen: false).performSorting();
                  Provider.of<SelectionSort>(context, listen: false).performSorting();
                  Provider.of<BubbleSort>(context, listen: false).performSorting();
                  Provider.of<InsertionSort>(context, listen: false).performSorting();
                },
                tooltip: 'Sort',
                child: const Icon(Icons.sort),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<MergeSort>(context, listen: false).generateData();
                Provider.of<SelectionSort>(context, listen: false).generateData();
                Provider.of<BubbleSort>(context, listen: false).generateData();
                Provider.of<InsertionSort>(context, listen: false).generateData();
              },
              tooltip: 'Generate',
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      );
}
