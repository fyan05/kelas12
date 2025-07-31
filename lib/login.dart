import 'package:flutter/material.dart';
import 'package:kelas12/home.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  Widget _gap() {
    return const SizedBox(height: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(32),
            constraints: BoxConstraints(
              maxWidth: 350,
            ),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _gap(),
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Seal_of_Tasikmalaya_Regency.svg/800px-Seal_of_Tasikmalaya_Regency.svg.png",
                        height: 80,
                      ),
                      _gap(),
                      Text(
                        'Iuran Warga Kampung Lebak Gede',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _gap(),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan username';
                          }
                          return null;
                        },
                      ),
                      _gap(),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan password';
                          }
                          return null;
                        },
                      ),
                      _gap(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.login),
                          label: Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Sedang Memproses')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => home(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      _gap(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lupa Password?',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
