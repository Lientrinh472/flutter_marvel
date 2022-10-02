// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marvel_table/services/remote_services.dart';
import '../models/post.dart';
import '../views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Data? _marvel;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _marvel = await RemoteServices().getPosts();
    if (_marvel != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MARVEL'),
          ),
          body: Container(
            // return const AssetImage('images/marvel.jpg'),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/marvel.jpg"),
                  fit: BoxFit.cover),
              ),
              child: Center(
                child: SizedBox(
                  height: 1200,
                  width: 1200,
                  child: ListView(
                    children: [_createDataTable()],
                  ),
                ),
              )
              )
              ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
        columns: _createColumns(),
        rows: _createRows(),
        dataRowHeight: 80,
        showBottomBorder: true,
        border: const TableBorder(
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
            verticalInside: BorderSide(width: 1),
            horizontalInside: BorderSide(width: 1)),
        headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 160, 9, 9)));
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Name')),
      const DataColumn(label: Text('Description')),
      const DataColumn(label: Text('ResourceURI')),
      const DataColumn(label: Text('Thumbnails')),
      const DataColumn(label: Text('Details'))
    ];
  }

  List<DataRow> _createRows() {
    return _marvel!.results
        .map((character) => DataRow(cells: [
              DataCell(Text(character.id.toString())),
              DataCell(Text(character.name)),
              DataCell(Text(character.description)),
              DataCell(Text(character.resourceUri)),
              DataCell(Text(character.thumbnail.toString())),
              DataCell(
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 80),
                    textStyle: const TextStyle(fontSize: 15),
                    primary: const Color.fromARGB(255, 160, 9, 9),
                    shape: const CircleBorder(),
                    onPrimary: Colors.white,
                  ),
                  child: const Text('Details'),
                  onPressed: () {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
                  },
                ),
              )
            ]))
        .toList();
  }
}
