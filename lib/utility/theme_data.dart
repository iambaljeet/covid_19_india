import 'package:flutter/material.dart';

ThemeData get appTheme =>
    ThemeData(primarySwatch: Colors.blue, fontFamily: 'SourceSansPro');

const TextStyle titleTextStyle =
    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

const TextStyle deltaTextStyle =
    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

const TextStyle casesCountTextStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

const TextStyle stateNameTextStyle =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

const TextStyle generalListDataTextStyle =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

const TextStyle homeTabTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontFamily: 'SourceSansPro');

int get confirmedCasesTextColor => Colors.red[400].value;
int get activeCasesTextColor => Colors.blue[400].value;
int get recoveredCasesTextColor => Colors.green[400].value;
int get deceasedCasesTextColor => Colors.grey[800].value;

int get stateNameTextColor => Colors.black.value;
