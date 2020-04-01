import 'package:covid19india/model/historic_data_model.dart';
import 'package:covid19india/model/state_wise.dart';
import 'package:covid19india/networking/remote_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/theme_data.dart';

final now = new DateTime.now();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<HistoricDataModel> data;
  String total_confirmed_cases;
  String total_active_cases;
  String total_recovered_cases;
  String total_deaths_cases;
  String total_cases_last_updated_time;

  String total_confirmed_cases_delta;
  String total_recovered_cases_delta;
  String total_deaths_cases_delta;

  @override
  void initState() {
    super.initState();
    getHistoricData();
  }

  void getHistoricData() {
    data = RemoteRepository.getHistoricDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: SafeArea(
          child: FutureBuilder<HistoricDataModel>(
            builder: (context, snapshot) {
              debugPrint('snapshot ${snapshot.toString()}');
              debugPrint(snapshot.connectionState.toString());
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  debugPrint('snapshot ${snapshot.toString()}');
                  var keyValue = snapshot.data.key_values[0];
                  total_confirmed_cases_delta = keyValue.confirmeddelta;
                  total_recovered_cases_delta = keyValue.recovereddelta;
                  total_deaths_cases_delta = keyValue.deceaseddelta;

                  for (Statewise state in snapshot.data.statewise) {
                    if (state.state == "Total") {
                      total_active_cases = state.active;
                      total_confirmed_cases = state.confirmed;
                      total_deaths_cases = state.deaths;
                      total_recovered_cases = state.recovered;
                      total_cases_last_updated_time = state.lastupdatedtime;
                      break;
                    }
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  casesMetaDataCard(
                                      'CONFIRMED',
                                      total_confirmed_cases_delta,
                                      total_confirmed_cases,
                                      confirmedCasesTextColor),
                                  casesMetaDataCard('ACTIVE', '',
                                      total_active_cases, activeCasesTextColor),
                                  casesMetaDataCard(
                                      'RECOVERED',
                                      total_recovered_cases_delta,
                                      total_recovered_cases,
                                      recoveredCasesTextColor),
                                  casesMetaDataCard(
                                      'DECEASED',
                                      total_deaths_cases_delta,
                                      total_deaths_cases,
                                      deceasedCasesTextColor)
                                ],
                              ),
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                                width: double.maxFinite,
                                child: Text(
                                  'Last updated: $total_cases_last_updated_time',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child:
                            stateWiseDataList(snapshot.data.statewise, context),
                      )),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("Error"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: data,
          ),
        ),
      ),
    );
  }
}

Widget casesMetaDataCard(
    String titleText, String deltaText, String valueText, int textColor) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Text(
          titleText,
          style: titleTextStyle.apply(color: Color(textColor)),
        ),
        SizedBox(
          height: 10,
        ),
        deltaDataWidget(deltaText, textColor),
        SizedBox(
          height: 10,
        ),
        textWidget(valueText, textColor),
      ],
    ),
  );
}

Widget statesCasesMetaData(String titleText, String valueText, int textColor) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      color: Color(textColor).withOpacity(0.2),
      child: Column(
        children: <Widget>[
          Text(
            titleText,
            maxLines: 1,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: titleTextStyle
                .apply(color: Color(textColor))
                .copyWith(fontSize: 10.0),
          ),
          SizedBox(
            height: 10,
          ),
          textWidget(valueText, textColor),
        ],
      ),
    ),
  );
}

Widget deltaDataWidget(String deltaText, int textColor) {
  if (deltaText != null && deltaText.length > 0) {
    return Text(
      '[+$deltaText]',
      style: deltaTextStyle.apply(color: Color(textColor)),
    );
  } else if (deltaText == null) {
    return SizedBox(
      height: 0,
    );
  } else {
    return Text(
      '',
      style: deltaTextStyle.apply(color: Color(textColor)),
    );
  }
}

Widget textWidget(String value, int textColor) {
  debugPrint('value $value');
  if (value != null) {
    return Text(
      value,
      style: deltaTextStyle.apply(color: Color(textColor)),
    );
  } else {
    return Text(
      '',
      style: deltaTextStyle.apply(color: Color(textColor)),
    );
  }
}

Widget stateWiseDataList(List<Statewise> dataList, BuildContext context) {
  debugPrint(dataList.length.toString());
  return ListView.builder(
    itemBuilder: (context, index) {
      if (index != 0) {
        return stateDataListItem(
            context, index, dataList.length, dataList[index]);
      } else {
        return SizedBox();
      }
    },
    itemCount: dataList.length,
    physics: BouncingScrollPhysics(),
    shrinkWrap: false,
  );
}

Widget stateDataListItem(
    BuildContext context, int index, int size, Statewise statewise) {
  debugPrint(statewise.toString());

  if (index == (size - 1)) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  statewise.state,
                  style: stateNameTextStyle.copyWith(
                      color: Color(stateNameTextColor)),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.black,
                  height: 0.2,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    statesCasesMetaData('CONFIRMED', statewise.confirmed,
                        confirmedCasesTextColor),
                    statesCasesMetaData(
                        'ACTIVE', statewise.active, activeCasesTextColor),
                    statesCasesMetaData('RECOVERED', statewise.recovered,
                        recoveredCasesTextColor),
                    statesCasesMetaData(
                        'DECEASED', statewise.deaths, deceasedCasesTextColor)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  statewise.state,
                  style: stateNameTextStyle.copyWith(
                      color: Color(stateNameTextColor)),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.black,
                  height: 0.2,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    statesCasesMetaData('CONFIRMED', statewise.confirmed,
                        confirmedCasesTextColor),
                    statesCasesMetaData(
                        'ACTIVE', statewise.active, activeCasesTextColor),
                    statesCasesMetaData('RECOVERED', statewise.recovered,
                        recoveredCasesTextColor),
                    statesCasesMetaData(
                        'DECEASED', statewise.deaths, deceasedCasesTextColor)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
