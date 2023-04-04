import 'package:flutter/material.dart';
import 'package:searchack/pages/main/catalog/widgets/hackaton_card_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/search_field_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/specialization_choise_widet.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Каталог",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchFieldWidget(),
            const SizedBox(
              height: 4,
            ),
            const SpecializationChoiseWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const HackatonCardWidget(
                    title: 'Masters of Arts: ML Challenge',
                    description:
                        'Искусство и искусственный интеллект: распознай вид произведения по фотографии — новое соревнование Masters of Arts: ML Challenge от Codenrock.',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
