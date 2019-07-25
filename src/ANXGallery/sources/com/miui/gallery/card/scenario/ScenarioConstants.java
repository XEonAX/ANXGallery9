package com.miui.gallery.card.scenario;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.cloud.CloudTableUtils;

public class ScenarioConstants {
    public static final String ALL_IMAGE_BASE_SELECTION;
    public static final String CAMERA_BASE_SELECTION;
    public static final String NON_CAMERA_BASE_SELECTION;
    public static final Integer[] TAGS_ACTIVITY = {Integer.valueOf(52), Integer.valueOf(56), Integer.valueOf(57)};
    public static final Integer[] TAGS_CAT = {Integer.valueOf(40)};
    public static final Integer[] TAGS_DOG = {Integer.valueOf(41)};
    public static final Integer[] TAGS_FOODS = {Integer.valueOf(4), Integer.valueOf(5), Integer.valueOf(6), Integer.valueOf(7), Integer.valueOf(8), Integer.valueOf(9), Integer.valueOf(10), Integer.valueOf(11), Integer.valueOf(12), Integer.valueOf(13), Integer.valueOf(14), Integer.valueOf(15), Integer.valueOf(16), Integer.valueOf(17), Integer.valueOf(18), Integer.valueOf(19), Integer.valueOf(20), Integer.valueOf(21), Integer.valueOf(22)};
    public static final Integer[] TAGS_PARTY = {Integer.valueOf(2), Integer.valueOf(51)};
    public static final Integer[] TAGS_PETS = {Integer.valueOf(40), Integer.valueOf(41)};
    public static final Integer[] TAGS_SPORTS = {Integer.valueOf(80), Integer.valueOf(81), Integer.valueOf(82), Integer.valueOf(84), Integer.valueOf(85), Integer.valueOf(86), Integer.valueOf(87), Integer.valueOf(88), Integer.valueOf(BaiduSceneResult.MOUNTAINEERING), Integer.valueOf(90), Integer.valueOf(92), Integer.valueOf(99)};

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType=1 AND lower(mimeType) != 'image/gif'  AND exifImageWidth > 1000 AND exifImageLength > 1000 AND localGroupId = (SELECT _id FROM cloud WHERE serverId=1) AND localGroupId != ");
        sb.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1000));
        sb.append(" AND ");
        sb.append("localGroupId");
        sb.append(" != ");
        sb.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001));
        CAMERA_BASE_SELECTION = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType=1 AND lower(mimeType) != 'image/gif'  AND exifImageWidth > 1000 AND exifImageLength > 1000 AND localGroupId != (SELECT _id FROM cloud WHERE serverId=1) AND localGroupId != ");
        sb2.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1000));
        sb2.append(" AND ");
        sb2.append("localGroupId");
        sb2.append(" != ");
        sb2.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001));
        NON_CAMERA_BASE_SELECTION = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType=1 AND lower(mimeType) != 'image/gif'  AND exifImageWidth > 1000 AND exifImageLength > 1000 AND (localGroupId in (SELECT _id FROM cloud WHERE (serverType=0) AND attributes&4!=0)) AND localGroupId != ");
        sb3.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1000));
        sb3.append(" AND ");
        sb3.append("localGroupId");
        sb3.append(" != ");
        sb3.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001));
        ALL_IMAGE_BASE_SELECTION = sb3.toString();
    }
}
