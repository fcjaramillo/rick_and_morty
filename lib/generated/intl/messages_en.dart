// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(gender) => "${Intl.select(gender, {
            'all': 'All',
            'unknown': 'Unknown',
            'female': 'Female',
            'male': 'Male',
            'genderless': 'Genderless',
          })}";

  static String m1(status) => "${Intl.select(status, {
            'all': 'All',
            'alive': 'Alive',
            'unknown': 'Unknown',
            'dead': 'Dead',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "errorData": MessageLookupByLibrary.simpleMessage("Error"),
        "errorInternet": MessageLookupByLibrary.simpleMessage(
            "Error, Please verify your connection to internet"),
        "sDetailEpisode": MessageLookupByLibrary.simpleMessage("Episodes"),
        "sDetailShareCharacter":
            MessageLookupByLibrary.simpleMessage("Share character"),
        "sDetailShowLess": MessageLookupByLibrary.simpleMessage("Show less"),
        "sDetailShowMore": MessageLookupByLibrary.simpleMessage("Show more"),
        "sHomeFirstSeen":
            MessageLookupByLibrary.simpleMessage("First seen in:"),
        "sHomeLastLocation":
            MessageLookupByLibrary.simpleMessage("Last know location:"),
        "sHomeLoadData": MessageLookupByLibrary.simpleMessage("Load data..."),
        "sHomeNotAvailable":
            MessageLookupByLibrary.simpleMessage("Not available"),
        "sHomeSearch":
            MessageLookupByLibrary.simpleMessage("Search character..."),
        "sHomeShowFavorites":
            MessageLookupByLibrary.simpleMessage("Show favorites: "),
        "sWelcomeContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "sWelcomeMessage": MessageLookupByLibrary.simpleMessage(
            "In this test, we will evaluate your\nability to build the application\nby analyzing code\nand reproducing the following layout."),
        "sWelcomeTitle":
            MessageLookupByLibrary.simpleMessage("Welcome to\n Rick and Morty"),
        "wFavoriteLost": MessageLookupByLibrary.simpleMessage(
            "You seem lost in your travel"),
        "wFavoriteRemoveFilters":
            MessageLookupByLibrary.simpleMessage("Remove filters"),
        "wFilterGender":
            MessageLookupByLibrary.simpleMessage("Choose the gender"),
        "wFilterGenderValues": m0,
        "wFilterSearch": MessageLookupByLibrary.simpleMessage("Search"),
        "wFilterStatus": MessageLookupByLibrary.simpleMessage("Choose status"),
        "wFilterStatusValues": m1,
        "wInfoGender": MessageLookupByLibrary.simpleMessage("Gender"),
        "wInfoInfo": MessageLookupByLibrary.simpleMessage("Information"),
        "wInfoOrigin": MessageLookupByLibrary.simpleMessage("Origin"),
        "wInfoType": MessageLookupByLibrary.simpleMessage("Type")
      };
}
