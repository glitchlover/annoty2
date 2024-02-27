import 'dart:ui';

import 'package:annoty/core/constants/color/highlights.dart';

enum Highlight { red, orange, yellow, green, blue, purple, pink, unknown }

Map<Color, Highlight> mapColorToHighlight = {
  ConstColorHighlight.red: Highlight.red,
  ConstColorHighlight.orange: Highlight.orange,
  ConstColorHighlight.yellow: Highlight.yellow,
  ConstColorHighlight.green: Highlight.green,
  ConstColorHighlight.blue: Highlight.blue,
  ConstColorHighlight.purple: Highlight.purple,
  ConstColorHighlight.pink: Highlight.pink,
};

Map<Highlight, Color> mapHighlightToColor = {
  Highlight.red: ConstColorHighlight.red,
  Highlight.orange: ConstColorHighlight.orange,
  Highlight.yellow: ConstColorHighlight.yellow,
  Highlight.green: ConstColorHighlight.green,
  Highlight.blue: ConstColorHighlight.blue,
  Highlight.purple: ConstColorHighlight.purple,
  Highlight.pink: ConstColorHighlight.pink,
  Highlight.unknown: ConstColorHighlight.yellow,
};

Map<String, Highlight> mapNameToHighlight = {
  'red': Highlight.red,
  'orange': Highlight.orange,
  'yellow': Highlight.yellow,
  'green': Highlight.green,
  'blue': Highlight.blue,
  'purple': Highlight.purple,
  'pink': Highlight.pink,
  'unknown': Highlight.unknown
};

Map<Highlight, String> mapHighlightToName = {
  Highlight.red: 'red',
  Highlight.orange: 'orange',
  Highlight.yellow: 'yellow',
  Highlight.green: 'green',
  Highlight.blue: 'blue',
  Highlight.purple: 'purple',
  Highlight.pink: 'pink',
  Highlight.unknown: 'unknown',
};
