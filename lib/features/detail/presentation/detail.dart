// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: Text('detail page')),
      body: Column(
        children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _TitleSection(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IconSection(
                icon: Icons.phone,
                color: color,
                title: "CALL",
              ),
              _IconSection(
                icon: Icons.near_me,
                color: color,
                title: "ROUTE",
              ),
              _IconSection(
                icon: Icons.share,
                color: color,
                title: "SHARE",
              )
            ],
          ),
          _ArticleSection()
        ],
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          //title+place;
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text('Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          // //icon
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // //text
          // const Text('31')
          FavorityWidget(
            favorityCounter: 31,
            isFavority: false,
          )
        ],
      ),
    );
  }
}

class FavorityWidget extends StatefulWidget {
  bool isFavority;
  int favorityCounter;
  FavorityWidget({
    Key? key,
    required this.isFavority,
    required this.favorityCounter,
  }) : super(key: key);
  @override
  State<FavorityWidget> createState() => _FavorityWidgetState();
}

class _FavorityWidgetState extends State<FavorityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _onPressed,
          icon: widget.isFavority
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
          color: Colors.red[500],
        ),
        //text
        SizedBox(
          width: 18,
          child: Text(widget.favorityCounter.toString()),
        )
      ],
    );
  }

  void _onPressed() {
    setState(() {
      widget.favorityCounter = (widget.isFavority)
          ? widget.favorityCounter - 1
          : widget.favorityCounter + 1;
      widget.isFavority = !widget.isFavority;
    });
  }
}

class _IconSection extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  const _IconSection(
      {required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            title,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

class _ArticleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));
  }
}
