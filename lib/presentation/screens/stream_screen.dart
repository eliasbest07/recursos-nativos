import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomName$ = ref.watch(nameStreamProvider);
    // if (randomName$.hasValue) {
    //   return Scaffold(
    //     body: CircularProgressIndicator(),
    //   );
    // }
    return Scaffold(
        appBar: AppBar(title: const Text('Stream Provider')),
        body: randomName$.when(
            data: (data) => ListView.builder(
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(data)
                    );
                    // return ListTile(title: Text( data[index]));
                  },
                ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
