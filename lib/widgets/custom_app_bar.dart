import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import '../providers/global_state_provider.dart';

import './responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollOffset = Provider.of<GlobalData>(context).scrollOffset;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0
      ),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: const SafeArea(
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        )
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/netflix_logo1.png"),
        const SizedBox(width: 12.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(
                clickHandler: () {
                  print("Home");
                },
                title: "Home",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("TV Shows");
                },
                title: "TV Shows",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("Movies");
                },
                title: "Movies",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("Latest");
                },
                title: "Latest",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("My List");
                },
                title: "My List",
              ),

            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 28.0,
                color: Colors.white,
                padding: EdgeInsets.zero
              ),
              _AppBarButton(
                clickHandler: () {
                  print("KIDS");
                },
                title: "KIDS",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("DVD");
                },
                title: "DVD",
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  padding: EdgeInsets.zero
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  padding: EdgeInsets.zero
              ),

            ],
          ),
        )
      ],
    );
  }
}



class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/netflix_logo0.png"),
        const SizedBox(width: 12.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(
                clickHandler: () {
                  print("TV Shows");
                },
                title: "TV Shows",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("Movies");
                },
                title: "Movies",
              ),
              _AppBarButton(
                clickHandler: () {
                  print("My List");
                },
                title: "My List",
              )
            ],
          ),
        )
      ],
    );
  }
}



class _AppBarButton extends StatelessWidget {
  final VoidCallback clickHandler;
  final String title;

  const _AppBarButton({required this.clickHandler, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: clickHandler,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )
    );
  }
}
