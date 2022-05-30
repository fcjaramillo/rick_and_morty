// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(gender) => "${Intl.select(gender, {
            'all': 'Todos',
            'unknown': 'Desconocido',
            'female': 'Mujeres',
            'male': 'Hombres',
            'genderless': 'Sin genero',
          })}";

  static String m1(status) => "${Intl.select(status, {
            'all': 'Todos',
            'alive': 'Vivo',
            'unknown': 'Desconocido',
            'dead': 'Muerto',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "errorData": MessageLookupByLibrary.simpleMessage("Error"),
        "errorInternet": MessageLookupByLibrary.simpleMessage(
            "Error, Verifica tu coneccion a internet"),
        "sDetailEpisode": MessageLookupByLibrary.simpleMessage("Episodios"),
        "sDetailShareCharacter":
            MessageLookupByLibrary.simpleMessage("Compartir Personaje"),
        "sDetailShowLess": MessageLookupByLibrary.simpleMessage("Ver menos"),
        "sDetailShowMore": MessageLookupByLibrary.simpleMessage("Ver mas"),
        "sHomeFirstSeen":
            MessageLookupByLibrary.simpleMessage("Visto primera vez:"),
        "sHomeLastLocation": MessageLookupByLibrary.simpleMessage(
            "Ultima localizacion conocida:"),
        "sHomeLoadData":
            MessageLookupByLibrary.simpleMessage("Cargando data..."),
        "sHomeNotAvailable":
            MessageLookupByLibrary.simpleMessage("No disponible"),
        "sHomeSearch":
            MessageLookupByLibrary.simpleMessage("Buscar personaje..."),
        "sHomeShowFavorites":
            MessageLookupByLibrary.simpleMessage("Mostrar favoritos: "),
        "sWelcomeContinue": MessageLookupByLibrary.simpleMessage("Continuar"),
        "sWelcomeMessage": MessageLookupByLibrary.simpleMessage(
            "En esta prueba, evaluaremos su capacidad para construir la aplicacion mediante el análisis de código\\n y la reproducción del siguiente diseño."),
        "sWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "Bienvenido\n a Rick and Morty"),
        "wFavoriteLost":
            MessageLookupByLibrary.simpleMessage("Pareces perdido en tu viaje"),
        "wFavoriteRemoveFilters":
            MessageLookupByLibrary.simpleMessage("Eliminar filtros"),
        "wFilterGender":
            MessageLookupByLibrary.simpleMessage("Elige el genero"),
        "wFilterGenderValues": m0,
        "wFilterSearch": MessageLookupByLibrary.simpleMessage("Buscar"),
        "wFilterStatus":
            MessageLookupByLibrary.simpleMessage("Elige el status"),
        "wFilterStatusValues": m1,
        "wInfoGender": MessageLookupByLibrary.simpleMessage("Genero"),
        "wInfoInfo": MessageLookupByLibrary.simpleMessage("Informacion"),
        "wInfoOrigin": MessageLookupByLibrary.simpleMessage("Origen"),
        "wInfoType": MessageLookupByLibrary.simpleMessage("Tipo")
      };
}
