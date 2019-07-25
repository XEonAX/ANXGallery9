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

public class XmPushActionUnRegistrationResult implements Serializable, Cloneable, TBase<XmPushActionUnRegistrationResult, Object> {
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField COST_TIME_FIELD_DESC = new TField("", 10, 10);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField ERROR_CODE_FIELD_DESC = new TField("", 10, 6);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 8);
    private static final TField REASON_FIELD_DESC = new TField("", 11, 7);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionUnRegistrationResult");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField UN_REGISTERED_AT_FIELD_DESC = new TField("", 10, 9);
    private BitSet __isset_bit_vector = new BitSet(3);
    public String appId;
    public long costTime;
    public String debug;
    public long errorCode;
    public String id;
    public String packageName;
    public String reason;
    public Target target;
    public long unRegisteredAt;

    public int compareTo(XmPushActionUnRegistrationResult xmPushActionUnRegistrationResult) {
        if (!getClass().equals(xmPushActionUnRegistrationResult.getClass())) {
            return getClass().getName().compareTo(xmPushActionUnRegistrationResult.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionUnRegistrationResult.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionUnRegistrationResult.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionUnRegistrationResult.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionUnRegistrationResult.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetErrorCode()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetErrorCode()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetErrorCode()) {
            int compareTo10 = TBaseHelper.compareTo(this.errorCode, xmPushActionUnRegistrationResult.errorCode);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetReason()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetReason()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetReason()) {
            int compareTo12 = TBaseHelper.compareTo(this.reason, xmPushActionUnRegistrationResult.reason);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetPackageName()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetPackageName()) {
            int compareTo14 = TBaseHelper.compareTo(this.packageName, xmPushActionUnRegistrationResult.packageName);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetUnRegisteredAt()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetUnRegisteredAt()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetUnRegisteredAt()) {
            int compareTo16 = TBaseHelper.compareTo(this.unRegisteredAt, xmPushActionUnRegistrationResult.unRegisteredAt);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetCostTime()).compareTo(Boolean.valueOf(xmPushActionUnRegistrationResult.isSetCostTime()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetCostTime()) {
            int compareTo18 = TBaseHelper.compareTo(this.costTime, xmPushActionUnRegistrationResult.costTime);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionUnRegistrationResult xmPushActionUnRegistrationResult) {
        if (xmPushActionUnRegistrationResult == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionUnRegistrationResult.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionUnRegistrationResult.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionUnRegistrationResult.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionUnRegistrationResult.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionUnRegistrationResult.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionUnRegistrationResult.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionUnRegistrationResult.isSetAppId();
        if (((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionUnRegistrationResult.appId))) || this.errorCode != xmPushActionUnRegistrationResult.errorCode) {
            return false;
        }
        boolean isSetReason = isSetReason();
        boolean isSetReason2 = xmPushActionUnRegistrationResult.isSetReason();
        if ((isSetReason || isSetReason2) && (!isSetReason || !isSetReason2 || !this.reason.equals(xmPushActionUnRegistrationResult.reason))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionUnRegistrationResult.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionUnRegistrationResult.packageName))) {
            return false;
        }
        boolean isSetUnRegisteredAt = isSetUnRegisteredAt();
        boolean isSetUnRegisteredAt2 = xmPushActionUnRegistrationResult.isSetUnRegisteredAt();
        if ((isSetUnRegisteredAt || isSetUnRegisteredAt2) && (!isSetUnRegisteredAt || !isSetUnRegisteredAt2 || this.unRegisteredAt != xmPushActionUnRegistrationResult.unRegisteredAt)) {
            return false;
        }
        boolean isSetCostTime = isSetCostTime();
        boolean isSetCostTime2 = xmPushActionUnRegistrationResult.isSetCostTime();
        return (!isSetCostTime && !isSetCostTime2) || (isSetCostTime && isSetCostTime2 && this.costTime == xmPushActionUnRegistrationResult.costTime);
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionUnRegistrationResult)) {
            return equals((XmPushActionUnRegistrationResult) obj);
        }
        return false;
    }

    public String getPackageName() {
        return this.packageName;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAppId() {
        return this.appId != null;
    }

    public boolean isSetCostTime() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetDebug() {
        return this.debug != null;
    }

    public boolean isSetErrorCode() {
        return this.__isset_bit_vector.get(0);
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

    public boolean isSetUnRegisteredAt() {
        return this.__isset_bit_vector.get(1);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetErrorCode()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'errorCode' was not found in serialized data! Struct: ");
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
                case 6:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.errorCode = tProtocol.readI64();
                        setErrorCodeIsSet(true);
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.reason = tProtocol.readString();
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
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.unRegisteredAt = tProtocol.readI64();
                        setUnRegisteredAtIsSet(true);
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.costTime = tProtocol.readI64();
                        setCostTimeIsSet(true);
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setCostTimeIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public void setErrorCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setUnRegisteredAtIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionUnRegistrationResult(");
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
        sb.append("errorCode:");
        sb.append(this.errorCode);
        if (isSetReason()) {
            sb.append(", ");
            sb.append("reason:");
            if (this.reason == null) {
                sb.append("null");
            } else {
                sb.append(this.reason);
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
        if (isSetUnRegisteredAt()) {
            sb.append(", ");
            sb.append("unRegisteredAt:");
            sb.append(this.unRegisteredAt);
        }
        if (isSetCostTime()) {
            sb.append(", ");
            sb.append("costTime:");
            sb.append(this.costTime);
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
        tProtocol.writeFieldBegin(ERROR_CODE_FIELD_DESC);
        tProtocol.writeI64(this.errorCode);
        tProtocol.writeFieldEnd();
        if (this.reason != null && isSetReason()) {
            tProtocol.writeFieldBegin(REASON_FIELD_DESC);
            tProtocol.writeString(this.reason);
            tProtocol.writeFieldEnd();
        }
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
        if (isSetUnRegisteredAt()) {
            tProtocol.writeFieldBegin(UN_REGISTERED_AT_FIELD_DESC);
            tProtocol.writeI64(this.unRegisteredAt);
            tProtocol.writeFieldEnd();
        }
        if (isSetCostTime()) {
            tProtocol.writeFieldBegin(COST_TIME_FIELD_DESC);
            tProtocol.writeI64(this.costTime);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
