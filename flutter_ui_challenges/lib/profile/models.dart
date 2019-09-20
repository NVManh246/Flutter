class Profile {
  String firstName;
  String lastName;
  String location;
  int numberOfFollowers;
  int numberFollowing;
  int totalLikes;

  String get fullName => "$firstName $lastName";

  String get numberOfFollowersString => _abbreviatedCount(numberOfFollowers);

  String get numberFollowingString => _abbreviatedCount(numberFollowing);

  String get totalLikesString => _abbreviatedCount(totalLikes);

  String _abbreviatedCount(int num) {
    if(num < 1000) return "$num";
    if(num >= 1000 && num < 1000000) {
      String s = (num /1000).toStringAsFixed(1);
      if(s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}K";
    } else if(num >= 1000000 && num < 1000000000) {
      String s = (num / 1000000).toStringAsFixed(1);
      if(s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}M";
    }
    return "";
  }
}

Profile getProfile() {
  return Profile()
    ..firstName = "DUNG"
    ..lastName = "CT"
    ..location = "Ha Noi"
    ..numberOfFollowers = 1200000
    ..numberFollowing = 1000
    ..totalLikes = 24000000;
}