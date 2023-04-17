import 'package:flutter/material.dart';
import 'package:searchack/pages/main/main_page.dart';
import 'package:searchack/services/validator_service.dart';
import 'package:searchack/store/auth_store.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.authStore,
  });
  final AuthStore authStore;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final IValidatorService _validatorService = ValidatorServiceImpl();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  const Color(0xff016EED).withOpacity(0.4),
                  const Color(0xffFFFFFF).withOpacity(0.0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/logo.png',
                  scale: 3,
                ),
                const SizedBox(height: 10),
                const Text(
                  'SearcHack',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff016EED),
                  ),
                ),
                const SizedBox(height: 68),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Color(
                        0xffFFFFFF,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 16, right: 16),
                      child: Form(
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Логин',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff016EED),
                              ),
                            ),
                            const SizedBox(height: 4),
                            _CustomTextFormFieldsWidget(
                              textEditingController: _loginTextController,
                              validator: _validatorService.validateEmail,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Пароль',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff016EED),
                              ),
                            ),
                            const SizedBox(height: 4),
                            _CustomTextFormFieldsWidget(
                              textEditingController: _passwordTextController,
                              validator: _validatorService.validatePassword,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  if (!_key.currentState!.validate()) {
                                    return;
                                  }
                                  await widget.authStore.signUp(
                                    _loginTextController.text.trim(),
                                    _passwordTextController.text.trim(),
                                  )
                                      ? Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()))
                                      : null;
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 131,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        Color(0xff016EED),
                                        Color(0xff2996FF),
                                      ],
                                    ),
                                  ),
                                  child: const Text(
                                    'Регистрация',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTextFormFieldsWidget extends StatelessWidget {
  const _CustomTextFormFieldsWidget({
    required this.textEditingController,
    required this.validator,
  });

  final TextEditingController textEditingController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      validator: validator,
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
    );
  }
}
