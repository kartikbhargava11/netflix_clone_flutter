import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import '../widgets/custom_app_bar.dart';
import '../widgets/content_header.dart';
import '../widgets/previews.dart';
import '../widgets/content_list.dart';

import '../data/data.dart';

import '../providers/global_state_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
       Provider.of<GlobalData>(context, listen: false).updateScrollOffset(
         _scrollController.offset
       );
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("CAST");
        },
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: const CustomAppBar(),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: sintelContent,
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey('previews'),
                title: "Previews",
                contentList: previews,
              ),
            )
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('my_list'),
              title: "My List",
              contentList: myList
            )
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('originals'),
              title: "Netflix Originals",
              contentList: originals,
              isOriginals: true,
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey('trending'),
                title: "Trending",
                contentList: trending,
              )
            ),
          )
        ],
      )
    );
  }
}
