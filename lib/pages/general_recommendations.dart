import 'package:covid19india/model/general_data_model.dart';
import 'package:covid19india/networking/local_repository.dart';
import 'package:covid19india/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralRecommendations extends StatefulWidget {
  @override
  _GeneralRecommendationsState createState() => _GeneralRecommendationsState();
}

class _GeneralRecommendationsState extends State<GeneralRecommendations> {
  Future<GeneralDataModel> data;

  @override
  void initState() {
    super.initState();
    getHistoricData();
  }

  void getHistoricData() {
    data = LocalRepository.getGeneralData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: SafeArea(
          child: FutureBuilder<GeneralDataModel>(
            future: data,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              debugPrint('snapshot ${snapshot.toString()}');
              debugPrint(snapshot.connectionState.toString());
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  debugPrint('snapshot ${snapshot.toString()}');
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _cardView(
                        Center(
                          child: Text(
                            'Recommendations',
                            style: titleTextStyle.copyWith(fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: _generalRecommendationsList(
                            snapshot.data.generalRecommendations),
                      ),
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
          ),
        ),
      ),
    );
  }
}

Widget _cardView(Widget childWidget) {
  return Container(
    width: double.maxFinite,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: childWidget,
      ),
    ),
  );
}

Widget _generalRecommendationsList(List<String> list) {
  return _cardView(
    ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return _dataListItem(index, list.length, list[index]);
      },
    ),
  );
}

Widget _dataListItem(int index, int size, String data) {
  if (index == (size - 1)) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: _cardView(
        Text(
          data.toString(),
          style: generalListDataTextStyle,
        ),
      ),
    );
  } else {
    return _cardView(
      Text(
        data.toString(),
        style: generalListDataTextStyle,
      ),
    );
  }
}
