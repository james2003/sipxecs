import 'dart:html';
import 'dart:convert';
import 'dart:async';
import 'sipxconfig.dart';
import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
import 'component/edit_room.dart';
import 'component/user_picker.dart';
import 'route/rooms_route.dart';
import 'lib/chat_room.dart';

Api api = new Api(test : true);
UserMessage msg = new UserMessage(querySelector("#userMessage"));

class RoomsAppModule extends Module {
  RoomsAppModule() {
    type(RoomsController);
    type(EditRoomComponent);
    type(UserPickerComponent);
    type(RouteInitializer, implementedBy: RoomsRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
    //type(Profiler, implementedBy: Profiler); // comment out to enable profiling
  }
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.level.toString() + "\t" + r.message); });
  ngBootstrap(module: new RoomsAppModule());
}


@NgController(
    selector: '[rooms]',
    publishAs: 'roomCtrl')
class RoomsController {
  List<ChatRoom> _rooms = [];
  Map<int, ChatRoom> _roomsMap;
  get rooms => _rooms;
  get roomsMap => _roomsMap;

  RoomsController() {
    DataLoader loader = new DataLoader(msg, _loadData);
    loader.load(api.url("rest/chatroom/", 'chatroommgmt_test.json'));
  }

  void _loadData(data) {
    List<Map> tmpRooms = JSON.decode(data);
    for(Map tmpRoom in tmpRooms) {
      _rooms.add(new ChatRoom.fromMap(tmpRoom));
    }
    _roomsMap = new Map.fromIterable(_rooms,
        key: (ChatRoom item) => item.id,
        value: (ChatRoom item) => item);
  }
}

/*class ManageRooms {
  UserMessage msg;
  DataLoader loader;

  ManageRooms() {
    msg = new UserMessage(querySelector("#userMessage"));
    loader = new DataLoader(msg, loadTable);

    loader.load(api.url("rest/chatroom/", 'chatroommgmt-test.json'));
  }

  void remove(int region, String name) {
    if (window.confirm("Are you sure you want to remove ${name}?")) {
      HttpRequest req = new HttpRequest();
      req.open('DELETE', api.url("rest/region/${region}/"));
      req.setRequestHeader("Content-Type", "application/json");
      req.send();
      req.onLoad.listen(reload, onError: onError);
    }
  }

  void onError(e) {
    msg.error(e.toString());
  }

  void reload([event]) {
    if (event != null) {
      HttpRequest req = event.target;
      if (req.status != 200) {
        var err = JSON.decode(req.responseText);
        msg.error(err['error']);
      }
    }
    loader.load(api.url("rest/chatroom/", 'chatroommgmt-test.json'));
  }

  void loadTable(data) {
    print(data);
    List rooms = JSON.decode(data);
    print(rooms);
    TableSectionElement tbody = querySelector("#roomsTable");
    tbody.children.clear();
    for (var room in rooms) {
      TableRowElement row = tbody.addRow();
      var nameCell = row.addCell();
      AnchorElement link = new AnchorElement(href: '#');
      link.text = room['name'];
      nameCell.children.add(link);
      row.addCell().text = room['description'];
      row.addCell().text = room['subject'];
      var pubCell = row.addCell();
      pubCell.text = room['public'];
      pubCell.attributes['align']='center';
      var modCell = row.addCell();
      modCell.text = room['moderated'];
      modCell.attributes['align']='center';
      var memberCell = row.addCell();
      memberCell.text = room['membersOnly'];
      memberCell.attributes['align']='center';
      ButtonElement removeButton = new ButtonElement();
      removeButton.text = "Remove";
      removeButton.onClick.listen((_) {
        remove(room['id'], room['name']);
      });
      var delCell = row.addCell();
      delCell.attributes['align']='center';
      delCell.children.add(removeButton);
      tbody.children.add(row);
    };
  }
}*/
