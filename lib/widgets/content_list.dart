import 'package:flutter/material.dart';

import '../models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  const ContentList({required this.title, required this.contentList, this.isOriginals = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(title, style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            height: isOriginals ? 500.0 : 220.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (ctx, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginals ? 400.0 : 200.0,
                    width: isOriginals ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover,
                      ),

                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
