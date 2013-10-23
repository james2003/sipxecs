library user;

import 'package:angular/angular.dart';
import 'dart:convert';
import '../sipxconfig.dart';
import '../lib/chat_room.dart';

@NgComponent(
    selector: 'user-picker',
    templateUrl: 'component/user_picker.html',
    cssUrl: 'component/user_picker.css',
    publishAs: 'uPicker',
    map: const {
      'message' : '@message',
      'selected' : '<=>picked'
    }
)
class UserPickerComponent {
  String message;
  // this is a list of all available users
  List<User> users = [];
  // this is the selection list for the above
  List<User> selectedUsers = [];
  // this is the list of users that have been picked (i.e. selected and moved to the left)
  List<User> picked = [];
  // this is the selection list for the above
  List<User> selectedPicked = [];
  Api api = new Api(test : true);
  // filterName can't be null
  String filterName = "";
  bool _expanded = false;

  UserPickerComponent() {
    DataLoader loader = new DataLoader(null, _loadData);
    loader.load(api.url("rest/users/", 'users_test.json'));
  }

  void _loadData(data) {
    List<Map> tmpUsers = JSON.decode(data);
    for(Map tmpUser in tmpUsers) {
      users.add(new User(tmpUser));
    }
  }

  bool isAvailable(User u) {
    bool result = true;
    if(u != null && picked != null && !picked.isEmpty) {
       result = !picked.contains(u);
    }
    return result;
  }

  void addAll() {
    for(User u in users) {
      if(!picked.contains(u)) {
        picked.add(u);
      }
    }
  }

  void addSelected() {
    picked.addAll(selectedUsers);
    selectedUsers.clear();
  }

  void removeSelected() {
    picked.removeWhere((User u) => selectedPicked.contains(u));
    selectedPicked.clear();
  }

  void removeAll() {
    picked.removeWhere((_) => true);
    selectedPicked.clear();
  }

  get isExpanded => _expanded;
  get expanded => _expanded;
  set expanded(val) => _expanded = val;
}
