import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Added `Key? key` argument in the constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Corrected the string to use double quotes and fixed the title
      title: "Recuperar el valor d'un camp de text",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar el valor d'un camp de text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Simple Dialog Title'),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Simple dialog option 1'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Simple dialog option 2'),
                            ),
                          ],
                        );
                      });
                },
                child: Text('Simple Dialog')),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: Text('AlertDialog Body'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('AlertDialog Button'))
                        ],
                      );
                    },
                  );
                },
                child: Text('AlertDialog')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('SnackBar text'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('SnackBar')),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('ModalBottomSheet'),
                              ElevatedButton(
                                child: const Text('Botom Seet option 1'),
                                onPressed: () => Navigator.of(context).pop(),
                              )
                            ],
                          ),
                        ));
                  },
                );
              },
              child: Text('BottomSheet'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Mostra el Valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
