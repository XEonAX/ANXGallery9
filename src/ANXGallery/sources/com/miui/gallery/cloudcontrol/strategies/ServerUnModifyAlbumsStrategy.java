package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;

public class ServerUnModifyAlbumsStrategy extends BaseStrategy {
    @SerializedName("albums")
    private List<ServerUnModifyAlbum> mAlbums;

    public static class ServerUnModifyAlbum {
        @SerializedName("name")
        private String mName;
        @SerializedName("serverId")
        private long mServerId;

        public ServerUnModifyAlbum(long j, String str) {
            this.mServerId = j;
            this.mName = str;
        }

        public String getName() {
            return this.mName;
        }

        public long getServerId() {
            return this.mServerId;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("ServerUnModifyAlbum{mServerId=");
            sb.append(this.mServerId);
            sb.append(", mName=");
            sb.append(this.mName);
            sb.append('}');
            return sb.toString();
        }
    }

    public static ServerUnModifyAlbumsStrategy createDefault() {
        ServerUnModifyAlbumsStrategy serverUnModifyAlbumsStrategy = new ServerUnModifyAlbumsStrategy();
        serverUnModifyAlbumsStrategy.mAlbums = new ArrayList();
        serverUnModifyAlbumsStrategy.mAlbums.add(new ServerUnModifyAlbum(1, "untitled"));
        serverUnModifyAlbumsStrategy.mAlbums.add(new ServerUnModifyAlbum(2, "snapshot"));
        return serverUnModifyAlbumsStrategy;
    }

    public boolean containsName(String str) {
        if (TextUtils.isEmpty(str)) {
            return true;
        }
        if (this.mAlbums != null) {
            for (ServerUnModifyAlbum name : this.mAlbums) {
                if (name.getName().equalsIgnoreCase(str)) {
                    return true;
                }
            }
        }
        return false;
    }

    public List<ServerUnModifyAlbum> getAlbums() {
        return this.mAlbums;
    }

    public String getServerAlbumName(long j) {
        if (this.mAlbums != null) {
            for (ServerUnModifyAlbum serverUnModifyAlbum : this.mAlbums) {
                if (serverUnModifyAlbum.getServerId() == j) {
                    return serverUnModifyAlbum.getName();
                }
            }
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ServerUnModifyAlbumsStrategy{mAlbums=");
        sb.append(this.mAlbums);
        sb.append('}');
        return sb.toString();
    }
}
