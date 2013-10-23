/*
 *
 *
 * Copyright (C) 2008 Pingtel Corp., certain elements licensed under a Contributor Agreement.
 * Contributors retain copyright to elements licensed under a Contributor Agreement.
 * Licensed to the User under the LGPL license.
 *
 * $
 */
package org.sipfoundry.sipxconfig.web.plugin;

import org.apache.tapestry.BaseComponent;
import org.apache.tapestry.annotations.Bean;
import org.sipfoundry.sipxconfig.components.SipxValidationDelegate;

public abstract class ChatRoomMgmt extends BaseComponent {
    public static final String PAGE = "plugin/ChatRoomMgmt";

    @Bean
    public abstract SipxValidationDelegate getValidator();
}
