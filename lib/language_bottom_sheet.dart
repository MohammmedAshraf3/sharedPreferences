import 'package:flutter/material.dart';
import 'package:flutter_application_4/appcolor.dart';
import 'package:flutter_application_4/providers/app_congfig_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItem(AppLocalizations.of(context)!.english)
                  : getUnSelectedItem(AppLocalizations.of(context)!.english),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: provider.appLanguage == 'ar'
                    ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItem(AppLocalizations.of(context)!.arabic)),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
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
