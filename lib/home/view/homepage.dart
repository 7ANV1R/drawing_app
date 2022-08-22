import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onnorokom Drawing'),
        leading: Image.asset(
          'assets/logo_400x400.png',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.face,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            kVerticalSpaceM,
            Text(
              'Start Fresh',
              style: textTheme.bodyText1,
            ),
            kVerticalSpaceM,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                        (Set<MaterialState> states) {
                          return const EdgeInsets.all(12);
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.note_alt_rounded),
                    label: const Text('Blank Note'),
                  ),
                ),
                kHorizontalSpaceM,
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                        (Set<MaterialState> states) {
                          return const EdgeInsets.all(12);
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.photo),
                    label: const Text('With Image'),
                  ),
                ),
              ],
            ),
            kVerticalSpaceXXXL,
            Text(
              'Recent Projects',
              style: textTheme.bodyText1,
            ),
            kVerticalSpaceL,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
