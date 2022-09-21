import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainScroll(),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final List<Widget> items = [
    const _ListItem(color: Color.fromARGB(255, 63, 157, 29), title: 'Facebook'),
    const _ListItem(color: Color.fromARGB(255, 93, 30, 144), title: 'Twetter'),
    const _ListItem(color: Color.fromARGB(255, 54, 95, 244), title: 'Tiktok'),
    const _ListItem(color: Color.fromARGB(255, 157, 31, 25), title: 'My Blog'),
    const _ListItem(
        color: Color.fromARGB(255, 27, 55, 168), title: 'Developer'),
    const _ListItem(
        color: Color.fromARGB(255, 26, 50, 143), title: 'Team Flutter'),
    const _ListItem(color: Color.fromARGB(255, 78, 48, 177), title: 'React'),
    const _ListItem(color: Colors.red, title: 'Angular'),
    const _ListItem(color: Color.fromARGB(255, 171, 122, 16), title: 'Vue'),
  ];
  // _MainScroll({super. });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 180,
                maxHeight: 250,
                child: Container(
                  color: Colors.white,
                  child: _Title(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Text(
            'New',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              // color: Color.fromARGB(255, 49, 26, 112),
              child: const Text(
                'List',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
            ),
            Positioned(
              bottom: 2,
              left: 5,
              right: 5,
              child: Container(
                color: Color.fromARGB(255, 15, 45, 193),
                height: 5,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListTareas extends StatelessWidget {
  final List items = [
    const _ListItem(color: Color.fromARGB(255, 63, 157, 29), title: 'Facebook'),
    const _ListItem(color: Color.fromARGB(255, 93, 30, 144), title: 'Twetter'),
    const _ListItem(color: Color.fromARGB(255, 54, 95, 244), title: 'Tiktok'),
    const _ListItem(color: Color.fromARGB(255, 157, 31, 25), title: 'My Blog'),
    const _ListItem(
        color: Color.fromARGB(255, 27, 55, 168), title: 'Developer'),
    const _ListItem(
        color: Color.fromARGB(255, 26, 50, 143), title: 'Team Flutter'),
    const _ListItem(color: Color.fromARGB(255, 78, 48, 177), title: 'React'),
    const _ListItem(color: Colors.red, title: 'Angular'),
    const _ListItem(color: Color.fromARGB(255, 171, 122, 16), title: 'Vue'),
  ];
  _ListTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String title;
  const _ListItem({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 120,
      width: 300,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
