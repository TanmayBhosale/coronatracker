import 'package:coronatracker_usemy/app/repositories/data_repository.dart';
import 'package:coronatracker_usemy/app/services/api.dart';
import 'package:coronatracker_usemy/app/ui/endpointcard.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Dashoard extends StatefulWidget {
  @override
  _DashoardState createState() => _DashoardState();
}

class _DashoardState extends State<Dashoard> {
  int _cases;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final cases = await dataRepository.getEndpointData(Endpoint.cases);
    setState(() => _cases = cases);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coronavirus Tracker"),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            EndpointCard(
              endpoint: Endpoint.cases,
              value: _cases,
            )
          ],
        ),
      ),
    );
  }
}
