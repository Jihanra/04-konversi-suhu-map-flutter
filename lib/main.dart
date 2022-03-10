import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_map_flutter/widget/Dropdown.dart';
import 'package:konversi_suhu_map_flutter/widget/result1.dart';

import 'widget/Convert.dart';
import 'widget/Result.dart';
import 'widget/Input.dart';

//Jihan Rahadatul Aisy (2031710034)
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur"];
  String _selectedDropdown = "Pilih Suhu";
  final List<String> _listSatuanSuhu = ['Pilih Suhu', 'Kelvin', 'Reamur'];
  final List<String> _listViewItem = [];

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
    konversi();
  }

  konversi() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            _listViewItem
                .add("Konversi dari $_inputUser Celcius ke $_result Kelvin");
            break;
          case "Reamur":
            _result = _inputUser * 4 / 5;
            _listViewItem
                .add("Konversi dari $_inputUser Celcius ke $_result Reamur");
            break;
          default:
            _listViewItem.add("Suhu belum dipilih");
            break;
        }
      } else {
        _listViewItem.add("Suhu belum dipilih dan Celcius kosong");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu -> Jihan R.A (2031710034)"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Result(
                    result: _result,
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              Convert(
                konversi: konversi,
              ),
              result1(
                listViewItem: _listViewItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
