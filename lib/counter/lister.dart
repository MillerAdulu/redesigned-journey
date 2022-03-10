import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/counter/cubit/get_items_cubit.dart';
import 'package:training/models/_index.dart';

class ItemListingPage extends StatefulWidget {
  const ItemListingPage({Key? key}) : super(key: key);

  @override
  State<ItemListingPage> createState() => _ItemListingPageState();
}

class _ItemListingPageState extends State<ItemListingPage> {
  @override
  void initState() {
    super.initState();

    context.read<GetItemsCubit>().getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<GetItemsCubit, GetItemsState>(
        builder: (BuildContext context, GetItemsState state) {
          return state.when(
            initial: () => const Center(child: Text('Welcome')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (List<MediaItem> items) => items.isEmpty
                ? const Center(child: Text('Welcome'))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(items[index].name),
                      subtitle: Text(items[index].slug),
                    ),
                  ),
            error: (error) => Center(child: Text(error)),
          );
        },
      ),
    );
  }
}
