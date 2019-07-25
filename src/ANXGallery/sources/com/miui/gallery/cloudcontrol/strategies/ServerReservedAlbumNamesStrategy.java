package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.util.MiscUtil;
import java.util.Arrays;
import java.util.List;

public class ServerReservedAlbumNamesStrategy extends BaseStrategy {
    @SerializedName("reserved-names")
    private List<String> mReservedAlbumNames;

    public static ServerReservedAlbumNamesStrategy createDefault() {
        ServerReservedAlbumNamesStrategy serverReservedAlbumNamesStrategy = new ServerReservedAlbumNamesStrategy();
        serverReservedAlbumNamesStrategy.mReservedAlbumNames = Arrays.asList(new String[]{"我的照片", "截屏", "截图", "my photo", "my photos", "screenshot", "screenshots", "我的照片", "截圖", "camera photos", "相机", "相機", "所有视频", "所有影片", "All videos", "宠物相册", "Pet Album", "视频", "全景", "視頻", "Videos", "Panoramas"});
        return serverReservedAlbumNamesStrategy;
    }

    public boolean containsName(String str) {
        if (TextUtils.isEmpty(str)) {
            return true;
        }
        if (!MiscUtil.isValid(this.mReservedAlbumNames)) {
            return false;
        }
        for (String equalsIgnoreCase : this.mReservedAlbumNames) {
            if (str.equalsIgnoreCase(equalsIgnoreCase)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ServerReservedAlbumNamesStrategy{mReservedAlbumNames=");
        sb.append(this.mReservedAlbumNames);
        sb.append('}');
        return sb.toString();
    }
}
