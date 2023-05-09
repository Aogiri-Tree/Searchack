import 'package:flutter/material.dart';

class ProfileContacts extends StatelessWidget {
  const ProfileContacts(
      {super.key,
      required this.addressController,
      required this.emailController,
      required this.numberController});

  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController numberController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        bottomOpacity: 0.0,
        titleSpacing: 16.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Контактные данные',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 350,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: addressController,
                onFieldSubmitted: (value) {
                  addressController.text = value;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                onFieldSubmitted: (value) {
                  emailController.text = value;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: numberController,
                onFieldSubmitted: (value) {
                  numberController.text = value;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff016EED),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
