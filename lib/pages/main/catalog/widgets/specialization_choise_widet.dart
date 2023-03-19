import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecializationChoiseWidget extends StatefulWidget {
  const SpecializationChoiseWidget({super.key});

  @override
  State<SpecializationChoiseWidget> createState() =>
      _SpecializationChoiseWidgetState();
}

class _SpecializationChoiseWidgetState
    extends State<SpecializationChoiseWidget> {
  static const String all = "Все";
  List<String> selectedChoices = [];
  final specializationList = <String>[
    "Программирование",
    "Дизайн",
    "Картошка",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          (specializationList.isNotEmpty && specializationList.length != 1)
              ? _SpecializationItemWidget(
                  label: all,
                  isSelected: selectedChoices.contains(all),
                  onSelected: (_) {
                    setState(() {
                      if (selectedChoices.contains(all)) {
                        selectedChoices.clear();
                      } else {
                        selectedChoices.clear();
                        selectedChoices.add(all);
                      }
                    });
                  },
                )
              : const SizedBox.shrink(),
          for (int i = 0; i < specializationList.length; i++)
            _SpecializationItemWidget(
              label: specializationList[i],
              isSelected: selectedChoices.contains(specializationList[i]),
              onSelected: (_) {
                setState(() {
                  if (selectedChoices.contains(specializationList[i])) {
                    selectedChoices.remove(specializationList[i]);
                  } else {
                    if (selectedChoices.contains(all)) {
                      selectedChoices.clear();
                    }

                    selectedChoices.add(specializationList[i]);
                  }
                });
              },
            ),
        ],
      ),
    );
  }
}

class _SpecializationItemWidget extends StatefulWidget {
  const _SpecializationItemWidget({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });
  final String label;
  final bool isSelected;
  final void Function(bool) onSelected;

  @override
  State<_SpecializationItemWidget> createState() =>
      _SpecializationItemWidgetState();
}

class _SpecializationItemWidgetState extends State<_SpecializationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(widget.label),
        labelStyle: TextStyle(
          color: widget.isSelected
              ? Colors.white
              : const Color.fromRGBO(106, 106, 106, 1),
        ),
        selectedColor: Colors.blue,
        backgroundColor: Colors.white,
        selected: widget.isSelected,
        onSelected: widget.onSelected,
      ),
    );
  }
}
