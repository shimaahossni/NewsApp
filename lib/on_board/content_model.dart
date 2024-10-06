class unboardContent {
  String image;
  String title;
  String description;
  unboardContent({required this.image, required this.title,required this.description});
}

List<unboardContent>contents=[
  unboardContent(image: "assets/images/onboard/one.png", title: "Global News",description: "GlobeNewswire helps you share news with media, investors, and consumers using targeted distribution options. Build awareness & boost online visibility."),
  unboardContent(image: "assets/images/onboard/two.png", title: "Are You Informed",description: "news enables users to browse top headlines throughout the day, access the latest news in specific content categories."),
  unboardContent(image: "assets/images/onboard/three.png", title: "Catch Up",description: "you can read latest news, training and events, as well as useful articles about helping struggling learners with literacy"),
];