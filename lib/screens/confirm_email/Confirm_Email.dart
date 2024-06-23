import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EmailConfirmationScreen extends StatefulWidget {
  static const String routeName = "emailConfirmationScreen";
  @override
  _EmailConfirmationScreenState createState() => _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  bool _isCodeSent = false;
  bool _isLoading = false;
  final Dio _dio = Dio();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _sendConfirmationCode() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.post(
        'https://egyptttourmate-001-site1.gtempurl.com/api/Adminstration/ConfirmEmail',
        data: {'email': _emailController.text},
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        setState(() {
          _isCodeSent = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send code')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _confirmEmail() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.post(
        'https://egyptttourmate-001-site1.gtempurl.com/api/Adminstration/ConfirmEmail',
        data: {
          'email': _emailController.text,
          'code': _codeController.text,
        },
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email confirmed successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to confirm email')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              Column(
                children: [
                  if (!_isCodeSent)
                    Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _sendConfirmationCode,
                          child: Text('Send Confirmation Code'),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        TextField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Confirmation Code',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _confirmEmail,
                          child: Text('Confirm Email'),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
