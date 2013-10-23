package org.sipfoundry.sipxconfig.web.rest;

import java.util.List;

public class ChatRoom {
    private long id;
    private String name;
    private String description;
    private String subject;
    private boolean canChangeSubject;
    private String password;
    private boolean publicRoom;
    private boolean moderated;
    private boolean membersOnly;
    private int maxUsers;
    private boolean canInvite;
    private boolean canDiscoverJid;
    private boolean logEnabled;
    private int rolesToBroadcast;
    private List< ? > owners;
    private List< ? > members;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public boolean isCanChangeSubject() {
        return canChangeSubject;
    }

    public void setCanChangeSubject(boolean canChangeSubject) {
        this.canChangeSubject = canChangeSubject;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isPublicRoom() {
        return publicRoom;
    }

    public void setPublicRoom(boolean publicRoom) {
        this.publicRoom = publicRoom;
    }

    public boolean isModerated() {
        return moderated;
    }

    public void setModerated(boolean moderated) {
        this.moderated = moderated;
    }

    public boolean isMembersOnly() {
        return membersOnly;
    }

    public void setMembersOnly(boolean membersOnly) {
        this.membersOnly = membersOnly;
    }

    public int getMaxUsers() {
        return maxUsers;
    }

    public void setMaxUsers(int maxUsers) {
        this.maxUsers = maxUsers;
    }

    public boolean isCanInvite() {
        return canInvite;
    }

    public void setCanInvite(boolean canInvite) {
        this.canInvite = canInvite;
    }

    public boolean isCanDiscoverJid() {
        return canDiscoverJid;
    }

    public void setCanDiscoverJid(boolean canDiscoverJid) {
        this.canDiscoverJid = canDiscoverJid;
    }

    public boolean isLogEnabled() {
        return logEnabled;
    }

    public void setLogEnabled(boolean logEnabled) {
        this.logEnabled = logEnabled;
    }

    public int getRolesToBroadcast() {
        return rolesToBroadcast;
    }

    public void setRolesToBroadcast(int rolesToBroadcast) {
        this.rolesToBroadcast = rolesToBroadcast;
    }

    public List< ? > getOwners() {
        return owners;
    }

    public void setOwners(List< ? > owners) {
        this.owners = owners;
    }

    public List< ? > getMembers() {
        return members;
    }

    public void setMembers(List< ? > members) {
        this.members = members;
    }

    @Override
    public String toString() {
        return "ChatRoom [id=" + id + ", name=" + name + ", description=" + description + ", subject=" + subject
            + ", canChangeSubject=" + canChangeSubject + ", password=" + password + ", publicRoom=" + publicRoom
            + ", moderated=" + moderated + ", membersOnly=" + membersOnly + ", maxUsers=" + maxUsers
            + ", canInvite=" + canInvite + ", canDiscoverJid=" + canDiscoverJid + ", logEnabled=" + logEnabled
            + ", rolesToBroadcast=" + rolesToBroadcast + ", owners=" + owners + ", members=" + members + "]";
    }
}
