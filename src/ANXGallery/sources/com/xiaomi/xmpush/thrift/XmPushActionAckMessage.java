package com.xiaomi.xmpush.thrift;

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

public class XmPushActionAckMessage implements Serializable, Cloneable, TBase<XmPushActionAckMessage, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 7);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField CALLBACK_URL_FIELD_DESC = new TField("", 11, 13);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 10);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField DEVICE_ID_FIELD_DESC = new TField("", 11, 21);
    private static final TField DEVICE_STATUS_FIELD_DESC = new TField("", 6, 15);
    private static final TField EXTRA_FIELD_DESC = new TField("", 13, 23);
    private static final TField GEO_MSG_STATUS_FIELD_DESC = new TField("", 6, 16);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField IMEI_MD5_FIELD_DESC = new TField("", 11, 20);
    private static final TField IS_ONLINE_FIELD_DESC = new TField("", 2, 11);
    private static final TField MESSAGE_TS_FIELD_DESC = new TField("", 10, 5);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 9);
    private static final TField PASS_THROUGH_FIELD_DESC = new TField("", 8, 22);
    private static final TField REG_ID_FIELD_DESC = new TField("", 11, 12);
    private static final TField REQUEST_FIELD_DESC = new TField("", 12, 8);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionAckMessage");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TOPIC_FIELD_DESC = new TField("", 11, 6);
    private static final TField USER_ACCOUNT_FIELD_DESC = new TField("", 11, 14);
    private BitSet __isset_bit_vector = new BitSet(5);
    public String aliasName;
    public String appId;
    public String callbackUrl;
    public String category;
    public String debug;
    public String deviceId;
    public short deviceStatus;
    public Map<String, String> extra;
    public short geoMsgStatus;
    public String id;
    public String imeiMd5;
    public boolean isOnline = false;
    public long messageTs;
    public String packageName;
    public int passThrough;
    public String regId;
    public XmPushActionSendMessage request;
    public Target target;
    public String topic;
    public String userAccount;

    public int compareTo(XmPushActionAckMessage xmPushActionAckMessage) {
        if (!getClass().equals(xmPushActionAckMessage.getClass())) {
            return getClass().getName().compareTo(xmPushActionAckMessage.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionAckMessage.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionAckMessage.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionAckMessage.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionAckMessage.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetMessageTs()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetMessageTs()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetMessageTs()) {
            int compareTo10 = TBaseHelper.compareTo(this.messageTs, xmPushActionAckMessage.messageTs);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetTopic()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetTopic()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetTopic()) {
            int compareTo12 = TBaseHelper.compareTo(this.topic, xmPushActionAckMessage.topic);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetAliasName()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetAliasName()) {
            int compareTo14 = TBaseHelper.compareTo(this.aliasName, xmPushActionAckMessage.aliasName);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetRequest()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetRequest()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetRequest()) {
            int compareTo16 = TBaseHelper.compareTo((Comparable) this.request, (Comparable) xmPushActionAckMessage.request);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetPackageName()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetPackageName()) {
            int compareTo18 = TBaseHelper.compareTo(this.packageName, xmPushActionAckMessage.packageName);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetCategory()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetCategory()) {
            int compareTo20 = TBaseHelper.compareTo(this.category, xmPushActionAckMessage.category);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetIsOnline()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetIsOnline()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetIsOnline()) {
            int compareTo22 = TBaseHelper.compareTo(this.isOnline, xmPushActionAckMessage.isOnline);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetRegId()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetRegId()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetRegId()) {
            int compareTo24 = TBaseHelper.compareTo(this.regId, xmPushActionAckMessage.regId);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetCallbackUrl()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetCallbackUrl()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetCallbackUrl()) {
            int compareTo26 = TBaseHelper.compareTo(this.callbackUrl, xmPushActionAckMessage.callbackUrl);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        int compareTo27 = Boolean.valueOf(isSetUserAccount()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetUserAccount()));
        if (compareTo27 != 0) {
            return compareTo27;
        }
        if (isSetUserAccount()) {
            int compareTo28 = TBaseHelper.compareTo(this.userAccount, xmPushActionAckMessage.userAccount);
            if (compareTo28 != 0) {
                return compareTo28;
            }
        }
        int compareTo29 = Boolean.valueOf(isSetDeviceStatus()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetDeviceStatus()));
        if (compareTo29 != 0) {
            return compareTo29;
        }
        if (isSetDeviceStatus()) {
            int compareTo30 = TBaseHelper.compareTo(this.deviceStatus, xmPushActionAckMessage.deviceStatus);
            if (compareTo30 != 0) {
                return compareTo30;
            }
        }
        int compareTo31 = Boolean.valueOf(isSetGeoMsgStatus()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetGeoMsgStatus()));
        if (compareTo31 != 0) {
            return compareTo31;
        }
        if (isSetGeoMsgStatus()) {
            int compareTo32 = TBaseHelper.compareTo(this.geoMsgStatus, xmPushActionAckMessage.geoMsgStatus);
            if (compareTo32 != 0) {
                return compareTo32;
            }
        }
        int compareTo33 = Boolean.valueOf(isSetImeiMd5()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetImeiMd5()));
        if (compareTo33 != 0) {
            return compareTo33;
        }
        if (isSetImeiMd5()) {
            int compareTo34 = TBaseHelper.compareTo(this.imeiMd5, xmPushActionAckMessage.imeiMd5);
            if (compareTo34 != 0) {
                return compareTo34;
            }
        }
        int compareTo35 = Boolean.valueOf(isSetDeviceId()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetDeviceId()));
        if (compareTo35 != 0) {
            return compareTo35;
        }
        if (isSetDeviceId()) {
            int compareTo36 = TBaseHelper.compareTo(this.deviceId, xmPushActionAckMessage.deviceId);
            if (compareTo36 != 0) {
                return compareTo36;
            }
        }
        int compareTo37 = Boolean.valueOf(isSetPassThrough()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetPassThrough()));
        if (compareTo37 != 0) {
            return compareTo37;
        }
        if (isSetPassThrough()) {
            int compareTo38 = TBaseHelper.compareTo(this.passThrough, xmPushActionAckMessage.passThrough);
            if (compareTo38 != 0) {
                return compareTo38;
            }
        }
        int compareTo39 = Boolean.valueOf(isSetExtra()).compareTo(Boolean.valueOf(xmPushActionAckMessage.isSetExtra()));
        if (compareTo39 != 0) {
            return compareTo39;
        }
        if (isSetExtra()) {
            int compareTo40 = TBaseHelper.compareTo((Map) this.extra, (Map) xmPushActionAckMessage.extra);
            if (compareTo40 != 0) {
                return compareTo40;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionAckMessage xmPushActionAckMessage) {
        if (xmPushActionAckMessage == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionAckMessage.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionAckMessage.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionAckMessage.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionAckMessage.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionAckMessage.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionAckMessage.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionAckMessage.isSetAppId();
        if (((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionAckMessage.appId))) || this.messageTs != xmPushActionAckMessage.messageTs) {
            return false;
        }
        boolean isSetTopic = isSetTopic();
        boolean isSetTopic2 = xmPushActionAckMessage.isSetTopic();
        if ((isSetTopic || isSetTopic2) && (!isSetTopic || !isSetTopic2 || !this.topic.equals(xmPushActionAckMessage.topic))) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = xmPushActionAckMessage.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(xmPushActionAckMessage.aliasName))) {
            return false;
        }
        boolean isSetRequest = isSetRequest();
        boolean isSetRequest2 = xmPushActionAckMessage.isSetRequest();
        if ((isSetRequest || isSetRequest2) && (!isSetRequest || !isSetRequest2 || !this.request.equals(xmPushActionAckMessage.request))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionAckMessage.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionAckMessage.packageName))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionAckMessage.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(xmPushActionAckMessage.category))) {
            return false;
        }
        boolean isSetIsOnline = isSetIsOnline();
        boolean isSetIsOnline2 = xmPushActionAckMessage.isSetIsOnline();
        if ((isSetIsOnline || isSetIsOnline2) && (!isSetIsOnline || !isSetIsOnline2 || this.isOnline != xmPushActionAckMessage.isOnline)) {
            return false;
        }
        boolean isSetRegId = isSetRegId();
        boolean isSetRegId2 = xmPushActionAckMessage.isSetRegId();
        if ((isSetRegId || isSetRegId2) && (!isSetRegId || !isSetRegId2 || !this.regId.equals(xmPushActionAckMessage.regId))) {
            return false;
        }
        boolean isSetCallbackUrl = isSetCallbackUrl();
        boolean isSetCallbackUrl2 = xmPushActionAckMessage.isSetCallbackUrl();
        if ((isSetCallbackUrl || isSetCallbackUrl2) && (!isSetCallbackUrl || !isSetCallbackUrl2 || !this.callbackUrl.equals(xmPushActionAckMessage.callbackUrl))) {
            return false;
        }
        boolean isSetUserAccount = isSetUserAccount();
        boolean isSetUserAccount2 = xmPushActionAckMessage.isSetUserAccount();
        if ((isSetUserAccount || isSetUserAccount2) && (!isSetUserAccount || !isSetUserAccount2 || !this.userAccount.equals(xmPushActionAckMessage.userAccount))) {
            return false;
        }
        boolean isSetDeviceStatus = isSetDeviceStatus();
        boolean isSetDeviceStatus2 = xmPushActionAckMessage.isSetDeviceStatus();
        if ((isSetDeviceStatus || isSetDeviceStatus2) && (!isSetDeviceStatus || !isSetDeviceStatus2 || this.deviceStatus != xmPushActionAckMessage.deviceStatus)) {
            return false;
        }
        boolean isSetGeoMsgStatus = isSetGeoMsgStatus();
        boolean isSetGeoMsgStatus2 = xmPushActionAckMessage.isSetGeoMsgStatus();
        if ((isSetGeoMsgStatus || isSetGeoMsgStatus2) && (!isSetGeoMsgStatus || !isSetGeoMsgStatus2 || this.geoMsgStatus != xmPushActionAckMessage.geoMsgStatus)) {
            return false;
        }
        boolean isSetImeiMd5 = isSetImeiMd5();
        boolean isSetImeiMd52 = xmPushActionAckMessage.isSetImeiMd5();
        if ((isSetImeiMd5 || isSetImeiMd52) && (!isSetImeiMd5 || !isSetImeiMd52 || !this.imeiMd5.equals(xmPushActionAckMessage.imeiMd5))) {
            return false;
        }
        boolean isSetDeviceId = isSetDeviceId();
        boolean isSetDeviceId2 = xmPushActionAckMessage.isSetDeviceId();
        if ((isSetDeviceId || isSetDeviceId2) && (!isSetDeviceId || !isSetDeviceId2 || !this.deviceId.equals(xmPushActionAckMessage.deviceId))) {
            return false;
        }
        boolean isSetPassThrough = isSetPassThrough();
        boolean isSetPassThrough2 = xmPushActionAckMessage.isSetPassThrough();
        if ((isSetPassThrough || isSetPassThrough2) && (!isSetPassThrough || !isSetPassThrough2 || this.passThrough != xmPushActionAckMessage.passThrough)) {
            return false;
        }
        boolean isSetExtra = isSetExtra();
        boolean isSetExtra2 = xmPushActionAckMessage.isSetExtra();
        return (!isSetExtra && !isSetExtra2) || (isSetExtra && isSetExtra2 && this.extra.equals(xmPushActionAckMessage.extra));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionAckMessage)) {
            return equals((XmPushActionAckMessage) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAliasName() {
        return this.aliasName != null;
    }

    public boolean isSetAppId() {
        return this.appId != null;
    }

    public boolean isSetCallbackUrl() {
        return this.callbackUrl != null;
    }

    public boolean isSetCategory() {
        return this.category != null;
    }

    public boolean isSetDebug() {
        return this.debug != null;
    }

    public boolean isSetDeviceId() {
        return this.deviceId != null;
    }

    public boolean isSetDeviceStatus() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetExtra() {
        return this.extra != null;
    }

    public boolean isSetGeoMsgStatus() {
        return this.__isset_bit_vector.get(3);
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetImeiMd5() {
        return this.imeiMd5 != null;
    }

    public boolean isSetIsOnline() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetMessageTs() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetPassThrough() {
        return this.__isset_bit_vector.get(4);
    }

    public boolean isSetRegId() {
        return this.regId != null;
    }

    public boolean isSetRequest() {
        return this.request != null;
    }

    public boolean isSetTarget() {
        return this.target != null;
    }

    public boolean isSetTopic() {
        return this.topic != null;
    }

    public boolean isSetUserAccount() {
        return this.userAccount != null;
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetMessageTs()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'messageTs' was not found in serialized data! Struct: ");
                sb.append(toString());
                throw new TProtocolException(sb.toString());
            }
            switch (readFieldBegin.id) {
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
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.messageTs = tProtocol.readI64();
                        setMessageTsIsSet(true);
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.topic = tProtocol.readString();
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.aliasName = tProtocol.readString();
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 12) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.request = new XmPushActionSendMessage();
                        this.request.read(tProtocol);
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.category = tProtocol.readString();
                        break;
                    }
                case 11:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.isOnline = tProtocol.readBool();
                        setIsOnlineIsSet(true);
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.regId = tProtocol.readString();
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.callbackUrl = tProtocol.readString();
                        break;
                    }
                case 14:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.userAccount = tProtocol.readString();
                        break;
                    }
                case 15:
                    if (readFieldBegin.type != 6) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.deviceStatus = tProtocol.readI16();
                        setDeviceStatusIsSet(true);
                        break;
                    }
                case 16:
                    if (readFieldBegin.type != 6) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.geoMsgStatus = tProtocol.readI16();
                        setGeoMsgStatusIsSet(true);
                        break;
                    }
                case 20:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.imeiMd5 = tProtocol.readString();
                        break;
                    }
                case 21:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.deviceId = tProtocol.readString();
                        break;
                    }
                case 22:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.passThrough = tProtocol.readI32();
                        setPassThroughIsSet(true);
                        break;
                    }
                case 23:
                    if (readFieldBegin.type != 13) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TMap readMapBegin = tProtocol.readMapBegin();
                        this.extra = new HashMap(readMapBegin.size * 2);
                        for (int i = 0; i < readMapBegin.size; i++) {
                            this.extra.put(tProtocol.readString(), tProtocol.readString());
                        }
                        tProtocol.readMapEnd();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public XmPushActionAckMessage setAliasName(String str) {
        this.aliasName = str;
        return this;
    }

    public XmPushActionAckMessage setAppId(String str) {
        this.appId = str;
        return this;
    }

    public XmPushActionAckMessage setDeviceStatus(short s) {
        this.deviceStatus = s;
        setDeviceStatusIsSet(true);
        return this;
    }

    public void setDeviceStatusIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public void setGeoMsgStatusIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public XmPushActionAckMessage setId(String str) {
        this.id = str;
        return this;
    }

    public void setIsOnlineIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public XmPushActionAckMessage setMessageTs(long j) {
        this.messageTs = j;
        setMessageTsIsSet(true);
        return this;
    }

    public void setMessageTsIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setPassThroughIsSet(boolean z) {
        this.__isset_bit_vector.set(4, z);
    }

    public XmPushActionAckMessage setTopic(String str) {
        this.topic = str;
        return this;
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionAckMessage(");
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
        sb.append(", ");
        sb.append("messageTs:");
        sb.append(this.messageTs);
        if (isSetTopic()) {
            sb.append(", ");
            sb.append("topic:");
            if (this.topic == null) {
                sb.append("null");
            } else {
                sb.append(this.topic);
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
        if (isSetRequest()) {
            sb.append(", ");
            sb.append("request:");
            if (this.request == null) {
                sb.append("null");
            } else {
                sb.append(this.request);
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
        if (isSetCategory()) {
            sb.append(", ");
            sb.append("category:");
            if (this.category == null) {
                sb.append("null");
            } else {
                sb.append(this.category);
            }
        }
        if (isSetIsOnline()) {
            sb.append(", ");
            sb.append("isOnline:");
            sb.append(this.isOnline);
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
        if (isSetCallbackUrl()) {
            sb.append(", ");
            sb.append("callbackUrl:");
            if (this.callbackUrl == null) {
                sb.append("null");
            } else {
                sb.append(this.callbackUrl);
            }
        }
        if (isSetUserAccount()) {
            sb.append(", ");
            sb.append("userAccount:");
            if (this.userAccount == null) {
                sb.append("null");
            } else {
                sb.append(this.userAccount);
            }
        }
        if (isSetDeviceStatus()) {
            sb.append(", ");
            sb.append("deviceStatus:");
            sb.append(this.deviceStatus);
        }
        if (isSetGeoMsgStatus()) {
            sb.append(", ");
            sb.append("geoMsgStatus:");
            sb.append(this.geoMsgStatus);
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
        if (isSetDeviceId()) {
            sb.append(", ");
            sb.append("deviceId:");
            if (this.deviceId == null) {
                sb.append("null");
            } else {
                sb.append(this.deviceId);
            }
        }
        if (isSetPassThrough()) {
            sb.append(", ");
            sb.append("passThrough:");
            sb.append(this.passThrough);
        }
        if (isSetExtra()) {
            sb.append(", ");
            sb.append("extra:");
            if (this.extra == null) {
                sb.append("null");
            } else {
                sb.append(this.extra);
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
        tProtocol.writeFieldBegin(MESSAGE_TS_FIELD_DESC);
        tProtocol.writeI64(this.messageTs);
        tProtocol.writeFieldEnd();
        if (this.topic != null && isSetTopic()) {
            tProtocol.writeFieldBegin(TOPIC_FIELD_DESC);
            tProtocol.writeString(this.topic);
            tProtocol.writeFieldEnd();
        }
        if (this.aliasName != null && isSetAliasName()) {
            tProtocol.writeFieldBegin(ALIAS_NAME_FIELD_DESC);
            tProtocol.writeString(this.aliasName);
            tProtocol.writeFieldEnd();
        }
        if (this.request != null && isSetRequest()) {
            tProtocol.writeFieldBegin(REQUEST_FIELD_DESC);
            this.request.write(tProtocol);
            tProtocol.writeFieldEnd();
        }
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
        if (this.category != null && isSetCategory()) {
            tProtocol.writeFieldBegin(CATEGORY_FIELD_DESC);
            tProtocol.writeString(this.category);
            tProtocol.writeFieldEnd();
        }
        if (isSetIsOnline()) {
            tProtocol.writeFieldBegin(IS_ONLINE_FIELD_DESC);
            tProtocol.writeBool(this.isOnline);
            tProtocol.writeFieldEnd();
        }
        if (this.regId != null && isSetRegId()) {
            tProtocol.writeFieldBegin(REG_ID_FIELD_DESC);
            tProtocol.writeString(this.regId);
            tProtocol.writeFieldEnd();
        }
        if (this.callbackUrl != null && isSetCallbackUrl()) {
            tProtocol.writeFieldBegin(CALLBACK_URL_FIELD_DESC);
            tProtocol.writeString(this.callbackUrl);
            tProtocol.writeFieldEnd();
        }
        if (this.userAccount != null && isSetUserAccount()) {
            tProtocol.writeFieldBegin(USER_ACCOUNT_FIELD_DESC);
            tProtocol.writeString(this.userAccount);
            tProtocol.writeFieldEnd();
        }
        if (isSetDeviceStatus()) {
            tProtocol.writeFieldBegin(DEVICE_STATUS_FIELD_DESC);
            tProtocol.writeI16(this.deviceStatus);
            tProtocol.writeFieldEnd();
        }
        if (isSetGeoMsgStatus()) {
            tProtocol.writeFieldBegin(GEO_MSG_STATUS_FIELD_DESC);
            tProtocol.writeI16(this.geoMsgStatus);
            tProtocol.writeFieldEnd();
        }
        if (this.imeiMd5 != null && isSetImeiMd5()) {
            tProtocol.writeFieldBegin(IMEI_MD5_FIELD_DESC);
            tProtocol.writeString(this.imeiMd5);
            tProtocol.writeFieldEnd();
        }
        if (this.deviceId != null && isSetDeviceId()) {
            tProtocol.writeFieldBegin(DEVICE_ID_FIELD_DESC);
            tProtocol.writeString(this.deviceId);
            tProtocol.writeFieldEnd();
        }
        if (isSetPassThrough()) {
            tProtocol.writeFieldBegin(PASS_THROUGH_FIELD_DESC);
            tProtocol.writeI32(this.passThrough);
            tProtocol.writeFieldEnd();
        }
        if (this.extra != null && isSetExtra()) {
            tProtocol.writeFieldBegin(EXTRA_FIELD_DESC);
            tProtocol.writeMapBegin(new TMap(11, 11, this.extra.size()));
            for (Entry entry : this.extra.entrySet()) {
                tProtocol.writeString((String) entry.getKey());
                tProtocol.writeString((String) entry.getValue());
            }
            tProtocol.writeMapEnd();
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
