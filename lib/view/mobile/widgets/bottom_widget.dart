import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/shared/debouncer.dart';
import '../../../providers/pages_provider.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({
    super.key,
  });

  final debouncer = Debouncer(const Duration(milliseconds: 300));

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final pageNumber = ref.watch(pageNumberProvider.notifier).state;
        final totalPages = ref.watch(totalPagesProvider.notifier).state;
        final isPageNumberFirst = pageNumber == 1;
        final isPageNumberLast = pageNumber == totalPages;
        final isButtonsDisabled = debouncer.isRunning;

        return Container(
          padding: const EdgeInsets.only(bottom: 25.0, top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IgnorePointer(
                ignoring: isButtonsDisabled || isPageNumberFirst,
                child: IconButton.outlined(
                  onPressed: () {
                    if (!isButtonsDisabled) {
                      debouncer.run(() {
                        ref.read(pageNumberProvider.notifier).state--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(width: 20.0),
              Text('$pageNumber of $totalPages'),
              const SizedBox(width: 20.0),
              IgnorePointer(
                ignoring: isButtonsDisabled || isPageNumberLast,
                child: IconButton.outlined(
                  onPressed: () {
                    if (!isButtonsDisabled) {
                      debouncer.run(() {
                        ref.read(pageNumberProvider.notifier).state++;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
