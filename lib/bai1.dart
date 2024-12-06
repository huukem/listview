import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'bai1',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}

class CounterStorage {
  Future<int> readCounter() async {
    // Read the counter from local storage
    final counter = html.window.localStorage['counter'];
    return counter != null ? int.parse(counter) : 0;
  }

  Future<void> writeCounter(int counter) async {
    // Write the counter to local storage
    html.window.localStorage['counter'] = counter.toString();
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to local storage.
    await widget.storage.writeCounter(_counter);

    // Create a text file with the counter value
    final blob = html.Blob(['Counter value: $_counter'], 'text/plain');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create an anchor element and trigger a download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'counter.txt')
      ..click();

    // Clean up the URL object
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}