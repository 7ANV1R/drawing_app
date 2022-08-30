import 'package:drawing_app/blank/view/blank_page.dart';
import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:drawing_app/home/cubit/home_cubit.dart';
import 'package:drawing_app/home/view/widgets/note_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
          children: [
            // this is constant part like start with blank note or with image
            Column(
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BlankPage(),
                            ),
                          );
                        },
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
              ],
            ),

            // this is for recent project
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kVerticalSpaceXXXL,
                  Text(
                    'Recent Projects',
                    style: textTheme.bodyText1,
                  ),
                  kVerticalSpaceL,
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeInitial) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is HomeLoaded) {
                        return state.noteList.isEmpty
                            ? const Center(child: Text('No recent project found'))
                            : Expanded(
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.noteList.length,
                                  itemBuilder: (context, index) {
                                    return NoteListCard(
                                      title: state.noteList[index].title ?? "untitled",
                                      content: state.noteList[index].content ?? "empty note",
                                    );
                                  },
                                ),
                              );
                      } else {
                        return const Center(
                          child: Text('Something went wrong!'),
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
