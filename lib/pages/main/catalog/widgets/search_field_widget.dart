import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/main.dart';
import 'package:searchack/models/all_model.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (value.isEmpty) {
                  filteredHacks.value = List.from(hacks.all!);
                }
                List<All> helperList = [];
                for (var hack in filteredHacks.value) {
                  if (hack.hackName!.contains(value)) {
                    helperList.add(hack);
                  }
                }

                filteredHacks.value = List.from(helperList);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
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
        const SizedBox(
          width: 11,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(9),
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
