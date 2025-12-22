class AppConst {

  static const String newsApi = "534ba7ab9e1742a38d5cb6fc1742dcf7";
  static const List<String> paranormalCategories = [
    "UFO",
    "Aliens",
    "Humanoids",
    "Ghosts",
    "Conspiracy",
    "Cryptids",
  ];


  static const Map<String, String> paranormalCategoryQuery = {
    "UFO": "Paranormal",
    "Aliens": "Paranormal",
    "Humanoids": "humanoid sightings OR strange humanoid",
    "Ghosts": "ghost OR haunting OR paranormal activity",
    "Conspiracy": "paranormal conspiracy OR secret experiment",
    "Cryptids": "cryptid OR bigfoot OR skinwalker OR loch ness",
  };


  static List<String> extractParanormalTags(String text) {
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