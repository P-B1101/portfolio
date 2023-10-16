import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/export_bloc.dart';

class ExportWidget extends StatelessWidget {
  final Function() onExportClick;
  const ExportWidget({
    Key? key,
    required this.onExportClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.all(8),
            width: 42,
            child: AspectRatio(
              aspectRatio: 1,
              child: BlocBuilder<ExportBloc, ExportState>(
                builder: (context, state) {
                  return state is ExportLoadingState
                      ? const SizedBox()
                      : Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onExportClick,
                            child: Icon(
                              Icons.print_rounded,
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        );
                },
              ),
            ),
          );
  }
}
