import 'package:harpy/api/twitter/data/user.dart';
import 'package:harpy/api/twitter/services/twitter_service.dart';
import 'package:harpy/api/twitter/twitter_client.dart';
import 'package:harpy/core/cache/user_cache.dart';
import 'package:harpy/core/json/json_mapper.dart';

class UserService extends TwitterService with JsonMapper<User> {
  /// Returns the [User] corresponding to the [id] or [screenName].
  Future<User> getUserDetails({
    String id,
    String screenName,
  }) async {
    var params = {"include_entities": "true"};
    if (id != null) params["user_id"] = id;
    if (screenName != null) params["screen_name"] = screenName;

    var response = await TwitterClient().get(
      "https://api.twitter.com/1.1/users/show.json",
      params: params,
    );

    if (response.statusCode == 200) {
      User user = map((json) => User.fromJson(json), response.body);

      UserCache().cacheUser(user);

      return user;
    } else {
      return Future.error(response.statusCode);
    }
  }
}