import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/config/config_holder.dart';
import 'package:visualizer/holder/sort_holder.dart';
import 'package:visualizer/strings.dart';
import 'package:visualizer/theme/theme_config.dart';

class OptionsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyLarge!;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Consumer<SortHolder>(
              builder: (context, types, _) => ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      DRAWER_TITLE,
                      style: textStyle.copyWith(fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text(MERGE_SORT),
                    secondary: Icon(Icons.fast_forward, color: textStyle.color),
                    value: types.contains(Sorting.Merge),
                    onChanged: (_) => types.switchSorting(Sorting.Merge),
                  ),
                  CheckboxListTile(
                    title: const Text(HEAP_SORT),
                    secondary: Icon(Icons.fast_forward, color: textStyle.color),
                    value: types.contains(Sorting.Heap),
                    onChanged: (_) => types.switchSorting(Sorting.Heap),
                  ),
                  CheckboxListTile(
                    title: const Text(BUBBLE_SORT),
                    secondary: Icon(Icons.play_arrow, color: textStyle.color),
                    value: types.contains(Sorting.Bubble),
                    onChanged: (_) => types.switchSorting(Sorting.Bubble),
                  ),
                  CheckboxListTile(
                    title: const Text(INSERTION_SORT),
                    secondary: Icon(Icons.play_arrow, color: textStyle.color),
                    value: types.contains(Sorting.Insertion),
                    onChanged: (_) => types.switchSorting(Sorting.Insertion),
                  ),
                  CheckboxListTile(
                    title: const Text(SELECTION_SORT),
                    secondary: Icon(Icons.play_arrow, color: textStyle.color),
                    value: types.contains(Sorting.Selection),
                    onChanged: (_) => types.switchSorting(Sorting.Selection),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 2.0,
          ),
          Consumer<ConfigHolder>(
            builder: (context, config, _) => ListTile(
              title:
                  Text(config.showNumbers ? 'Numbers shown' : 'Numbers hidden'),
              trailing: Switch(
                value: config.showNumbers,
                onChanged: (_) =>
                    Provider.of<ConfigHolder>(context, listen: false)
                        .switchNumberDisplaying(),
              ),
              onTap: Provider.of<ConfigHolder>(context, listen: false)
                  .switchNumberDisplaying,
            ),
          ),
          ListTile(
            title: const Text('Change theme'),
            leading: Icon(Icons.brightness_6, color: textStyle.color),
            onTap: Provider.of<ThemeConfig>(context, listen: false).changeTheme,
          ),
        ],
      ),
    );
  }
}
