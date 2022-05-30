// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Welcome to\n Rick and Morty`
  String get sWelcomeTitle {
    return Intl.message(
      'Welcome to\n Rick and Morty',
      name: 'sWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `In this test, we will evaluate your\nability to build the application\nby analyzing code\nand reproducing the following layout.`
  String get sWelcomeMessage {
    return Intl.message(
      'In this test, we will evaluate your\nability to build the application\nby analyzing code\nand reproducing the following layout.',
      name: 'sWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get sWelcomeContinue {
    return Intl.message(
      'Continue',
      name: 'sWelcomeContinue',
      desc: '',
      args: [],
    );
  }

  /// `Load data...`
  String get sHomeLoadData {
    return Intl.message(
      'Load data...',
      name: 'sHomeLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Search character...`
  String get sHomeSearch {
    return Intl.message(
      'Search character...',
      name: 'sHomeSearch',
      desc: '',
      args: [],
    );
  }

  /// `Show favorites: `
  String get sHomeShowFavorites {
    return Intl.message(
      'Show favorites: ',
      name: 'sHomeShowFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Last know location:`
  String get sHomeLastLocation {
    return Intl.message(
      'Last know location:',
      name: 'sHomeLastLocation',
      desc: '',
      args: [],
    );
  }

  /// `First seen in:`
  String get sHomeFirstSeen {
    return Intl.message(
      'First seen in:',
      name: 'sHomeFirstSeen',
      desc: '',
      args: [],
    );
  }

  /// `Not available`
  String get sHomeNotAvailable {
    return Intl.message(
      'Not available',
      name: 'sHomeNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Choose the gender`
  String get wFilterGender {
    return Intl.message(
      'Choose the gender',
      name: 'wFilterGender',
      desc: '',
      args: [],
    );
  }

  /// `Choose status`
  String get wFilterStatus {
    return Intl.message(
      'Choose status',
      name: 'wFilterStatus',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get wFilterSearch {
    return Intl.message(
      'Search',
      name: 'wFilterSearch',
      desc: '',
      args: [],
    );
  }

  /// `{gender, select, all{All} unknown{Unknown} female{Female} male{Male} genderless{Genderless}}`
  String wFilterGenderValues(Object gender) {
    return Intl.select(
      gender,
      {
        'all': 'All',
        'unknown': 'Unknown',
        'female': 'Female',
        'male': 'Male',
        'genderless': 'Genderless',
      },
      name: 'wFilterGenderValues',
      desc: '',
      args: [gender],
    );
  }

  /// `{status, select, all{All} alive{Alive} unknown{Unknown} dead{Dead}}`
  String wFilterStatusValues(Object status) {
    return Intl.select(
      status,
      {
        'all': 'All',
        'alive': 'Alive',
        'unknown': 'Unknown',
        'dead': 'Dead',
      },
      name: 'wFilterStatusValues',
      desc: '',
      args: [status],
    );
  }

  /// `You seem lost in your travel`
  String get wFavoriteLost {
    return Intl.message(
      'You seem lost in your travel',
      name: 'wFavoriteLost',
      desc: '',
      args: [],
    );
  }

  /// `Remove filters`
  String get wFavoriteRemoveFilters {
    return Intl.message(
      'Remove filters',
      name: 'wFavoriteRemoveFilters',
      desc: '',
      args: [],
    );
  }

  /// `Error, Please verify your connection to internet`
  String get errorInternet {
    return Intl.message(
      'Error, Please verify your connection to internet',
      name: 'errorInternet',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorData {
    return Intl.message(
      'Error',
      name: 'errorData',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
