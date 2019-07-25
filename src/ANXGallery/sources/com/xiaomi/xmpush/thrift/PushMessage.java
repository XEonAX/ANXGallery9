package com.xiaomi.xmpush.thrift;

import java.io.Serializable;
import java.util.BitSet;
import org.apache.thrift.TBase;
import org.apache.thrift.TBaseHelper;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;

public class PushMessage implements Serializable, Cloneable, TBase<PushMessage, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 13);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 10);
    private static final TField COLLAPSE_KEY_FIELD_DESC = new TField("", 11, 7);
    private static final TField CREATE_AT_FIELD_DESC = new TField("", 10, 5);
    private static final TField DEVICE_ID_FIELD_DESC = new TField("", 11, 21);
    private static final TField ID_FIELD_DESC = new TField("", 11, 2);
    private static final TField IMEI_MD5_FIELD_DESC = new TField("", 11, 20);
    private static final TField IS_ONLINE_FIELD_DESC = new TField("", 2, 14);
    private static final TField META_INFO_FIELD_DESC = new TField("", 12, 12);
    private static final TField MIID_FIELD_DESC = new TField("", 10, 16);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 8);
    private static final TField PAYLOAD_FIELD_DESC = new TField("", 11, 4);
    private static final TField REG_ID_FIELD_DESC = new TField("", 11, 9);
    private static final TStruct STRUCT_DESC = new TStruct("PushMessage");
    private static final TField TOPIC_FIELD_DESC = new TField("", 11, 11);
    private static final TField TO_FIELD_DESC = new TField("", 12, 1);
    private static final TField TTL_FIELD_DESC = new TField("", 10, 6);
    private static final TField USER_ACCOUNT_FIELD_DESC = new TField("", 11, 15);
    private BitSet __isset_bit_vector = new BitSet(4);
    public String aliasName;
    public String appId;
    public String category;
    public String collapseKey;
    public long createAt;
    public String deviceId;
    public String id;
    public String imeiMd5;
    public boolean isOnline = false;
    public PushMetaInfo metaInfo;
    public long miid;
    public String packageName;
    public String payload;
    public String regId;
    public Target to;
    public String topic;
    public long ttl;
    public String userAccount;

    public int compareTo(PushMessage pushMessage) {
        if (!getClass().equals(pushMessage.getClass())) {
            return getClass().getName().compareTo(pushMessage.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetTo()).compareTo(Boolean.valueOf(pushMessage.isSetTo()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetTo()) {
            int compareTo2 = TBaseHelper.compareTo((Comparable) this.to, (Comparable) pushMessage.to);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(pushMessage.isSetId()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetId()) {
            int compareTo4 = TBaseHelper.compareTo(this.id, pushMessage.id);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(pushMessage.isSetAppId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetAppId()) {
            int compareTo6 = TBaseHelper.compareTo(this.appId, pushMessage.appId);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetPayload()).compareTo(Boolean.valueOf(pushMessage.isSetPayload()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetPayload()) {
            int compareTo8 = TBaseHelper.compareTo(this.payload, pushMessage.payload);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetCreateAt()).compareTo(Boolean.valueOf(pushMessage.isSetCreateAt()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetCreateAt()) {
            int compareTo10 = TBaseHelper.compareTo(this.createAt, pushMessage.createAt);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetTtl()).compareTo(Boolean.valueOf(pushMessage.isSetTtl()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetTtl()) {
            int compareTo12 = TBaseHelper.compareTo(this.ttl, pushMessage.ttl);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetCollapseKey()).compareTo(Boolean.valueOf(pushMessage.isSetCollapseKey()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetCollapseKey()) {
            int compareTo14 = TBaseHelper.compareTo(this.collapseKey, pushMessage.collapseKey);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(pushMessage.isSetPackageName()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetPackageName()) {
            int compareTo16 = TBaseHelper.compareTo(this.packageName, pushMessage.packageName);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetRegId()).compareTo(Boolean.valueOf(pushMessage.isSetRegId()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetRegId()) {
            int compareTo18 = TBaseHelper.compareTo(this.regId, pushMessage.regId);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(pushMessage.isSetCategory()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetCategory()) {
            int compareTo20 = TBaseHelper.compareTo(this.category, pushMessage.category);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetTopic()).compareTo(Boolean.valueOf(pushMessage.isSetTopic()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetTopic()) {
            int compareTo22 = TBaseHelper.compareTo(this.topic, pushMessage.topic);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetMetaInfo()).compareTo(Boolean.valueOf(pushMessage.isSetMetaInfo()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetMetaInfo()) {
            int compareTo24 = TBaseHelper.compareTo((Comparable) this.metaInfo, (Comparable) pushMessage.metaInfo);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(pushMessage.isSetAliasName()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetAliasName()) {
            int compareTo26 = TBaseHelper.compareTo(this.aliasName, pushMessage.aliasName);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        int compareTo27 = Boolean.valueOf(isSetIsOnline()).compareTo(Boolean.valueOf(pushMessage.isSetIsOnline()));
        if (compareTo27 != 0) {
            return compareTo27;
        }
        if (isSetIsOnline()) {
            int compareTo28 = TBaseHelper.compareTo(this.isOnline, pushMessage.isOnline);
            if (compareTo28 != 0) {
                return compareTo28;
            }
        }
        int compareTo29 = Boolean.valueOf(isSetUserAccount()).compareTo(Boolean.valueOf(pushMessage.isSetUserAccount()));
        if (compareTo29 != 0) {
            return compareTo29;
        }
        if (isSetUserAccount()) {
            int compareTo30 = TBaseHelper.compareTo(this.userAccount, pushMessage.userAccount);
            if (compareTo30 != 0) {
                return compareTo30;
            }
        }
        int compareTo31 = Boolean.valueOf(isSetMiid()).compareTo(Boolean.valueOf(pushMessage.isSetMiid()));
        if (compareTo31 != 0) {
            return compareTo31;
        }
        if (isSetMiid()) {
            int compareTo32 = TBaseHelper.compareTo(this.miid, pushMessage.miid);
            if (compareTo32 != 0) {
                return compareTo32;
            }
        }
        int compareTo33 = Boolean.valueOf(isSetImeiMd5()).compareTo(Boolean.valueOf(pushMessage.isSetImeiMd5()));
        if (compareTo33 != 0) {
            return compareTo33;
        }
        if (isSetImeiMd5()) {
            int compareTo34 = TBaseHelper.compareTo(this.imeiMd5, pushMessage.imeiMd5);
            if (compareTo34 != 0) {
                return compareTo34;
            }
        }
        int compareTo35 = Boolean.valueOf(isSetDeviceId()).compareTo(Boolean.valueOf(pushMessage.isSetDeviceId()));
        if (compareTo35 != 0) {
            return compareTo35;
        }
        if (isSetDeviceId()) {
            int compareTo36 = TBaseHelper.compareTo(this.deviceId, pushMessage.deviceId);
            if (compareTo36 != 0) {
                return compareTo36;
            }
        }
        return 0;
    }

    public boolean equals(PushMessage pushMessage) {
        if (pushMessage == null) {
            return false;
        }
        boolean isSetTo = isSetTo();
        boolean isSetTo2 = pushMessage.isSetTo();
        if ((isSetTo || isSetTo2) && (!isSetTo || !isSetTo2 || !this.to.equals(pushMessage.to))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = pushMessage.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(pushMessage.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = pushMessage.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(pushMessage.appId))) {
            return false;
        }
        boolean isSetPayload = isSetPayload();
        boolean isSetPayload2 = pushMessage.isSetPayload();
        if ((isSetPayload || isSetPayload2) && (!isSetPayload || !isSetPayload2 || !this.payload.equals(pushMessage.payload))) {
            return false;
        }
        boolean isSetCreateAt = isSetCreateAt();
        boolean isSetCreateAt2 = pushMessage.isSetCreateAt();
        if ((isSetCreateAt || isSetCreateAt2) && (!isSetCreateAt || !isSetCreateAt2 || this.createAt != pushMessage.createAt)) {
            return false;
        }
        boolean isSetTtl = isSetTtl();
        boolean isSetTtl2 = pushMessage.isSetTtl();
        if ((isSetTtl || isSetTtl2) && (!isSetTtl || !isSetTtl2 || this.ttl != pushMessage.ttl)) {
            return false;
        }
        boolean isSetCollapseKey = isSetCollapseKey();
        boolean isSetCollapseKey2 = pushMessage.isSetCollapseKey();
        if ((isSetCollapseKey || isSetCollapseKey2) && (!isSetCollapseKey || !isSetCollapseKey2 || !this.collapseKey.equals(pushMessage.collapseKey))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = pushMessage.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(pushMessage.packageName))) {
            return false;
        }
        boolean isSetRegId = isSetRegId();
        boolean isSetRegId2 = pushMessage.isSetRegId();
        if ((isSetRegId || isSetRegId2) && (!isSetRegId || !isSetRegId2 || !this.regId.equals(pushMessage.regId))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = pushMessage.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(pushMessage.category))) {
            return false;
        }
        boolean isSetTopic = isSetTopic();
        boolean isSetTopic2 = pushMessage.isSetTopic();
        if ((isSetTopic || isSetTopic2) && (!isSetTopic || !isSetTopic2 || !this.topic.equals(pushMessage.topic))) {
            return false;
        }
        boolean isSetMetaInfo = isSetMetaInfo();
        boolean isSetMetaInfo2 = pushMessage.isSetMetaInfo();
        if ((isSetMetaInfo || isSetMetaInfo2) && (!isSetMetaInfo || !isSetMetaInfo2 || !this.metaInfo.equals(pushMessage.metaInfo))) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = pushMessage.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(pushMessage.aliasName))) {
            return false;
        }
        boolean isSetIsOnline = isSetIsOnline();
        boolean isSetIsOnline2 = pushMessage.isSetIsOnline();
        if ((isSetIsOnline || isSetIsOnline2) && (!isSetIsOnline || !isSetIsOnline2 || this.isOnline != pushMessage.isOnline)) {
            return false;
        }
        boolean isSetUserAccount = isSetUserAccount();
        boolean isSetUserAccount2 = pushMessage.isSetUserAccount();
        if ((isSetUserAccount || isSetUserAccount2) && (!isSetUserAccount || !isSetUserAccount2 || !this.userAccount.equals(pushMessage.userAccount))) {
            return false;
        }
        boolean isSetMiid = isSetMiid();
        boolean isSetMiid2 = pushMessage.isSetMiid();
        if ((isSetMiid || isSetMiid2) && (!isSetMiid || !isSetMiid2 || this.miid != pushMessage.miid)) {
            return false;
        }
        boolean isSetImeiMd5 = isSetImeiMd5();
        boolean isSetImeiMd52 = pushMessage.isSetImeiMd5();
        if ((isSetImeiMd5 || isSetImeiMd52) && (!isSetImeiMd5 || !isSetImeiMd52 || !this.imeiMd5.equals(pushMessage.imeiMd5))) {
            return false;
        }
        boolean isSetDeviceId = isSetDeviceId();
        boolean isSetDeviceId2 = pushMessage.isSetDeviceId();
        return (!isSetDeviceId && !isSetDeviceId2) || (isSetDeviceId && isSetDeviceId2 && this.deviceId.equals(pushMessage.deviceId));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof PushMessage)) {
            return equals((PushMessage) obj);
        }
        return false;
    }

    public String getAppId() {
        return this.appId;
    }

    public long getCreateAt() {
        return this.createAt;
    }

    public String getId() {
        return this.id;
    }

    public String getPayload() {
        return this.payload;
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

    public boolean isSetCategory() {
        return this.category != null;
    }

    public boolean isSetCollapseKey() {
        return this.collapseKey != null;
    }

    public boolean isSetCreateAt() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetDeviceId() {
        return this.deviceId != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetImeiMd5() {
        return this.imeiMd5 != null;
    }

    public boolean isSetIsOnline() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetMetaInfo() {
        return this.metaInfo != null;
    }

    public boolean isSetMiid() {
        return this.__isset_bit_vector.get(3);
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetPayload() {
        return this.payload != null;
    }

    public boolean isSetRegId() {
        return this.regId != null;
    }

    public boolean isSetTo() {
        return this.to != null;
    }

    public boolean isSetTopic() {
        return this.topic != null;
    }

    public boolean isSetTtl() {
        return this.__isset_bit_vector.get(1);
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
                validate();
                return;
            }
            switch (readFieldBegin.id) {
                case 1:
                    if (readFieldBegin.type != 12) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.to = new Target();
                        this.to.read(tProtocol);
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.id = tProtocol.readString();
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appId = tProtocol.readString();
                        break;
                    }
                case 4:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.payload = tProtocol.readString();
                        break;
                    }
                case 5:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.createAt = tProtocol.readI64();
                        setCreateAtIsSet(true);
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.ttl = tProtocol.readI64();
                        setTtlIsSet(true);
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.collapseKey = tProtocol.readString();
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.regId = tProtocol.readString();
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
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.topic = tProtocol.readString();
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 12) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.metaInfo = new PushMetaInfo();
                        this.metaInfo.read(tProtocol);
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.aliasName = tProtocol.readString();
                        break;
                    }
                case 14:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.isOnline = tProtocol.readBool();
                        setIsOnlineIsSet(true);
                        break;
                    }
                case 15:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.userAccount = tProtocol.readString();
                        break;
                    }
                case 16:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.miid = tProtocol.readI64();
                        setMiidIsSet(true);
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
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setCreateAtIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setIsOnlineIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public void setMiidIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public void setTtlIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("PushMessage(");
        if (isSetTo()) {
            sb.append("to:");
            if (this.to == null) {
                sb.append("null");
            } else {
                sb.append(this.to);
            }
            z = false;
        } else {
            z = true;
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
        sb.append("payload:");
        if (this.payload == null) {
            sb.append("null");
        } else {
            sb.append(this.payload);
        }
        if (isSetCreateAt()) {
            sb.append(", ");
            sb.append("createAt:");
            sb.append(this.createAt);
        }
        if (isSetTtl()) {
            sb.append(", ");
            sb.append("ttl:");
            sb.append(this.ttl);
        }
        if (isSetCollapseKey()) {
            sb.append(", ");
            sb.append("collapseKey:");
            if (this.collapseKey == null) {
                sb.append("null");
            } else {
                sb.append(this.collapseKey);
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
        if (isSetRegId()) {
            sb.append(", ");
            sb.append("regId:");
            if (this.regId == null) {
                sb.append("null");
            } else {
                sb.append(this.regId);
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
        if (isSetTopic()) {
            sb.append(", ");
            sb.append("topic:");
            if (this.topic == null) {
                sb.append("null");
            } else {
                sb.append(this.topic);
            }
        }
        if (isSetMetaInfo()) {
            sb.append(", ");
            sb.append("metaInfo:");
            if (this.metaInfo == null) {
                sb.append("null");
            } else {
                sb.append(this.metaInfo);
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
        if (isSetIsOnline()) {
            sb.append(", ");
            sb.append("isOnline:");
            sb.append(this.isOnline);
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
        if (isSetMiid()) {
            sb.append(", ");
            sb.append("miid:");
            sb.append(this.miid);
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
        } else if (this.payload == null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Required field 'payload' was not present! Struct: ");
            sb3.append(toString());
            throw new TProtocolException(sb3.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        if (this.to != null && isSetTo()) {
            tProtocol.writeFieldBegin(TO_FIELD_DESC);
            this.to.write(tProtocol);
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
        if (this.payload != null) {
            tProtocol.writeFieldBegin(PAYLOAD_FIELD_DESC);
            tProtocol.writeString(this.payload);
            tProtocol.writeFieldEnd();
        }
        if (isSetCreateAt()) {
            tProtocol.writeFieldBegin(CREATE_AT_FIELD_DESC);
            tProtocol.writeI64(this.createAt);
            tProtocol.writeFieldEnd();
        }
        if (isSetTtl()) {
            tProtocol.writeFieldBegin(TTL_FIELD_DESC);
            tProtocol.writeI64(this.ttl);
            tProtocol.writeFieldEnd();
        }
        if (this.collapseKey != null && isSetCollapseKey()) {
            tProtocol.writeFieldBegin(COLLAPSE_KEY_FIELD_DESC);
            tProtocol.writeString(this.collapseKey);
            tProtocol.writeFieldEnd();
        }
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
        if (this.regId != null && isSetRegId()) {
            tProtocol.writeFieldBegin(REG_ID_FIELD_DESC);
            tProtocol.writeString(this.regId);
            tProtocol.writeFieldEnd();
        }
        if (this.category != null && isSetCategory()) {
            tProtocol.writeFieldBegin(CATEGORY_FIELD_DESC);
            tProtocol.writeString(this.category);
            tProtocol.writeFieldEnd();
        }
        if (this.topic != null && isSetTopic()) {
            tProtocol.writeFieldBegin(TOPIC_FIELD_DESC);
            tProtocol.writeString(this.topic);
            tProtocol.writeFieldEnd();
        }
        if (this.metaInfo != null && isSetMetaInfo()) {
            tProtocol.writeFieldBegin(META_INFO_FIELD_DESC);
            this.metaInfo.write(tProtocol);
            tProtocol.writeFieldEnd();
        }
        if (this.aliasName != null && isSetAliasName()) {
            tProtocol.writeFieldBegin(ALIAS_NAME_FIELD_DESC);
            tProtocol.writeString(this.aliasName);
            tProtocol.writeFieldEnd();
        }
        if (isSetIsOnline()) {
            tProtocol.writeFieldBegin(IS_ONLINE_FIELD_DESC);
            tProtocol.writeBool(this.isOnline);
            tProtocol.writeFieldEnd();
        }
        if (this.userAccount != null && isSetUserAccount()) {
            tProtocol.writeFieldBegin(USER_ACCOUNT_FIELD_DESC);
            tProtocol.writeString(this.userAccount);
            tProtocol.writeFieldEnd();
        }
        if (isSetMiid()) {
            tProtocol.writeFieldBegin(MIID_FIELD_DESC);
            tProtocol.writeI64(this.miid);
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
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
