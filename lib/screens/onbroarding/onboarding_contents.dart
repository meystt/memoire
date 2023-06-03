class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
     this.title,
     this.image,
     this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Find the best doctors",
    image: "assets/pngwing.com.png",
    desc: "With the help of our app now find the best doctor around you.",
  ),
  OnboardingContents(
    title: "Schedule appointments with expert doctor",
    image: "assets/414-bg.png",
    desc:
        "Find experienced doctor with expert rating and reviews",
  ),
  OnboardingContents(
    title: "Book face to face appointment",
    image: "assets/19834-bg.png",
    desc:
        "Can't go to hospital book video call appointment with doctor within the app in few seconds",
  ),
];
