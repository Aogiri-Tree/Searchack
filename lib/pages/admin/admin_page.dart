import 'package:flutter/material.dart';
import 'package:searchack/main.dart';
import 'package:searchack/models/all_model.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();

  bool isChecked = false;

  void addHack() {
    hacks.all!.add(
      All(
        hackName: _controller1.text,
        town: _controller2.text,
        dateOfLive: _controller3.text,
        isOpen: _controller4.text,
        isOnline: _controller5.text,
        address: _controller6.text,
        imageUrl: _controller7.text,
        regUrl: _controller8.text,
        description: _controller9.text,
        inPriority: isChecked,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0.0,
        titleSpacing: 16.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Добавление хакатона",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              children: [
                _CustomTextFormField(
                  textEditingController: _controller1,
                  hintText: 'Название',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller2,
                  hintText: 'Город',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller3,
                  hintText: 'Дата проведения',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller4,
                  hintText: 'Статус регистрации',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller5,
                  hintText: 'Формат проведения',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller6,
                  hintText: 'Адрес',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                    textEditingController: _controller7,
                    hintText: 'Ссылка на картинку'),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller8,
                  hintText: 'Ссылка на регистрацию',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomTextFormField(
                  textEditingController: _controller9,
                  hintText: 'Описание',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Продвигать?',
                      style: TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xff016EED)),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addHack();
                      });
                    },
                    child: const Text(
                      "Добавить",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({
    required this.textEditingController,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
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
    );
  }
}
