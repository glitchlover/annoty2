import 'package:flutter/material.dart';

enum Tool {
  exit,
  prePage,
  searchPage,
  nextPage,
  zIn,
  zCust,
  zOut,
  searchText,
  bookmark,
  annoBar
}

Map<Tool, String> toolName = {
  Tool.exit: "Exit",
  Tool.prePage: "Previous Page",
  Tool.searchPage: "Search Page",
  Tool.nextPage: "Next Page",
  Tool.zIn: "Zoom In",
  Tool.zCust: "Custom Zoom",
  Tool.zOut: "Zoom Out",
  Tool.searchText: "Search Text",
  Tool.bookmark: "Bookmark",
  Tool.annoBar: "Annotation Bar",
  };

Map<Tool, IconData> toolIcon = {
  Tool.exit: Icons.abc,
  Tool.prePage: Icons.abc,
  Tool.searchPage: Icons.abc,
  Tool.nextPage: Icons.abc,
  Tool.zIn: Icons.abc,
  Tool.zCust: Icons.abc,
  Tool.zOut: Icons.abc,
  Tool.searchText: Icons.abc,
  Tool.bookmark: Icons.abc,
  Tool.annoBar: Icons.abc,
  };
