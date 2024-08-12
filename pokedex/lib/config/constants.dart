import 'dart:ui';

import 'package:flutter/material.dart';

const double titleSize = 25;
const Color whiteColor = Color.fromARGB(255, 245, 245, 245);

const String apiBaseUrl = 'https://pokeapi.co/api/v2/';
const String apiGet = 'pokemon?limit=100000&offset=0';

String kTemplate = 'template';

String kName = 'name';
String kId = 'id';
String kSprites = 'sprites';
String kTypes = 'types';
String kType = 'type';
String kOther = 'other';
String kOfficialArtwork = 'official-artwork';
String kFrontDefault = 'front_default';
String kFrontShiny = 'front_shiny';

int maxPokemonId = 1008;
