enum AnnoColor { red, orange, yellow, green, blue, purple, pink, unknown }

/// Todo: map with `Color`

Map<String, AnnoColor> mapToAnnoColor = {
  'red': AnnoColor.red,
  'orange': AnnoColor.orange,
  'yellow': AnnoColor.yellow,
  'green': AnnoColor.green,
  'blue': AnnoColor.blue,
  'purple': AnnoColor.purple,
  'pink': AnnoColor.pink,
  'unknown': AnnoColor.unknown
};

Map<AnnoColor, String> mapToName = {
  AnnoColor.red: 'red',
  AnnoColor.orange: 'orange',
  AnnoColor.yellow: 'yellow',
  AnnoColor.green: 'green',
  AnnoColor.blue: 'blue',
  AnnoColor.purple: 'purple',
  AnnoColor.pink: 'pink',
  AnnoColor.unknown: 'unknown',
};
