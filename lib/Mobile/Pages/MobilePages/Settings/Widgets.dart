// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../Assets/themes.dart';
import 'package:get/get.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}

class LoginScreenThemeSwitch extends StatelessWidget {
  const LoginScreenThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDialOpen = ValueNotifier(false);

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        return WillPopScope(
          onWillPop: (() async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            } else {
              return true;
            }
          }),
          child: SpeedDial(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).backgroundColor,
            overlayColor: Colors.black,
            overlayOpacity: 0.7,
            closeManually: true,
            spaceBetweenChildren: 8,
            openCloseDial: isDialOpen,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  // child: Switch.adaptive(
                  //   value: themeProvider.isDarkMode,
                  //   onChanged: (value) {
                  //     final provider =
                  //         Provider.of<ThemeProvider>(context, listen: false);
                  //     provider.toggleTheme(value);
                  //   },
                  // ),
                  onTap: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  },
                  child: Icon(Icons.nightlight),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).backgroundColor,
                  label: "Switch Theme",
                  labelBackgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.8),
                  labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color)),
              SpeedDialChild(
                  child: Icon(Icons.text_fields),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).backgroundColor,
                  label: "Bold Text",
                  labelBackgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.8),
                  labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color)),
              SpeedDialChild(
                  child: Icon(Icons.perm_device_info_rounded),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).backgroundColor,
                  label: "Club Request Form",
                  labelBackgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.8),
                  labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color))
            ],
          ),
        );
      },
    );
  }
}
