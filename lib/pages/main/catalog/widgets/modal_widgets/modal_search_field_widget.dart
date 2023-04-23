import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModalSearchFieldWidget extends StatelessWidget {
  const ModalSearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(245, 245, 245, 1),
                contentPadding: const EdgeInsets.symmetric(vertical: 9),
                prefixIcon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(106, 106, 106, 1),
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.none,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: 'Поиск',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(106, 106, 106, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
