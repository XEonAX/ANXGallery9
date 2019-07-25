package com.xiaomi.xmpush.thrift;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.Serializable;
import java.util.BitSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.apache.thrift.TBase;
import org.apache.thrift.TBaseHelper;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TMap;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;

public class XmPushActionRegistration implements Serializable, Cloneable, TBase<XmPushActionRegistration, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 9);
    private static final TField ANDROID_ID_FIELD_DESC = new TField("", 11, 15);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField APP_VERSION_CODE_FIELD_DESC = new TField("", 8, 14);
    private static final TField APP_VERSION_FIELD_DESC = new TField("", 11, 5);
    private static final TField CLEAN_OLD_REG_INFO_FIELD_DESC = new TField("", 2, 101);
    private static final TField CONNECTION_ATTRS_FIELD_DESC = new TField("", 13, 100);
    private static final TField CREATED_TS_FIELD_DESC = new TField("", 10, 23);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField DEVICE_ID_FIELD_DESC = new TField("", 11, 8);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField IMEI_FIELD_DESC = new TField("", 11, 16);
    private static final TField IMEI_MD5_FIELD_DESC = new TField("", 11, 18);
    private static final TField MIID_FIELD_DESC = new TField("", 10, 22);
    private static final TField OLD_REG_ID_FIELD_DESC = new TField("", 11, 102);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 6);
    private static final TField PUSH_SDK_VERSION_CODE_FIELD_DESC = new TField("", 8, 13);
    private static final TField PUSH_SDK_VERSION_NAME_FIELD_DESC = new TField("", 11, 12);
    private static final TField REASON_FIELD_DESC = new TField("", 8, 20);
    private static final TField REG_ID_FIELD_DESC = new TField("", 11, 11);
    private static final TField SDK_VERSION_FIELD_DESC = new TField("", 11, 10);
    private static final TField SERIAL_FIELD_DESC = new TField("", 11, 17);
    private static final TField SPACE_ID_FIELD_DESC = new TField("", 8, 19);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionRegistration");
    private static final TField SUB_IMEI_FIELD_DESC = new TField("", 11, 24);
    private static final TField SUB_IMEI_MD5_FIELD_DESC = new TField("", 11, 25);
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TOKEN_FIELD_DESC = new TField("", 11, 7);
    private static final TField VALIDATE_TOKEN_FIELD_DESC = new TField("", 2, 21);
    private BitSet __isset_bit_vector = new BitSet(7);
    public String aliasName;
    public String androidId;
    public String appId;
    public String appVersion;
    public int appVersionCode;
    public boolean cleanOldRegInfo = false;
    public Map<String, String> connectionAttrs;
    public long createdTs;
    public String debug;
    public String deviceId;
    public String id;
    public String imei;
    public String imeiMd5;
    public long miid;
    public String oldRegId;
    public String packageName;
    public int pushSdkVersionCode;
    public String pushSdkVersionName;
    public RegistrationReason reason;
    public String regId;
    public String sdkVersion;
    public String serial;
    public int spaceId;
    public String subImei;
    public String subImeiMd5;
    public Target target;
    public String token;
    public boolean validateToken = true;

    public int compareTo(XmPushActionRegistration xmPushActionRegistration) {
        if (!getClass().equals(xmPushActionRegistration.getClass())) {
            return getClass().getName().compareTo(xmPushActionRegistration.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionRegistration.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionRegistration.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionRegistration.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionRegistration.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetAppVersion()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetAppVersion()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetAppVersion()) {
            int compareTo10 = TBaseHelper.compareTo(this.appVersion, xmPushActionRegistration.appVersion);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetPackageName()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetPackageName()) {
            int compareTo12 = TBaseHelper.compareTo(this.packageName, xmPushActionRegistration.packageName);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetToken()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetToken()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetToken()) {
            int compareTo14 = TBaseHelper.compareTo(this.token, xmPushActionRegistration.token);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetDeviceId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetDeviceId()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetDeviceId()) {
            int compareTo16 = TBaseHelper.compareTo(this.deviceId, xmPushActionRegistration.deviceId);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetAliasName()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetAliasName()) {
            int compareTo18 = TBaseHelper.compareTo(this.aliasName, xmPushActionRegistration.aliasName);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetSdkVersion()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetSdkVersion()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetSdkVersion()) {
            int compareTo20 = TBaseHelper.compareTo(this.sdkVersion, xmPushActionRegistration.sdkVersion);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetRegId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetRegId()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetRegId()) {
            int compareTo22 = TBaseHelper.compareTo(this.regId, xmPushActionRegistration.regId);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetPushSdkVersionName()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetPushSdkVersionName()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetPushSdkVersionName()) {
            int compareTo24 = TBaseHelper.compareTo(this.pushSdkVersionName, xmPushActionRegistration.pushSdkVersionName);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetPushSdkVersionCode()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetPushSdkVersionCode()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetPushSdkVersionCode()) {
            int compareTo26 = TBaseHelper.compareTo(this.pushSdkVersionCode, xmPushActionRegistration.pushSdkVersionCode);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        int compareTo27 = Boolean.valueOf(isSetAppVersionCode()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetAppVersionCode()));
        if (compareTo27 != 0) {
            return compareTo27;
        }
        if (isSetAppVersionCode()) {
            int compareTo28 = TBaseHelper.compareTo(this.appVersionCode, xmPushActionRegistration.appVersionCode);
            if (compareTo28 != 0) {
                return compareTo28;
            }
        }
        int compareTo29 = Boolean.valueOf(isSetAndroidId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetAndroidId()));
        if (compareTo29 != 0) {
            return compareTo29;
        }
        if (isSetAndroidId()) {
            int compareTo30 = TBaseHelper.compareTo(this.androidId, xmPushActionRegistration.androidId);
            if (compareTo30 != 0) {
                return compareTo30;
            }
        }
        int compareTo31 = Boolean.valueOf(isSetImei()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetImei()));
        if (compareTo31 != 0) {
            return compareTo31;
        }
        if (isSetImei()) {
            int compareTo32 = TBaseHelper.compareTo(this.imei, xmPushActionRegistration.imei);
            if (compareTo32 != 0) {
                return compareTo32;
            }
        }
        int compareTo33 = Boolean.valueOf(isSetSerial()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetSerial()));
        if (compareTo33 != 0) {
            return compareTo33;
        }
        if (isSetSerial()) {
            int compareTo34 = TBaseHelper.compareTo(this.serial, xmPushActionRegistration.serial);
            if (compareTo34 != 0) {
                return compareTo34;
            }
        }
        int compareTo35 = Boolean.valueOf(isSetImeiMd5()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetImeiMd5()));
        if (compareTo35 != 0) {
            return compareTo35;
        }
        if (isSetImeiMd5()) {
            int compareTo36 = TBaseHelper.compareTo(this.imeiMd5, xmPushActionRegistration.imeiMd5);
            if (compareTo36 != 0) {
                return compareTo36;
            }
        }
        int compareTo37 = Boolean.valueOf(isSetSpaceId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetSpaceId()));
        if (compareTo37 != 0) {
            return compareTo37;
        }
        if (isSetSpaceId()) {
            int compareTo38 = TBaseHelper.compareTo(this.spaceId, xmPushActionRegistration.spaceId);
            if (compareTo38 != 0) {
                return compareTo38;
            }
        }
        int compareTo39 = Boolean.valueOf(isSetReason()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetReason()));
        if (compareTo39 != 0) {
            return compareTo39;
        }
        if (isSetReason()) {
            int compareTo40 = TBaseHelper.compareTo((Comparable) this.reason, (Comparable) xmPushActionRegistration.reason);
            if (compareTo40 != 0) {
                return compareTo40;
            }
        }
        int compareTo41 = Boolean.valueOf(isSetValidateToken()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetValidateToken()));
        if (compareTo41 != 0) {
            return compareTo41;
        }
        if (isSetValidateToken()) {
            int compareTo42 = TBaseHelper.compareTo(this.validateToken, xmPushActionRegistration.validateToken);
            if (compareTo42 != 0) {
                return compareTo42;
            }
        }
        int compareTo43 = Boolean.valueOf(isSetMiid()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetMiid()));
        if (compareTo43 != 0) {
            return compareTo43;
        }
        if (isSetMiid()) {
            int compareTo44 = TBaseHelper.compareTo(this.miid, xmPushActionRegistration.miid);
            if (compareTo44 != 0) {
                return compareTo44;
            }
        }
        int compareTo45 = Boolean.valueOf(isSetCreatedTs()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetCreatedTs()));
        if (compareTo45 != 0) {
            return compareTo45;
        }
        if (isSetCreatedTs()) {
            int compareTo46 = TBaseHelper.compareTo(this.createdTs, xmPushActionRegistration.createdTs);
            if (compareTo46 != 0) {
                return compareTo46;
            }
        }
        int compareTo47 = Boolean.valueOf(isSetSubImei()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetSubImei()));
        if (compareTo47 != 0) {
            return compareTo47;
        }
        if (isSetSubImei()) {
            int compareTo48 = TBaseHelper.compareTo(this.subImei, xmPushActionRegistration.subImei);
            if (compareTo48 != 0) {
                return compareTo48;
            }
        }
        int compareTo49 = Boolean.valueOf(isSetSubImeiMd5()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetSubImeiMd5()));
        if (compareTo49 != 0) {
            return compareTo49;
        }
        if (isSetSubImeiMd5()) {
            int compareTo50 = TBaseHelper.compareTo(this.subImeiMd5, xmPushActionRegistration.subImeiMd5);
            if (compareTo50 != 0) {
                return compareTo50;
            }
        }
        int compareTo51 = Boolean.valueOf(isSetConnectionAttrs()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetConnectionAttrs()));
        if (compareTo51 != 0) {
            return compareTo51;
        }
        if (isSetConnectionAttrs()) {
            int compareTo52 = TBaseHelper.compareTo((Map) this.connectionAttrs, (Map) xmPushActionRegistration.connectionAttrs);
            if (compareTo52 != 0) {
                return compareTo52;
            }
        }
        int compareTo53 = Boolean.valueOf(isSetCleanOldRegInfo()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetCleanOldRegInfo()));
        if (compareTo53 != 0) {
            return compareTo53;
        }
        if (isSetCleanOldRegInfo()) {
            int compareTo54 = TBaseHelper.compareTo(this.cleanOldRegInfo, xmPushActionRegistration.cleanOldRegInfo);
            if (compareTo54 != 0) {
                return compareTo54;
            }
        }
        int compareTo55 = Boolean.valueOf(isSetOldRegId()).compareTo(Boolean.valueOf(xmPushActionRegistration.isSetOldRegId()));
        if (compareTo55 != 0) {
            return compareTo55;
        }
        if (isSetOldRegId()) {
            int compareTo56 = TBaseHelper.compareTo(this.oldRegId, xmPushActionRegistration.oldRegId);
            if (compareTo56 != 0) {
                return compareTo56;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionRegistration xmPushActionRegistration) {
        if (xmPushActionRegistration == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionRegistration.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionRegistration.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionRegistration.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionRegistration.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionRegistration.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionRegistration.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionRegistration.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionRegistration.appId))) {
            return false;
        }
        boolean isSetAppVersion = isSetAppVersion();
        boolean isSetAppVersion2 = xmPushActionRegistration.isSetAppVersion();
        if ((isSetAppVersion || isSetAppVersion2) && (!isSetAppVersion || !isSetAppVersion2 || !this.appVersion.equals(xmPushActionRegistration.appVersion))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionRegistration.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionRegistration.packageName))) {
            return false;
        }
        boolean isSetToken = isSetToken();
        boolean isSetToken2 = xmPushActionRegistration.isSetToken();
        if ((isSetToken || isSetToken2) && (!isSetToken || !isSetToken2 || !this.token.equals(xmPushActionRegistration.token))) {
            return false;
        }
        boolean isSetDeviceId = isSetDeviceId();
        boolean isSetDeviceId2 = xmPushActionRegistration.isSetDeviceId();
        if ((isSetDeviceId || isSetDeviceId2) && (!isSetDeviceId || !isSetDeviceId2 || !this.deviceId.equals(xmPushActionRegistration.deviceId))) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = xmPushActionRegistration.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(xmPushActionRegistration.aliasName))) {
            return false;
        }
        boolean isSetSdkVersion = isSetSdkVersion();
        boolean isSetSdkVersion2 = xmPushActionRegistration.isSetSdkVersion();
        if ((isSetSdkVersion || isSetSdkVersion2) && (!isSetSdkVersion || !isSetSdkVersion2 || !this.sdkVersion.equals(xmPushActionRegistration.sdkVersion))) {
            return false;
        }
        boolean isSetRegId = isSetRegId();
        boolean isSetRegId2 = xmPushActionRegistration.isSetRegId();
        if ((isSetRegId || isSetRegId2) && (!isSetRegId || !isSetRegId2 || !this.regId.equals(xmPushActionRegistration.regId))) {
            return false;
        }
        boolean isSetPushSdkVersionName = isSetPushSdkVersionName();
        boolean isSetPushSdkVersionName2 = xmPushActionRegistration.isSetPushSdkVersionName();
        if ((isSetPushSdkVersionName || isSetPushSdkVersionName2) && (!isSetPushSdkVersionName || !isSetPushSdkVersionName2 || !this.pushSdkVersionName.equals(xmPushActionRegistration.pushSdkVersionName))) {
            return false;
        }
        boolean isSetPushSdkVersionCode = isSetPushSdkVersionCode();
        boolean isSetPushSdkVersionCode2 = xmPushActionRegistration.isSetPushSdkVersionCode();
        if ((isSetPushSdkVersionCode || isSetPushSdkVersionCode2) && (!isSetPushSdkVersionCode || !isSetPushSdkVersionCode2 || this.pushSdkVersionCode != xmPushActionRegistration.pushSdkVersionCode)) {
            return false;
        }
        boolean isSetAppVersionCode = isSetAppVersionCode();
        boolean isSetAppVersionCode2 = xmPushActionRegistration.isSetAppVersionCode();
        if ((isSetAppVersionCode || isSetAppVersionCode2) && (!isSetAppVersionCode || !isSetAppVersionCode2 || this.appVersionCode != xmPushActionRegistration.appVersionCode)) {
            return false;
        }
        boolean isSetAndroidId = isSetAndroidId();
        boolean isSetAndroidId2 = xmPushActionRegistration.isSetAndroidId();
        if ((isSetAndroidId || isSetAndroidId2) && (!isSetAndroidId || !isSetAndroidId2 || !this.androidId.equals(xmPushActionRegistration.androidId))) {
            return false;
        }
        boolean isSetImei = isSetImei();
        boolean isSetImei2 = xmPushActionRegistration.isSetImei();
        if ((isSetImei || isSetImei2) && (!isSetImei || !isSetImei2 || !this.imei.equals(xmPushActionRegistration.imei))) {
            return false;
        }
        boolean isSetSerial = isSetSerial();
        boolean isSetSerial2 = xmPushActionRegistration.isSetSerial();
        if ((isSetSerial || isSetSerial2) && (!isSetSerial || !isSetSerial2 || !this.serial.equals(xmPushActionRegistration.serial))) {
            return false;
        }
        boolean isSetImeiMd5 = isSetImeiMd5();
        boolean isSetImeiMd52 = xmPushActionRegistration.isSetImeiMd5();
        if ((isSetImeiMd5 || isSetImeiMd52) && (!isSetImeiMd5 || !isSetImeiMd52 || !this.imeiMd5.equals(xmPushActionRegistration.imeiMd5))) {
            return false;
        }
        boolean isSetSpaceId = isSetSpaceId();
        boolean isSetSpaceId2 = xmPushActionRegistration.isSetSpaceId();
        if ((isSetSpaceId || isSetSpaceId2) && (!isSetSpaceId || !isSetSpaceId2 || this.spaceId != xmPushActionRegistration.spaceId)) {
            return false;
        }
        boolean isSetReason = isSetReason();
        boolean isSetReason2 = xmPushActionRegistration.isSetReason();
        if ((isSetReason || isSetReason2) && (!isSetReason || !isSetReason2 || !this.reason.equals(xmPushActionRegistration.reason))) {
            return false;
        }
        boolean isSetValidateToken = isSetValidateToken();
        boolean isSetValidateToken2 = xmPushActionRegistration.isSetValidateToken();
        if ((isSetValidateToken || isSetValidateToken2) && (!isSetValidateToken || !isSetValidateToken2 || this.validateToken != xmPushActionRegistration.validateToken)) {
            return false;
        }
        boolean isSetMiid = isSetMiid();
        boolean isSetMiid2 = xmPushActionRegistration.isSetMiid();
        if ((isSetMiid || isSetMiid2) && (!isSetMiid || !isSetMiid2 || this.miid != xmPushActionRegistration.miid)) {
            return false;
        }
        boolean isSetCreatedTs = isSetCreatedTs();
        boolean isSetCreatedTs2 = xmPushActionRegistration.isSetCreatedTs();
        if ((isSetCreatedTs || isSetCreatedTs2) && (!isSetCreatedTs || !isSetCreatedTs2 || this.createdTs != xmPushActionRegistration.createdTs)) {
            return false;
        }
        boolean isSetSubImei = isSetSubImei();
        boolean isSetSubImei2 = xmPushActionRegistration.isSetSubImei();
        if ((isSetSubImei || isSetSubImei2) && (!isSetSubImei || !isSetSubImei2 || !this.subImei.equals(xmPushActionRegistration.subImei))) {
            return false;
        }
        boolean isSetSubImeiMd5 = isSetSubImeiMd5();
        boolean isSetSubImeiMd52 = xmPushActionRegistration.isSetSubImeiMd5();
        if ((isSetSubImeiMd5 || isSetSubImeiMd52) && (!isSetSubImeiMd5 || !isSetSubImeiMd52 || !this.subImeiMd5.equals(xmPushActionRegistration.subImeiMd5))) {
            return false;
        }
        boolean isSetConnectionAttrs = isSetConnectionAttrs();
        boolean isSetConnectionAttrs2 = xmPushActionRegistration.isSetConnectionAttrs();
        if ((isSetConnectionAttrs || isSetConnectionAttrs2) && (!isSetConnectionAttrs || !isSetConnectionAttrs2 || !this.connectionAttrs.equals(xmPushActionRegistration.connectionAttrs))) {
            return false;
        }
        boolean isSetCleanOldRegInfo = isSetCleanOldRegInfo();
        boolean isSetCleanOldRegInfo2 = xmPushActionRegistration.isSetCleanOldRegInfo();
        if ((isSetCleanOldRegInfo || isSetCleanOldRegInfo2) && (!isSetCleanOldRegInfo || !isSetCleanOldRegInfo2 || this.cleanOldRegInfo != xmPushActionRegistration.cleanOldRegInfo)) {
            return false;
        }
        boolean isSetOldRegId = isSetOldRegId();
        boolean isSetOldRegId2 = xmPushActionRegistration.isSetOldRegId();
        return (!isSetOldRegId && !isSetOldRegId2) || (isSetOldRegId && isSetOldRegId2 && this.oldRegId.equals(xmPushActionRegistration.oldRegId));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionRegistration)) {
            return equals((XmPushActionRegistration) obj);
        }
        return false;
    }

    public String getAppId() {
        return this.appId;
    }

    public String getId() {
        return this.id;
    }

    public String getToken() {
        return this.token;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAliasName() {
        return this.aliasName != null;
    }

    public boolean isSetAndroidId() {
        return this.androidId != null;
    }

    public boolean isSetAppId() {
        return this.appId != null;
    }

    public boolean isSetAppVersion() {
        return this.appVersion != null;
    }

    public boolean isSetAppVersionCode() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetCleanOldRegInfo() {
        return this.__isset_bit_vector.get(6);
    }

    public boolean isSetConnectionAttrs() {
        return this.connectionAttrs != null;
    }

    public boolean isSetCreatedTs() {
        return this.__isset_bit_vector.get(5);
    }

    public boolean isSetDebug() {
        return this.debug != null;
    }

    public boolean isSetDeviceId() {
        return this.deviceId != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetImei() {
        return this.imei != null;
    }

    public boolean isSetImeiMd5() {
        return this.imeiMd5 != null;
    }

    public boolean isSetMiid() {
        return this.__isset_bit_vector.get(4);
    }

    public boolean isSetOldRegId() {
        return this.oldRegId != null;
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetPushSdkVersionCode() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetPushSdkVersionName() {
        return this.pushSdkVersionName != null;
    }

    public boolean isSetReason() {
        return this.reason != null;
    }

    public boolean isSetRegId() {
        return this.regId != null;
    }

    public boolean isSetSdkVersion() {
        return this.sdkVersion != null;
    }

    public boolean isSetSerial() {
        return this.serial != null;
    }

    public boolean isSetSpaceId() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetSubImei() {
        return this.subImei != null;
    }

    public boolean isSetSubImeiMd5() {
        return this.subImeiMd5 != null;
    }

    public boolean isSetTarget() {
        return this.target != null;
    }

    public boolean isSetToken() {
        return this.token != null;
    }

    public boolean isSetValidateToken() {
        return this.__isset_bit_vector.get(3);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                validate();
                return;
            }
            short s = readFieldBegin.id;
            switch (s) {
                case 1:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.debug = tProtocol.readString();
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 12) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.target = new Target();
                        this.target.read(tProtocol);
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.id = tProtocol.readString();
                        break;
                    }
                case 4:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appId = tProtocol.readString();
                        break;
                    }
                case 5:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appVersion = tProtocol.readString();
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.token = tProtocol.readString();
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.deviceId = tProtocol.readString();
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.aliasName = tProtocol.readString();
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.sdkVersion = tProtocol.readString();
                        break;
                    }
                case 11:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.regId = tProtocol.readString();
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.pushSdkVersionName = tProtocol.readString();
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.pushSdkVersionCode = tProtocol.readI32();
                        setPushSdkVersionCodeIsSet(true);
                        break;
                    }
                case 14:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appVersionCode = tProtocol.readI32();
                        setAppVersionCodeIsSet(true);
                        break;
                    }
                case 15:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.androidId = tProtocol.readString();
                        break;
                    }
                case 16:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.imei = tProtocol.readString();
                        break;
                    }
                case 17:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.serial = tProtocol.readString();
                        break;
                    }
                case 18:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.imeiMd5 = tProtocol.readString();
                        break;
                    }
                case 19:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.spaceId = tProtocol.readI32();
                        setSpaceIdIsSet(true);
                        break;
                    }
                case 20:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.reason = RegistrationReason.findByValue(tProtocol.readI32());
                        break;
                    }
                case 21:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.validateToken = tProtocol.readBool();
                        setValidateTokenIsSet(true);
                        break;
                    }
                case 22:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.miid = tProtocol.readI64();
                        setMiidIsSet(true);
                        break;
                    }
                case 23:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.createdTs = tProtocol.readI64();
                        setCreatedTsIsSet(true);
                        break;
                    }
                case 24:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.subImei = tProtocol.readString();
                        break;
                    }
                case 25:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.subImeiMd5 = tProtocol.readString();
                        break;
                    }
                default:
                    switch (s) {
                        case 100:
                            if (readFieldBegin.type != 13) {
                                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                break;
                            } else {
                                TMap readMapBegin = tProtocol.readMapBegin();
                                this.connectionAttrs = new HashMap(readMapBegin.size * 2);
                                for (int i = 0; i < readMapBegin.size; i++) {
                                    this.connectionAttrs.put(tProtocol.readString(), tProtocol.readString());
                                }
                                tProtocol.readMapEnd();
                                break;
                            }
                        case BaiduSceneResult.SHOOTING /*101*/:
                            if (readFieldBegin.type != 2) {
                                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                break;
                            } else {
                                this.cleanOldRegInfo = tProtocol.readBool();
                                setCleanOldRegInfoIsSet(true);
                                break;
                            }
                        case BaiduSceneResult.TAEKWONDO /*102*/:
                            if (readFieldBegin.type != 11) {
                                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                break;
                            } else {
                                this.oldRegId = tProtocol.readString();
                                break;
                            }
                        default:
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                    }
            }
            tProtocol.readFieldEnd();
        }
    }

    public XmPushActionRegistration setAndroidId(String str) {
        this.androidId = str;
        return this;
    }

    public XmPushActionRegistration setAppId(String str) {
        this.appId = str;
        return this;
    }

    public XmPushActionRegistration setAppVersion(String str) {
        this.appVersion = str;
        return this;
    }

    public XmPushActionRegistration setAppVersionCode(int i) {
        this.appVersionCode = i;
        setAppVersionCodeIsSet(true);
        return this;
    }

    public void setAppVersionCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public void setCleanOldRegInfoIsSet(boolean z) {
        this.__isset_bit_vector.set(6, z);
    }

    public void setCreatedTsIsSet(boolean z) {
        this.__isset_bit_vector.set(5, z);
    }

    public XmPushActionRegistration setDeviceId(String str) {
        this.deviceId = str;
        return this;
    }

    public XmPushActionRegistration setId(String str) {
        this.id = str;
        return this;
    }

    public XmPushActionRegistration setImei(String str) {
        this.imei = str;
        return this;
    }

    public XmPushActionRegistration setImeiMd5(String str) {
        this.imeiMd5 = str;
        return this;
    }

    public void setMiidIsSet(boolean z) {
        this.__isset_bit_vector.set(4, z);
    }

    public XmPushActionRegistration setPackageName(String str) {
        this.packageName = str;
        return this;
    }

    public XmPushActionRegistration setPushSdkVersionCode(int i) {
        this.pushSdkVersionCode = i;
        setPushSdkVersionCodeIsSet(true);
        return this;
    }

    public void setPushSdkVersionCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public XmPushActionRegistration setPushSdkVersionName(String str) {
        this.pushSdkVersionName = str;
        return this;
    }

    public XmPushActionRegistration setReason(RegistrationReason registrationReason) {
        this.reason = registrationReason;
        return this;
    }

    public XmPushActionRegistration setSerial(String str) {
        this.serial = str;
        return this;
    }

    public XmPushActionRegistration setSpaceId(int i) {
        this.spaceId = i;
        setSpaceIdIsSet(true);
        return this;
    }

    public void setSpaceIdIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public XmPushActionRegistration setToken(String str) {
        this.token = str;
        return this;
    }

    public void setValidateTokenIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionRegistration(");
        if (isSetDebug()) {
            sb.append("debug:");
            if (this.debug == null) {
                sb.append("null");
            } else {
                sb.append(this.debug);
            }
            z = false;
        } else {
            z = true;
        }
        if (isSetTarget()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("target:");
            if (this.target == null) {
                sb.append("null");
            } else {
                sb.append(this.target);
            }
            z = false;
        }
        if (!z) {
            sb.append(", ");
        }
        sb.append("id:");
        if (this.id == null) {
            sb.append("null");
        } else {
            sb.append(this.id);
        }
        sb.append(", ");
        sb.append("appId:");
        if (this.appId == null) {
            sb.append("null");
        } else {
            sb.append(this.appId);
        }
        if (isSetAppVersion()) {
            sb.append(", ");
            sb.append("appVersion:");
            if (this.appVersion == null) {
                sb.append("null");
            } else {
                sb.append(this.appVersion);
            }
        }
        if (isSetPackageName()) {
            sb.append(", ");
            sb.append("packageName:");
            if (this.packageName == null) {
                sb.append("null");
            } else {
                sb.append(this.packageName);
            }
        }
        sb.append(", ");
        sb.append("token:");
        if (this.token == null) {
            sb.append("null");
        } else {
            sb.append(this.token);
        }
        if (isSetDeviceId()) {
            sb.append(", ");
            sb.append("deviceId:");
            if (this.deviceId == null) {
                sb.append("null");
            } else {
                sb.append(this.deviceId);
            }
        }
        if (isSetAliasName()) {
            sb.append(", ");
            sb.append("aliasName:");
            if (this.aliasName == null) {
                sb.append("null");
            } else {
                sb.append(this.aliasName);
            }
        }
        if (isSetSdkVersion()) {
            sb.append(", ");
            sb.append("sdkVersion:");
            if (this.sdkVersion == null) {
                sb.append("null");
            } else {
                sb.append(this.sdkVersion);
            }
        }
        if (isSetRegId()) {
            sb.append(", ");
            sb.append("regId:");
            if (this.regId == null) {
                sb.append("null");
            } else {
                sb.append(this.regId);
            }
        }
        if (isSetPushSdkVersionName()) {
            sb.append(", ");
            sb.append("pushSdkVersionName:");
            if (this.pushSdkVersionName == null) {
                sb.append("null");
            } else {
                sb.append(this.pushSdkVersionName);
            }
        }
        if (isSetPushSdkVersionCode()) {
            sb.append(", ");
            sb.append("pushSdkVersionCode:");
            sb.append(this.pushSdkVersionCode);
        }
        if (isSetAppVersionCode()) {
            sb.append(", ");
            sb.append("appVersionCode:");
            sb.append(this.appVersionCode);
        }
        if (isSetAndroidId()) {
            sb.append(", ");
            sb.append("androidId:");
            if (this.androidId == null) {
                sb.append("null");
            } else {
                sb.append(this.androidId);
            }
        }
        if (isSetImei()) {
            sb.append(", ");
            sb.append("imei:");
            if (this.imei == null) {
                sb.append("null");
            } else {
                sb.append(this.imei);
            }
        }
        if (isSetSerial()) {
            sb.append(", ");
            sb.append("serial:");
            if (this.serial == null) {
                sb.append("null");
            } else {
                sb.append(this.serial);
            }
        }
        if (isSetImeiMd5()) {
            sb.append(", ");
            sb.append("imeiMd5:");
            if (this.imeiMd5 == null) {
                sb.append("null");
            } else {
                sb.append(this.imeiMd5);
            }
        }
        if (isSetSpaceId()) {
            sb.append(", ");
            sb.append("spaceId:");
            sb.append(this.spaceId);
        }
        if (isSetReason()) {
            sb.append(", ");
            sb.append("reason:");
            if (this.reason == null) {
                sb.append("null");
            } else {
                sb.append(this.reason);
            }
        }
        if (isSetValidateToken()) {
            sb.append(", ");
            sb.append("validateToken:");
            sb.append(this.validateToken);
        }
        if (isSetMiid()) {
            sb.append(", ");
            sb.append("miid:");
            sb.append(this.miid);
        }
        if (isSetCreatedTs()) {
            sb.append(", ");
            sb.append("createdTs:");
            sb.append(this.createdTs);
        }
        if (isSetSubImei()) {
            sb.append(", ");
            sb.append("subImei:");
            if (this.subImei == null) {
                sb.append("null");
            } else {
                sb.append(this.subImei);
            }
        }
        if (isSetSubImeiMd5()) {
            sb.append(", ");
            sb.append("subImeiMd5:");
            if (this.subImeiMd5 == null) {
                sb.append("null");
            } else {
                sb.append(this.subImeiMd5);
            }
        }
        if (isSetConnectionAttrs()) {
            sb.append(", ");
            sb.append("connectionAttrs:");
            if (this.connectionAttrs == null) {
                sb.append("null");
            } else {
                sb.append(this.connectionAttrs);
            }
        }
        if (isSetCleanOldRegInfo()) {
            sb.append(", ");
            sb.append("cleanOldRegInfo:");
            sb.append(this.cleanOldRegInfo);
        }
        if (isSetOldRegId()) {
            sb.append(", ");
            sb.append("oldRegId:");
            if (this.oldRegId == null) {
                sb.append("null");
            } else {
                sb.append(this.oldRegId);
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.id == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'id' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
        } else if (this.appId == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Required field 'appId' was not present! Struct: ");
            sb2.append(toString());
            throw new TProtocolException(sb2.toString());
        } else if (this.token == null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Required field 'token' was not present! Struct: ");
            sb3.append(toString());
            throw new TProtocolException(sb3.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        if (this.debug != null && isSetDebug()) {
            tProtocol.writeFieldBegin(DEBUG_FIELD_DESC);
            tProtocol.writeString(this.debug);
            tProtocol.writeFieldEnd();
        }
        if (this.target != null && isSetTarget()) {
            tProtocol.writeFieldBegin(TARGET_FIELD_DESC);
            this.target.write(tProtocol);
            tProtocol.writeFieldEnd();
        }
        if (this.id != null) {
            tProtocol.writeFieldBegin(ID_FIELD_DESC);
            tProtocol.writeString(this.id);
            tProtocol.writeFieldEnd();
        }
        if (this.appId != null) {
            tProtocol.writeFieldBegin(APP_ID_FIELD_DESC);
            tProtocol.writeString(this.appId);
            tProtocol.writeFieldEnd();
        }
        if (this.appVersion != null && isSetAppVersion()) {
            tProtocol.writeFieldBegin(APP_VERSION_FIELD_DESC);
            tProtocol.writeString(this.appVersion);
            tProtocol.writeFieldEnd();
        }
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
        if (this.token != null) {
            tProtocol.writeFieldBegin(TOKEN_FIELD_DESC);
            tProtocol.writeString(this.token);
            tProtocol.writeFieldEnd();
        }
        if (this.deviceId != null && isSetDeviceId()) {
            tProtocol.writeFieldBegin(DEVICE_ID_FIELD_DESC);
            tProtocol.writeString(this.deviceId);
            tProtocol.writeFieldEnd();
        }
        if (this.aliasName != null && isSetAliasName()) {
            tProtocol.writeFieldBegin(ALIAS_NAME_FIELD_DESC);
            tProtocol.writeString(this.aliasName);
            tProtocol.writeFieldEnd();
        }
        if (this.sdkVersion != null && isSetSdkVersion()) {
            tProtocol.writeFieldBegin(SDK_VERSION_FIELD_DESC);
            tProtocol.writeString(this.sdkVersion);
            tProtocol.writeFieldEnd();
        }
        if (this.regId != null && isSetRegId()) {
            tProtocol.writeFieldBegin(REG_ID_FIELD_DESC);
            tProtocol.writeString(this.regId);
            tProtocol.writeFieldEnd();
        }
        if (this.pushSdkVersionName != null && isSetPushSdkVersionName()) {
            tProtocol.writeFieldBegin(PUSH_SDK_VERSION_NAME_FIELD_DESC);
            tProtocol.writeString(this.pushSdkVersionName);
            tProtocol.writeFieldEnd();
        }
        if (isSetPushSdkVersionCode()) {
            tProtocol.writeFieldBegin(PUSH_SDK_VERSION_CODE_FIELD_DESC);
            tProtocol.writeI32(this.pushSdkVersionCode);
            tProtocol.writeFieldEnd();
        }
        if (isSetAppVersionCode()) {
            tProtocol.writeFieldBegin(APP_VERSION_CODE_FIELD_DESC);
            tProtocol.writeI32(this.appVersionCode);
            tProtocol.writeFieldEnd();
        }
        if (this.androidId != null && isSetAndroidId()) {
            tProtocol.writeFieldBegin(ANDROID_ID_FIELD_DESC);
            tProtocol.writeString(this.androidId);
            tProtocol.writeFieldEnd();
        }
        if (this.imei != null && isSetImei()) {
            tProtocol.writeFieldBegin(IMEI_FIELD_DESC);
            tProtocol.writeString(this.imei);
            tProtocol.writeFieldEnd();
        }
        if (this.serial != null && isSetSerial()) {
            tProtocol.writeFieldBegin(SERIAL_FIELD_DESC);
            tProtocol.writeString(this.serial);
            tProtocol.writeFieldEnd();
        }
        if (this.imeiMd5 != null && isSetImeiMd5()) {
            tProtocol.writeFieldBegin(IMEI_MD5_FIELD_DESC);
            tProtocol.writeString(this.imeiMd5);
            tProtocol.writeFieldEnd();
        }
        if (isSetSpaceId()) {
            tProtocol.writeFieldBegin(SPACE_ID_FIELD_DESC);
            tProtocol.writeI32(this.spaceId);
            tProtocol.writeFieldEnd();
        }
        if (this.reason != null && isSetReason()) {
            tProtocol.writeFieldBegin(REASON_FIELD_DESC);
            tProtocol.writeI32(this.reason.getValue());
            tProtocol.writeFieldEnd();
        }
        if (isSetValidateToken()) {
            tProtocol.writeFieldBegin(VALIDATE_TOKEN_FIELD_DESC);
            tProtocol.writeBool(this.validateToken);
            tProtocol.writeFieldEnd();
        }
        if (isSetMiid()) {
            tProtocol.writeFieldBegin(MIID_FIELD_DESC);
            tProtocol.writeI64(this.miid);
            tProtocol.writeFieldEnd();
        }
        if (isSetCreatedTs()) {
            tProtocol.writeFieldBegin(CREATED_TS_FIELD_DESC);
            tProtocol.writeI64(this.createdTs);
            tProtocol.writeFieldEnd();
        }
        if (this.subImei != null && isSetSubImei()) {
            tProtocol.writeFieldBegin(SUB_IMEI_FIELD_DESC);
            tProtocol.writeString(this.subImei);
            tProtocol.writeFieldEnd();
        }
        if (this.subImeiMd5 != null && isSetSubImeiMd5()) {
            tProtocol.writeFieldBegin(SUB_IMEI_MD5_FIELD_DESC);
            tProtocol.writeString(this.subImeiMd5);
            tProtocol.writeFieldEnd();
        }
        if (this.connectionAttrs != null && isSetConnectionAttrs()) {
            tProtocol.writeFieldBegin(CONNECTION_ATTRS_FIELD_DESC);
            tProtocol.writeMapBegin(new TMap(11, 11, this.connectionAttrs.size()));
            for (Entry entry : this.connectionAttrs.entrySet()) {
                tProtocol.writeString((String) entry.getKey());
                tProtocol.writeString((String) entry.getValue());
            }
            tProtocol.writeMapEnd();
            tProtocol.writeFieldEnd();
        }
        if (isSetCleanOldRegInfo()) {
            tProtocol.writeFieldBegin(CLEAN_OLD_REG_INFO_FIELD_DESC);
            tProtocol.writeBool(this.cleanOldRegInfo);
            tProtocol.writeFieldEnd();
        }
        if (this.oldRegId != null && isSetOldRegId()) {
            tProtocol.writeFieldBegin(OLD_REG_ID_FIELD_DESC);
            tProtocol.writeString(this.oldRegId);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
