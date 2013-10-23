package org.sipfoundry.sipxconfig.web.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatRoomController {
    private static final Logger LOG = Logger.getLogger(ChatRoomController.class);

    public ChatRoomController() {
        LOG.warn("ChatRoomController initializing");
    }

    @SuppressWarnings("static-method")
    @RequestMapping(value = "/chatroom", method = RequestMethod.GET)
    public @ResponseBody
    List<ChatRoom> get(@RequestParam(value = "start", required = false, defaultValue = "-1") int start,
        @RequestParam(value = "count", required = false, defaultValue = "-1") String count) {
        List<ChatRoom> rooms = new ArrayList<ChatRoom>();

        return rooms;
    }

}
