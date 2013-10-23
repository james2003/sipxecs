library edit_room;

import 'package:angular/angular.dart';
import '../lib/chat_room.dart';

@NgComponent(
    selector: 'room-editor',
    templateUrl: 'component/edit_room.html',
    cssUrl: 'component/edit_room.css',
    publishAs: 'rEdit',
    map: const {
      'room-map' : '<=>roomMap',
    }
)
class EditRoomComponent {
  int _roomId;
  Map<int, ChatRoom> _roomMap;
  ChatRoom _currentRoom;

  EditRoomComponent(RouteProvider routeProvider) {
    String idStr = routeProvider.parameters['id'];
    if(idStr != null) {
      _roomId = int.parse(idStr);
    }
  }

  set roomMap(Map<int, ChatRoom> map) {
    _roomMap = map;
    ChatRoom currentRoom = _roomMap[_roomId];
    if(currentRoom != null) {
      _currentRoom = currentRoom;
    } else {
      _currentRoom = new ChatRoom();
    }
  }

  get roomMap => _roomMap;

  get currentRoom {
    return _currentRoom;
  }
}
