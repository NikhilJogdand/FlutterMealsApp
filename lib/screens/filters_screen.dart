import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../providers/filtet_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  static const routeName = '/filters';

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  Widget _buildSwitchListTile(String title, String descriptionText,
      bool currentValue, Function updatedValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(descriptionText),
      onChanged: (newValue) {
        updatedValue(newValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: const [IconButton(icon: Icon(Icons.save), onPressed: null)],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-Free",
                  'Only include gluten-free meals.',
                  activeFilter[Filter.glutenFree]!,
                  (updateValue) => {
                        ref
                            .read(filterProvider.notifier)
                            .setFilter(Filter.glutenFree, updateValue)
                      }),
              _buildSwitchListTile(
                  "Vegetarian",
                  'Only include vegetarian meals.',
                  activeFilter[Filter.vegetarian]!,
                  (updateValue) => {
                        ref
                            .read(filterProvider.notifier)
                            .setFilter(Filter.vegetarian, updateValue)
                      }),
              _buildSwitchListTile(
                  "Vegan",
                  'Only include vegan meals.',
                  activeFilter[Filter.vegan]!,
                  (updateValue) => {
                        ref
                            .read(filterProvider.notifier)
                            .setFilter(Filter.vegan, updateValue)
                      }),
              _buildSwitchListTile(
                  "Lactose",
                  'Only include lactose meals.',
                  activeFilter[Filter.lactoseFree]!,
                  (updateValue) => {
                        ref
                            .read(filterProvider.notifier)
                            .setFilter(Filter.lactoseFree, updateValue)
                      }),
            ],
          ))
        ],
      ),
    );
  }
}