import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/holder/sort_holder.dart';
import 'package:visualizer/options_drawer.dart';
import 'package:visualizer/strings.dart';

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
              icon: const Icon(Icons.sort),
              onPressed: () => Provider.of<SortHolder>(context, listen: false)
                  .startSorting(context),
              tooltip: 'Sort',
            ),
            IconButton(
              icon: const Icon(Icons.shuffle),
              onPressed: () => Provider.of<SortHolder>(context, listen: false)
                  .shuffleData(context),
              tooltip: 'Shuffle',
            )
          ],
        ),
        drawer: OptionsDrawer(),
        body: Consumer<SortHolder>(
          builder: (context, types, _) {
            final List<Widget> widgets = types.generateWidgets(context);
            return widgets.isEmpty
                ? Center(
                    child: Text(
                      '$DRAWER_TITLE\n\n$EMPTY_MESSAGE',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          .copyWith(fontSize: 18.0),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(8),
                    children: widgets,
                  );
          },
        ),
      );
}
