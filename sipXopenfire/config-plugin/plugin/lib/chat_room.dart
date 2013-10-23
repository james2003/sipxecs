library chat_room;

class ChatRoom {
  int id;
  String name;
  String description;
  String subject;
  bool canChangeSubject;
  String password;
  bool public;
  bool moderated;
  bool membersOnly;
  int maxUsers;
  bool canInvite;
  bool canDiscoverJid;
  bool logMessages;
  int rolesToBroadcast;
  List<User> owners;
  List<User> members;

  ChatRoom({
      this.id : -1,
      this.name : "",
      this.description : "",
      this.subject : "",
      this.canChangeSubject : true,
      this.password : "",
      this.public : true,
      this.moderated : false,
      this.membersOnly : false,
      this.maxUsers : 10,
      this.canInvite : true,
      this.canDiscoverJid : false,
      this.logMessages : true,
      this.rolesToBroadcast : 7,
      this.owners : null,
      this.members : null
  });

  factory ChatRoom.fromMap(Map attrs) {
    return new ChatRoom(
        id: attrs['id'],
        name: attrs['name'],
        description: attrs['description'],
        subject: attrs['subject'],
        canChangeSubject: attrs['canChangeSubject'],
        password: attrs['password'],
        public: attrs['public'],
        moderated: attrs['moderated'],
        membersOnly: attrs['membersOnly'],
        maxUsers: attrs['maxUsers'],
        canInvite: attrs['canInvite'],
        canDiscoverJid: attrs['canDiscoverJid'],
        logMessages: attrs['logEnabled'],
        rolesToBroadcast: attrs['rolesToBroadcast'],
        owners: _convert(attrs['owners']),
        members: _convert(attrs['members'])
    );
  }

  static List<User> _convert(List<Map> userMaps) {
    List<User> converted = [];

    if(userMaps != null) {
      for(Map userMap in userMaps) {
        converted.add(new User(userMap));
      }
    }

    return converted;
  }

  get broadcastModerator => rolesToBroadcast & 1 != 0;
  set broadcastModerator(int val) => rolesToBroadcast |= val;

  get broadcastParticipant => rolesToBroadcast & 2 != 0;
  set broadcastParticipant(int val) => rolesToBroadcast |= val;

  get broadcastVisitor => rolesToBroadcast & 4 != 0;
  set broadcastVisitor(int val) => rolesToBroadcast |= val;
}

class User {
  int id;
  String name;
  String displayName;
  int hashCode;

  User(Map attrs) {
    id = attrs['id'];
    name = attrs['name'];
    displayName = attrs['displayName'];
    hashCode = id;
  }

  bool operator ==(User other) => id == other.id;

  String toString() => "[id=" + id.toString() + " name=" + name + " displayName=" + displayName + "]";

  String prettyName() => name + " [" + displayName + "]";
}
