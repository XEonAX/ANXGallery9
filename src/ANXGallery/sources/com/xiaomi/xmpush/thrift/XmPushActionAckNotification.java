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

public class XmPushActionAckNotification implements Serializable, Cloneable, TBase<XmPushActionAckNotification, Object> {
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 11);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField ERROR_CODE_FIELD_DESC = new TField("", 10, 7);
    private static final TField EXTRA_FIELD_DESC = new TField("", 13, 9);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 10);
    private static final TField REASON_FIELD_DESC = new TField("", 11, 8);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionAckNotification");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TYPE_FIELD_DESC = new TField("", 11, 5);
    private BitSet __isset_bit_vector = new BitSet(1);
    public String appId;
    public String category;
    public String debug;
    public long errorCode = 0;
    public Map<String, String> extra;
    public String id;
    public String packageName;
    public String reason;
    public Target target;
    public String type;

    public int compareTo(XmPushActionAckNotification xmPushActionAckNotification) {
        if (!getClass().equals(xmPushActionAckNotification.getClass())) {
            return getClass().getName().compareTo(xmPushActionAckNotification.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionAckNotification.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionAckNotification.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionAckNotification.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionAckNotification.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetType()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetType()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetType()) {
            int compareTo10 = TBaseHelper.compareTo(this.type, xmPushActionAckNotification.type);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetErrorCode()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetErrorCode()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetErrorCode()) {
            int compareTo12 = TBaseHelper.compareTo(this.errorCode, xmPushActionAckNotification.errorCode);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetReason()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetReason()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetReason()) {
            int compareTo14 = TBaseHelper.compareTo(this.reason, xmPushActionAckNotification.reason);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetExtra()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetExtra()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetExtra()) {
            int compareTo16 = TBaseHelper.compareTo((Map) this.extra, (Map) xmPushActionAckNotification.extra);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetPackageName()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetPackageName()) {
            int compareTo18 = TBaseHelper.compareTo(this.packageName, xmPushActionAckNotification.packageName);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionAckNotification.isSetCategory()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetCategory()) {
            int compareTo20 = TBaseHelper.compareTo(this.category, xmPushActionAckNotification.category);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionAckNotification xmPushActionAckNotification) {
        if (xmPushActionAckNotification == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionAckNotification.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionAckNotification.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionAckNotification.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionAckNotification.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionAckNotification.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionAckNotification.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionAckNotification.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionAckNotification.appId))) {
            return false;
        }
        boolean isSetType = isSetType();
        boolean isSetType2 = xmPushActionAckNotification.isSetType();
        if ((isSetType || isSetType2) && (!isSetType || !isSetType2 || !this.type.equals(xmPushActionAckNotification.type))) {
            return false;
        }
        boolean isSetErrorCode = isSetErrorCode();
        boolean isSetErrorCode2 = xmPushActionAckNotification.isSetErrorCode();
        if ((isSetErrorCode || isSetErrorCode2) && (!isSetErrorCode || !isSetErrorCode2 || this.errorCode != xmPushActionAckNotification.errorCode)) {
            return false;
        }
        boolean isSetReason = isSetReason();
        boolean isSetReason2 = xmPushActionAckNotification.isSetReason();
        if ((isSetReason || isSetReason2) && (!isSetReason || !isSetReason2 || !this.reason.equals(xmPushActionAckNotification.reason))) {
            return false;
        }
        boolean isSetExtra = isSetExtra();
        boolean isSetExtra2 = xmPushActionAckNotification.isSetExtra();
        if ((isSetExtra || isSetExtra2) && (!isSetExtra || !isSetExtra2 || !this.extra.equals(xmPushActionAckNotification.extra))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionAckNotification.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionAckNotification.packageName))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionAckNotification.isSetCategory();
        return (!isSetCategory && !isSetCategory2) || (isSetCategory && isSetCategory2 && this.category.equals(xmPushActionAckNotification.category));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionAckNotification)) {
            return equals((XmPushActionAckNotification) obj);
        }
        return false;
    }

    public Map<String, String> getExtra() {
        return this.extra;
    }

    public String getId() {
        return this.id;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAppId() {
        return this.appId != null;
    }

    public boolean isSetCategory() {
        return this.category != null;
    }

    public boolean isSetDebug() {
        return this.debug != null;
    }

    public boolean isSetErrorCode() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetExtra() {
        return this.extra != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetReason() {
        return this.reason != null;
    }

    public boolean isSetTarget() {
        return this.target != null;
    }

    public boolean isSetType() {
        return this.type != null;
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
                        this.type = tProtocol.readString();
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.errorCode = tProtocol.readI64();
                        setErrorCodeIsSet(true);
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.reason = tProtocol.readString();
                        break;
                    }
                case 9:
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
                case 10:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 11:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.category = tProtocol.readString();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setErrorCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionAckNotification(");
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
        if (isSetAppId()) {
            sb.append(", ");
            sb.append("appId:");
            if (this.appId == null) {
                sb.append("null");
            } else {
                sb.append(this.appId);
            }
        }
        if (isSetType()) {
            sb.append(", ");
            sb.append("type:");
            if (this.type == null) {
                sb.append("null");
            } else {
                sb.append(this.type);
            }
        }
        if (isSetErrorCode()) {
            sb.append(", ");
            sb.append("errorCode:");
            sb.append(this.errorCode);
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
        if (isSetExtra()) {
            sb.append(", ");
            sb.append("extra:");
            if (this.extra == null) {
                sb.append("null");
            } else {
                sb.append(this.extra);
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
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.id == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'id' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
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
        if (this.appId != null && isSetAppId()) {
            tProtocol.writeFieldBegin(APP_ID_FIELD_DESC);
            tProtocol.writeString(this.appId);
            tProtocol.writeFieldEnd();
        }
        if (this.type != null && isSetType()) {
            tProtocol.writeFieldBegin(TYPE_FIELD_DESC);
            tProtocol.writeString(this.type);
            tProtocol.writeFieldEnd();
        }
        if (isSetErrorCode()) {
            tProtocol.writeFieldBegin(ERROR_CODE_FIELD_DESC);
            tProtocol.writeI64(this.errorCode);
            tProtocol.writeFieldEnd();
        }
        if (this.reason != null && isSetReason()) {
            tProtocol.writeFieldBegin(REASON_FIELD_DESC);
            tProtocol.writeString(this.reason);
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
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
