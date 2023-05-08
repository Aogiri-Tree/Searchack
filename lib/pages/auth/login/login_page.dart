import 'package:flutter/material.dart';
import 'package:searchack/pages/admin/admin_page.dart';
import 'package:searchack/pages/auth/register/register_page.dart';
import 'package:searchack/pages/main/main_page.dart';
import 'package:searchack/services/validator_service.dart';
import 'package:searchack/store/auth_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.authStore,
  });
  final AuthStore authStore;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final IValidatorService _validatorService = ValidatorServiceImpl();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
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
                        _CustomTextFormField(
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
                        _CustomTextFormField(
                          textEditingController: _passwordTextController,
                          validator: _validatorService.validatePassword,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Забыли пароль?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff016EED),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (!_key.currentState!.validate()) {
                                return;
                              }

                              var res = await widget.authStore.signIn(
                                _loginTextController.text.trim(),
                                _passwordTextController.text.trim(),
                              );
                              res &&
                                      _loginTextController.text ==
                                          "admin@mail.ru" &&
                                      _passwordTextController.text == "adminX"
                                  // ignore: use_build_context_synchronously
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AdminPage()))
                                  // ignore: use_build_context_synchronously
                                  : Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 115,
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
                                'Войти в профиль',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ещё нет аккаунта?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage(
                                              authStore: widget.authStore,
                                            )));
                              },
                              child: const Text(
                                'Регистрация',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xff016EED),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({
    required this.textEditingController,
    required this.validator,
  });

  final TextEditingController textEditingController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: textEditingController,
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
