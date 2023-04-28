// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle_view_demo/features/detail/presentation/detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRoute,
      title: 'recycle view demo',
    );
  }
}

final GoRouter _goRoute = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: 'home',
      builder: ((context, state) => const MainScreen()),
      routes: <RouteBase>[
        GoRoute(
            path: 'details:title',
            name: 'details',
            builder: ((context, state) => const DetailScreen()))
      ])
]);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('alubum')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _CategoryTitle(
              title: 'Photos',
              isShowTitle: true,
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 4),
                  itemExtent: 220.0,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const _CoverElement(
                        image: 'images/lake.jpg',
                        alubumName: 'Oeschinen Lake Campground',
                        imageCount: 20,
                        category: 'photos');
                  }),
            ),
            _SliderWidget(),
            const _CategoryTitle(title: 'Folders', isShowTitle: false),
            SizedBox(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const _ElevationBoldCard(
                          image: 'images/lake.jpg',
                          title: 'Whats App',
                          count: 20);
                    })),
            const _CategoryTitle(title: 'Video', isShowTitle: true),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 4),
                  itemExtent: 200.0,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const _CoverElement(
                        image: 'images/lake.jpg',
                        alubumName: 'Oeschinen Lake Campground',
                        imageCount: 20,
                        category: 'photos');
                  }),
            ),
          ],
        ));
  }
}

class _SliderWidget extends StatefulWidget {
  @override
  State<_SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<_SliderWidget> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSliderValue,
        max: 100,
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value.round().toDouble();
          });
        });
  }
}

class _CategoryTitle extends StatelessWidget {
  final String title;
  final bool isShowTitle;

  const _CategoryTitle(
      {super.key, required this.title, required this.isShowTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              child: isShowTitle ? const Icon(Icons.add) : null,
            )
          ],
        ),
      ],
    );
  }
}

class _CoverElement extends StatelessWidget {
  final String image;
  final String alubumName;
  final int imageCount;
  final String category;

  const _CoverElement(
      {super.key,
      required this.image,
      required this.alubumName,
      required this.imageCount,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed('details', params: {
                "title": "strawberry cake"
              }, queryParams: {
                "star": "3",
                "subTitle": "strawberry cake",
                "desc": "descdescdescdescdescdescdescdesc",
              });
            },
            child: SizedBox(
              width: 220,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          descWidget()
        ],
      ),
    );
  }

  Widget descWidget() {
    return Row(
      children: [
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(alubumName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('$imageCount $category',
                style: const TextStyle(color: Colors.grey))
          ],
        )),
        const Icon(Icons.more_vert)
      ],
    );
  }
}

class _ElevationBoldCard extends StatelessWidget {
  final String image;
  final String title;
  final int count;
  const _ElevationBoldCard({
    Key? key,
    required this.image,
    required this.title,
    required this.count,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        width: 250,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12.0), bottom: Radius.circular(12.0)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('$count items',
                      style: const TextStyle(fontSize: 10, color: Colors.grey))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
