class AppConst {
  //utsav newskey
  static const String newsApi = "cee9e023654a48d386d2c887a2b163ae";

  static const List<String> paranormalCategories = [
    "UFO",
    "Aliens",
    "Humanoids",
    "Ghosts",
    "Conspiracy",
    "Cryptids"
  ];

  List<String> extractParanormalTags(String text) {
    final keywords = {
      "ufo": "UFO",
      "alien": "Alien",
      "humanoid": "Humanoid",
      "ghost": "Ghost",
      "haunted": "Haunted",
      "area 51": "Area 51",
      "roswell": "Roswell",
      "bigfoot": "Bigfoot",
      "skinwalker": "Skinwalker",
      "reptilian": "Reptilian",
      "time travel": "Time Travel",
      "ancient": "Ancient Mystery",
    };

    final lowerText = text.toLowerCase();
    final tags = <String>[];

    keywords.forEach((key, value) {
      if (lowerText.contains(key)) {
        tags.add(value);
      }
    });

    return tags;
  }

}