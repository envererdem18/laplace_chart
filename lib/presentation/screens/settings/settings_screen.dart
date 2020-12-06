import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laplace_chart/core/constants/languages.dart';
import 'package:laplace_chart/core/constants/translation_constants.dart';
import 'package:laplace_chart/core/extensions/string_extemsions.dart';
import 'package:laplace_chart/presentation/bolcs/language_bloc/language_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${TranslationConstants.settings.t(context)}"),
      ),
      body: ListView.builder(
        itemCount: Languages.languages.length,
        itemBuilder: (context, index) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoaded) {
                return ListTile(
                  leading: Icon(Icons.language),
                  tileColor: state.locale.languageCode == Languages.languages[index].code ? Colors.green[100] : Colors.white,
                  title: Text(Languages.languages[index].value.toLowerCase().t(context)),
                  onTap: () {
                    BlocProvider.of<LanguageBloc>(context).add(ToggleLanguageEvent(Languages.languages[index]));
                  },
                );
              }
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
