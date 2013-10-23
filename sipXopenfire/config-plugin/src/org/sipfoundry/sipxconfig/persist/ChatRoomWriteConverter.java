package org.sipfoundry.sipxconfig.persist;

import org.sipfoundry.sipxconfig.web.rest.ChatRoom;
import org.springframework.core.convert.converter.Converter;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class ChatRoomWriteConverter implements Converter<ChatRoom, DBObject> {

    @Override
    public DBObject convert(ChatRoom room) {
        DBObject roomObj = new BasicDBObject();

        roomObj.put("", null);

        return roomObj;
    }

}
