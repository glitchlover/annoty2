import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/core/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToolItem {
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

Map<ToolItem, String> toolName = {
  ToolItem.exit: "Exit",
  ToolItem.prePage: "Previous Page",
  ToolItem.searchPage: "Search Page",
  ToolItem.nextPage: "Next Page",
  ToolItem.zIn: "Zoom In",
  ToolItem.zCust: "Custom Zoom",
  ToolItem.zOut: "Zoom Out",
  ToolItem.searchText: "Search Text",
  ToolItem.bookmark: "Bookmark",
  ToolItem.annoBar: "Annotation Bar",
};

Map<ToolItem, IconData> toolIcon = {
  ToolItem.exit: Icons.cancel,
  ToolItem.prePage: Icons.keyboard_arrow_left_rounded,
  ToolItem.nextPage: Icons.keyboard_arrow_right_rounded,
  ToolItem.zIn: Icons.zoom_in,
  ToolItem.zOut: Icons.zoom_out,
  ToolItem.bookmark: Icons.bookmark_rounded,
  ToolItem.annoBar: Icons.menu_rounded,
};