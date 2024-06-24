import 'package:flutter/material.dart';
import 'package:dghub_picker/dghub_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DGHubCurrencyPickerButton(result: (r) {}),
              const SizedBox(
                height: 20,
              ),
              DGHubIconPickerButton(
                result: (r) {},
                title: 'dsf',
              ),
              const SizedBox(
                height: 20,
              ),
              DGHubImagePickerSingle(resultPath: (r) {}, resultBytes: (f) {}),
              const SizedBox(
                height: 20,
              ),
              DGHubColorPickerButton(title: 'lll', result: (r) {})
            ],
          ),
        ),
      ),
    );
  }
}
