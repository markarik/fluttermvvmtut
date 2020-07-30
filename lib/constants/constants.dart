class Constants {
  static const API_KEY = 'c549e50029cc408eb402a5c5da91dc81';
  static const String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';



 static  String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }


  static const Map<String, String> Countries = {
    "United States of America": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch",
    "Kenya":"Ke"
  };
}
