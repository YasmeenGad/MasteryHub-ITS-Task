import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../../../generated/assets.dart';

class EmptySearchPlaceholder extends StatelessWidget {
  const EmptySearchPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.imagesSearch,
        width: context.width * 0.3,
        height: context.height * 0.3,
      ),
    );
  }
}
