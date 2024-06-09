import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import 'home_page_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: HookConsumer(
        builder: (_, ref, __) {
          final state = useHomeState(ref);

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Text(
                'Latitude: ${state.position?.latitude}\nLongitude: ${state.position?.longitude}',
              )
            ],
          );
        },
      ),
    );
  }
}
