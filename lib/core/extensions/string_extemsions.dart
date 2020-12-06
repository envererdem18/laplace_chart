import 'package:flutter/material.dart';
import 'package:laplace_chart/presentation/app_localizations.dart';

extension StringExtensions on String {
  /// Translate Extension
  /// Usage: TranslationConstants.week.t(context);
  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
