import 'package:firebase_without_json_file/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase without JSON file',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String _name, _email, _country;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase without JSON file'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                cursorColor: Colors.blue,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                onSaved: (input) => _name = input,
                validator: (String value) {
                  debugPrint(value);
                  if (value.isEmpty) {
                    return 'Name is required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.blue,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                onSaved: (input) => _email = input,
                validator: (String value) {
                  debugPrint(value);
                  if (value.isEmpty) {
                    return 'Email is required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.blue,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Country',
                  hintText: 'Enter your country',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                onSaved: (input) => _country = input,
                validator: (String value) {
                  debugPrint(value);
                  if (value.isEmpty) {
                    return 'Country is required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    Services.save_record(context, _name, _email, _country)
                        .then((value) {
                      if (value == true) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Record saved successfully!'),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Unable to save record!'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    });
                  }
                },
                child: Text(
                  'Save record',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                minWidth: double.infinity,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
