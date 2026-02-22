import 'package:downloader_color_theme/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import 'download_controler.dart';
import '../../downloads/downloads_screen.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [Padding(padding: EdgeInsets.all(16), child: ListTile())],
    // );
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ListTile(
              title: Text(controller.ressource.name),
              subtitle: _buildSubtitle(),
              trailing: _buildTrailing(),
            ),
          ),
        );
      },
    );

    // TODO
  }

  Widget _buildSubtitle() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return Text("0.0 % completed - 0.0 of ${controller.ressource.size} MB");
      case DownloadStatus.downloading:
        final downloaded = (controller.ressource.size * controller.progress)
            .toStringAsFixed(1);
        final percentage = (controller.progress * 100).toStringAsFixed(1);
        return Text(
          "$percentage % completed - $downloaded of ${controller.ressource.size} MB",
          // "${(controller.progress * 100).toInt()}% completed - ${(controller.ressource.size * controller.progress).toStringAsFixed(1)} of ${controller.ressource.size} MB",
        );
      case DownloadStatus.downloaded:
        return Text(
          "100% completed - ${controller.ressource.size} of ${controller.ressource.size} MB",
        );
    }
  }

  Widget _buildTrailing() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return IconButton(
          onPressed: controller.startDownload,
          icon: Icon(Icons.download),
        );
      case DownloadStatus.downloading:
        return IconButton(
          onPressed: controller.startDownload,
          icon: Icon(Icons.downloading),
        );
      case DownloadStatus.downloaded:
        return IconButton(
          onPressed: controller.startDownload,
          icon: Icon(Icons.folder),
        );
    }
  }
}
