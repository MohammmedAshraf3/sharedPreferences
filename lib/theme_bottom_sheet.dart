import 'package:flutter/material.dart';
import 'package:flutter_application_4/appcolor.dart';
import 'package:flutter_application_4/providers/app_congfig_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? gettSelectedItem(AppLocalizations.of(context)!.light)
                  : getUnSelectedItem(AppLocalizations.of(context)!.light),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? gettSelectedItem(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItem(AppLocalizations.of(context)!.dark),
            ),
          ),
        ],
      ),
    );
  }

  Widget gettSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColor.primaryColor),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: AppColor.primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String item) {
    return Text(
      item,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
