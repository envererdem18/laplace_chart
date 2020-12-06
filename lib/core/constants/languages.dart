import 'package:laplace_chart/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'tr', value: 'Turkish'),
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'ru', value: 'Russian'),
    LanguageEntity(code: 'fr', value: 'French'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
