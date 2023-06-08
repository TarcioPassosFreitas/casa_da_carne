import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'home_page.dart';

class NoInternetPage extends StatefulWidget {
  final Widget child;

  NoInternetPage({Key? key, required this.child}) : super(key: key);

  @override
  _NoInternetPageState createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  bool loading = true;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    ConnectivityResult connectivityResult;
    connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      setState(() {
        _connectionStatus = connectivityResult;
        connected = true;
        loading = false;
      });
    } else {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _connectionStatus = connectivityResult;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (!connected) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.red,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sem conexão com a Internet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: checkConnectivity,
                child: Text('Tentar novamente'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return widget.child;
    }
  }
}
