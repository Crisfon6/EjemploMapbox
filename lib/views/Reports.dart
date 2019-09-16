import 'package:flutter/material.dart';
import '../api/api_service.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewReport()),
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          'Reports',
        ),
      ),
      body: FutureBuilder(
        future: Api.getReportList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final reports = snapshot.data;
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 40,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    reports[index]['state'],
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(reports[index]['_id']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Report(
                          reports[index]['_id'],
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: reports.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Report extends StatelessWidget {
  final String _id;

  Report(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Reports'),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: Api.getReport(_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                final ubication = snapshot.data['ubication'];
                print(ubication);
                if (snapshot.data != null) {
                  print(snapshot.error);
                  return Column(
                    children: <Widget>[
                      Text(
                        snapshot.data['state'],
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        snapshot.data['user'],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ubication['longitude'].toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ubication['latitude'].toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data['date'],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                } else {
                  Text("Error");
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class NewReport extends StatefulWidget {
  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  final _stateController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Reporte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _stateController,
              decoration: InputDecoration(hintText: 'Estado'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Descripcion'),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                color: Colors.red[300],
                child: Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_descriptionController.text.isEmpty ||
                      _stateController.text.isEmpty) {
                    showDialog(
                        builder: (context) => AlertDialog(
                              title: Text('FAllo'),
                              content: Text(
                                  'Necesitas llenar todos los espacios requeridos'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ok'),
                                )
                              ],
                            ),
                        context: context);
                    return;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
