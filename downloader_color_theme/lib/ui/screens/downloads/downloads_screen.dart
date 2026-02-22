import 'package:downloader_color_theme/ui/screens/downloads/widgets/download_tile.dart';
import 'package:downloader_color_theme/ui/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'widgets/download_controler.dart';

class DownloadsScreen extends StatelessWidget {
  // Create the list of fake ressources
  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image1.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  final List<DownloadController> controllers = [];

  DownloadsScreen({super.key}) {
    // Create a controllers for each ressource
    for (Ressource ressource in ressources) {
      controllers.add(DownloadController(ressource));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorTheme,
      builder: (context, _) {
        return Container(
          // color: currentThemeColor.backgroundColor,
          color: colorTheme.current.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                "Downloads",
                style: AppTextStyles.heading.copyWith(
                  color: colorTheme.current.color,
                ),
              ),

              SizedBox(height: 50),

              // TODO - Add the Download tiles
              Column(
                children: controllers.map((controller) => DownloadTile(controller: controller)).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
