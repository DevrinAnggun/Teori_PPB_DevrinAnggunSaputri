import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible and Expanded'),
      ),
      body: Column(
        children: [
          // Section 1: Flexible & Expanded
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Flexible
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    ),
                    Flexible(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                        child: const Text(
                          "Flexible takes up the remaining space but can shrink if needed.",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
                const SizedBox(height: 20),
                // Expanded
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                        child: const Text(
                          "Expanded forces the widget to take up all the remaining space.",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Section 2: CustomScrollView wrapped in Expanded to make it scrollable
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                // Sliver App Bar
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Selamat Datang Di Dunia Coding'),
                  ),
                ),

                // Sliver Grid
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: Text('Grid Item $index'),
                      );
                    },
                    childCount: 10, // Limit Grid to 10 items
                  ),
                ),

                // Sliver Fixed List
                SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: Text('List Item $index'),
                      );
                    },
                    childCount: 10, // Limit List to 10 items
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
