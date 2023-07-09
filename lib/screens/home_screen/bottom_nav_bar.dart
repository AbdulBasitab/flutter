import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:movies_app/screens/home_screen/home_screen.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';
import 'package:movies_app/screens/search_screen/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isVisible = true;
  ScrollController hideNavigationBarController = ScrollController();

  @override
  void initState() {
    super.initState();
    hideNavigationBarController.addListener(() {
      if (hideNavigationBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (hideNavigationBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(scrollController: hideNavigationBarController),
      const SearchScreen(),
      const WatchlistScreen(),
    ];
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) => SafeArea(
        child: Scaffold(
          body: WillPopScope(
              onWillPop: () async {
                if (state.selectedIndex == 0) {
                  return true;
                } else {
                  context
                      .read<NavigationBloc>()
                      .add(ChangeSelectedIndex(index: 0));
                  return false;
                }
              },
              child: screens[state.selectedIndex]),
          bottomNavigationBar: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            height: _isVisible ? 60 : 0,
            child: _isVisible
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    height: _isVisible ? 60 : 0,
                    child: _isVisible
                        ? BottomAppBar(
                            height: 60,
                            child: BottomNavigationBar(
                              items: const [
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.home_filled),
                                  label: "Home",
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.search_rounded),
                                  label: "Search",
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.bookmark_border_rounded),
                                  label: "Watchlist",
                                ),
                              ],
                              currentIndex: state.selectedIndex,
                              onTap: (value) {
                                context
                                    .read<NavigationBloc>()
                                    .add(ChangeSelectedIndex(index: value));
                              },
                              backgroundColor: Colors.blue.shade900,
                              selectedItemColor: Colors.amber.shade600,
                              unselectedItemColor: Colors.white54,
                              unselectedLabelStyle: GoogleFonts.raleway(
                                color: Colors.white54,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              selectedLabelStyle: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.amber.shade600),
                            ),
                          )
                        : Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                          ),
                  )
                : Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                  ),
          ),
        ),
      ),
    );
  }
}