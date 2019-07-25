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

public class XmPushActionRegistrationResult implements Serializable, Cloneable, TBase<XmPushActionRegistrationResult, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 12);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField APP_VERSION_CODE_FIELD_DESC = new TField("", 8, 18);
    private static final TField APP_VERSION_FIELD_DESC = new TField("", 11, 15);
    private static final TField CLIENT_ID_FIELD_DESC = new TField("", 11, 13);
    private static final TField COST_TIME_FIELD_DESC = new TField("", 10, 14);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField ERROR_CODE_FIELD_DESC = new TField("", 10, 6);
    private static final TField HYBRID_PUSH_ENDPOINT_FIELD_DESC = new TField("", 11, 17);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 10);
    private static final TField PUSH_SDK_VERSION_CODE_FIELD_DESC = new TField("", 8, 16);
    private static final TField REASON_FIELD_DESC = new TField("", 11, 7);
    private static final TField REGION_FIELD_DESC = new TField("", 11, 19);
    private static final TField REGISTERED_AT_FIELD_DESC = new TField("", 10, 11);
    private static final TField REG_ID_FIELD_DESC = new TField("", 11, 8);
    private static final TField REG_SECRET_FIELD_DESC = new TField("", 11, 9);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionRegistrationResult");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private BitSet __isset_bit_vector = new BitSet(5);
    public String aliasName;
    public String appId;
    public String appVersion;
    public int appVersionCode;
    public String clientId;
    public long costTime;
    public String debug;
    public long errorCode;
    public String hybridPushEndpoint;
    public String id;
    public String packageName;
    public int pushSdkVersionCode;
    public String reason;
    public String regId;
    public String regSecret;
    public String region;
    public long registeredAt;
    public Target target;

    public int compareTo(XmPushActionRegistrationResult xmPushActionRegistrationResult) {
        if (!getClass().equals(xmPushActionRegistrationResult.getClass())) {
            return getClass().getName().compareTo(xmPushActionRegistrationResult.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionRegistrationResult.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionRegistrationResult.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionRegistrationResult.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionRegistrationResult.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetErrorCode()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetErrorCode()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetErrorCode()) {
            int compareTo10 = TBaseHelper.compareTo(this.errorCode, xmPushActionRegistrationResult.errorCode);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetReason()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetReason()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetReason()) {
            int compareTo12 = TBaseHelper.compareTo(this.reason, xmPushActionRegistrationResult.reason);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetRegId()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetRegId()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetRegId()) {
            int compareTo14 = TBaseHelper.compareTo(this.regId, xmPushActionRegistrationResult.regId);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetRegSecret()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetRegSecret()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetRegSecret()) {
            int compareTo16 = TBaseHelper.compareTo(this.regSecret, xmPushActionRegistrationResult.regSecret);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetPackageName()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetPackageName()) {
            int compareTo18 = TBaseHelper.compareTo(this.packageName, xmPushActionRegistrationResult.packageName);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetRegisteredAt()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetRegisteredAt()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetRegisteredAt()) {
            int compareTo20 = TBaseHelper.compareTo(this.registeredAt, xmPushActionRegistrationResult.registeredAt);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetAliasName()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetAliasName()) {
            int compareTo22 = TBaseHelper.compareTo(this.aliasName, xmPushActionRegistrationResult.aliasName);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetClientId()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetClientId()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetClientId()) {
            int compareTo24 = TBaseHelper.compareTo(this.clientId, xmPushActionRegistrationResult.clientId);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetCostTime()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetCostTime()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetCostTime()) {
            int compareTo26 = TBaseHelper.compareTo(this.costTime, xmPushActionRegistrationResult.costTime);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        int compareTo27 = Boolean.valueOf(isSetAppVersion()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetAppVersion()));
        if (compareTo27 != 0) {
            return compareTo27;
        }
        if (isSetAppVersion()) {
            int compareTo28 = TBaseHelper.compareTo(this.appVersion, xmPushActionRegistrationResult.appVersion);
            if (compareTo28 != 0) {
                return compareTo28;
            }
        }
        int compareTo29 = Boolean.valueOf(isSetPushSdkVersionCode()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetPushSdkVersionCode()));
        if (compareTo29 != 0) {
            return compareTo29;
        }
        if (isSetPushSdkVersionCode()) {
            int compareTo30 = TBaseHelper.compareTo(this.pushSdkVersionCode, xmPushActionRegistrationResult.pushSdkVersionCode);
            if (compareTo30 != 0) {
                return compareTo30;
            }
        }
        int compareTo31 = Boolean.valueOf(isSetHybridPushEndpoint()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetHybridPushEndpoint()));
        if (compareTo31 != 0) {
            return compareTo31;
        }
        if (isSetHybridPushEndpoint()) {
            int compareTo32 = TBaseHelper.compareTo(this.hybridPushEndpoint, xmPushActionRegistrationResult.hybridPushEndpoint);
            if (compareTo32 != 0) {
                return compareTo32;
            }
        }
        int compareTo33 = Boolean.valueOf(isSetAppVersionCode()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetAppVersionCode()));
        if (compareTo33 != 0) {
            return compareTo33;
        }
        if (isSetAppVersionCode()) {
            int compareTo34 = TBaseHelper.compareTo(this.appVersionCode, xmPushActionRegistrationResult.appVersionCode);
            if (compareTo34 != 0) {
                return compareTo34;
            }
        }
        int compareTo35 = Boolean.valueOf(isSetRegion()).compareTo(Boolean.valueOf(xmPushActionRegistrationResult.isSetRegion()));
        if (compareTo35 != 0) {
            return compareTo35;
        }
        if (isSetRegion()) {
            int compareTo36 = TBaseHelper.compareTo(this.region, xmPushActionRegistrationResult.region);
            if (compareTo36 != 0) {
                return compareTo36;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionRegistrationResult xmPushActionRegistrationResult) {
        if (xmPushActionRegistrationResult == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionRegistrationResult.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionRegistrationResult.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionRegistrationResult.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionRegistrationResult.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionRegistrationResult.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionRegistrationResult.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionRegistrationResult.isSetAppId();
        if (((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionRegistrationResult.appId))) || this.errorCode != xmPushActionRegistrationResult.errorCode) {
            return false;
        }
        boolean isSetReason = isSetReason();
        boolean isSetReason2 = xmPushActionRegistrationResult.isSetReason();
        if ((isSetReason || isSetReason2) && (!isSetReason || !isSetReason2 || !this.reason.equals(xmPushActionRegistrationResult.reason))) {
            return false;
        }
        boolean isSetRegId = isSetRegId();
        boolean isSetRegId2 = xmPushActionRegistrationResult.isSetRegId();
        if ((isSetRegId || isSetRegId2) && (!isSetRegId || !isSetRegId2 || !this.regId.equals(xmPushActionRegistrationResult.regId))) {
            return false;
        }
        boolean isSetRegSecret = isSetRegSecret();
        boolean isSetRegSecret2 = xmPushActionRegistrationResult.isSetRegSecret();
        if ((isSetRegSecret || isSetRegSecret2) && (!isSetRegSecret || !isSetRegSecret2 || !this.regSecret.equals(xmPushActionRegistrationResult.regSecret))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionRegistrationResult.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionRegistrationResult.packageName))) {
            return false;
        }
        boolean isSetRegisteredAt = isSetRegisteredAt();
        boolean isSetRegisteredAt2 = xmPushActionRegistrationResult.isSetRegisteredAt();
        if ((isSetRegisteredAt || isSetRegisteredAt2) && (!isSetRegisteredAt || !isSetRegisteredAt2 || this.registeredAt != xmPushActionRegistrationResult.registeredAt)) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = xmPushActionRegistrationResult.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(xmPushActionRegistrationResult.aliasName))) {
            return false;
        }
        boolean isSetClientId = isSetClientId();
        boolean isSetClientId2 = xmPushActionRegistrationResult.isSetClientId();
        if ((isSetClientId || isSetClientId2) && (!isSetClientId || !isSetClientId2 || !this.clientId.equals(xmPushActionRegistrationResult.clientId))) {
            return false;
        }
        boolean isSetCostTime = isSetCostTime();
        boolean isSetCostTime2 = xmPushActionRegistrationResult.isSetCostTime();
        if ((isSetCostTime || isSetCostTime2) && (!isSetCostTime || !isSetCostTime2 || this.costTime != xmPushActionRegistrationResult.costTime)) {
            return false;
        }
        boolean isSetAppVersion = isSetAppVersion();
        boolean isSetAppVersion2 = xmPushActionRegistrationResult.isSetAppVersion();
        if ((isSetAppVersion || isSetAppVersion2) && (!isSetAppVersion || !isSetAppVersion2 || !this.appVersion.equals(xmPushActionRegistrationResult.appVersion))) {
            return false;
        }
        boolean isSetPushSdkVersionCode = isSetPushSdkVersionCode();
        boolean isSetPushSdkVersionCode2 = xmPushActionRegistrationResult.isSetPushSdkVersionCode();
        if ((isSetPushSdkVersionCode || isSetPushSdkVersionCode2) && (!isSetPushSdkVersionCode || !isSetPushSdkVersionCode2 || this.pushSdkVersionCode != xmPushActionRegistrationResult.pushSdkVersionCode)) {
            return false;
        }
        boolean isSetHybridPushEndpoint = isSetHybridPushEndpoint();
        boolean isSetHybridPushEndpoint2 = xmPushActionRegistrationResult.isSetHybridPushEndpoint();
        if ((isSetHybridPushEndpoint || isSetHybridPushEndpoint2) && (!isSetHybridPushEndpoint || !isSetHybridPushEndpoint2 || !this.hybridPushEndpoint.equals(xmPushActionRegistrationResult.hybridPushEndpoint))) {
            return false;
        }
        boolean isSetAppVersionCode = isSetAppVersionCode();
        boolean isSetAppVersionCode2 = xmPushActionRegistrationResult.isSetAppVersionCode();
        if ((isSetAppVersionCode || isSetAppVersionCode2) && (!isSetAppVersionCode || !isSetAppVersionCode2 || this.appVersionCode != xmPushActionRegistrationResult.appVersionCode)) {
            return false;
        }
        boolean isSetRegion = isSetRegion();
        boolean isSetRegion2 = xmPushActionRegistrationResult.isSetRegion();
        return (!isSetRegion && !isSetRegion2) || (isSetRegion && isSetRegion2 && this.region.equals(xmPushActionRegistrationResult.region));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionRegistrationResult)) {
            return equals((XmPushActionRegistrationResult) obj);
        }
        return false;
    }

    public long getErrorCode() {
        return this.errorCode;
    }

    public String getId() {
        return this.id;
    }

    public String getPackageName() {
        return this.packageName;
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

    public boolean isSetAppVersion() {
        return this.appVersion != null;
    }

    public boolean isSetAppVersionCode() {
        return this.__isset_bit_vector.get(4);
    }

    public boolean isSetClientId() {
        return this.clientId != null;
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

    public boolean isSetHybridPushEndpoint() {
        return this.hybridPushEndpoint != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetPushSdkVersionCode() {
        return this.__isset_bit_vector.get(3);
    }

    public boolean isSetReason() {
        return this.reason != null;
    }

    public boolean isSetRegId() {
        return this.regId != null;
    }

    public boolean isSetRegSecret() {
        return this.regSecret != null;
    }

    public boolean isSetRegion() {
        return this.region != null;
    }

    public boolean isSetRegisteredAt() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetTarget() {
        return this.target != null;
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
                        this.regId = tProtocol.readString();
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.regSecret = tProtocol.readString();
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
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.registeredAt = tProtocol.readI64();
                        setRegisteredAtIsSet(true);
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.aliasName = tProtocol.readString();
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.clientId = tProtocol.readString();
                        break;
                    }
                case 14:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.costTime = tProtocol.readI64();
                        setCostTimeIsSet(true);
                        break;
                    }
                case 15:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appVersion = tProtocol.readString();
                        break;
                    }
                case 16:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.pushSdkVersionCode = tProtocol.readI32();
                        setPushSdkVersionCodeIsSet(true);
                        break;
                    }
                case 17:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.hybridPushEndpoint = tProtocol.readString();
                        break;
                    }
                case 18:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.appVersionCode = tProtocol.readI32();
                        setAppVersionCodeIsSet(true);
                        break;
                    }
                case 19:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.region = tProtocol.readString();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setAppVersionCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(4, z);
    }

    public void setCostTimeIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public void setErrorCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setPushSdkVersionCodeIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public void setRegisteredAtIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionRegistrationResult(");
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
        if (isSetRegId()) {
            sb.append(", ");
            sb.append("regId:");
            if (this.regId == null) {
                sb.append("null");
            } else {
                sb.append(this.regId);
            }
        }
        if (isSetRegSecret()) {
            sb.append(", ");
            sb.append("regSecret:");
            if (this.regSecret == null) {
                sb.append("null");
            } else {
                sb.append(this.regSecret);
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
        if (isSetRegisteredAt()) {
            sb.append(", ");
            sb.append("registeredAt:");
            sb.append(this.registeredAt);
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
        if (isSetClientId()) {
            sb.append(", ");
            sb.append("clientId:");
            if (this.clientId == null) {
                sb.append("null");
            } else {
                sb.append(this.clientId);
            }
        }
        if (isSetCostTime()) {
            sb.append(", ");
            sb.append("costTime:");
            sb.append(this.costTime);
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
        if (isSetPushSdkVersionCode()) {
            sb.append(", ");
            sb.append("pushSdkVersionCode:");
            sb.append(this.pushSdkVersionCode);
        }
        if (isSetHybridPushEndpoint()) {
            sb.append(", ");
            sb.append("hybridPushEndpoint:");
            if (this.hybridPushEndpoint == null) {
                sb.append("null");
            } else {
                sb.append(this.hybridPushEndpoint);
            }
        }
        if (isSetAppVersionCode()) {
            sb.append(", ");
            sb.append("appVersionCode:");
            sb.append(this.appVersionCode);
        }
        if (isSetRegion()) {
            sb.append(", ");
            sb.append("region:");
            if (this.region == null) {
                sb.append("null");
            } else {
                sb.append(this.region);
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
        tProtocol.writeFieldBegin(ERROR_CODE_FIELD_DESC);
        tProtocol.writeI64(this.errorCode);
        tProtocol.writeFieldEnd();
        if (this.reason != null && isSetReason()) {
            tProtocol.writeFieldBegin(REASON_FIELD_DESC);
            tProtocol.writeString(this.reason);
            tProtocol.writeFieldEnd();
        }
        if (this.regId != null && isSetRegId()) {
            tProtocol.writeFieldBegin(REG_ID_FIELD_DESC);
            tProtocol.writeString(this.regId);
            tProtocol.writeFieldEnd();
        }
        if (this.regSecret != null && isSetRegSecret()) {
            tProtocol.writeFieldBegin(REG_SECRET_FIELD_DESC);
            tProtocol.writeString(this.regSecret);
            tProtocol.writeFieldEnd();
        }
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
        if (isSetRegisteredAt()) {
            tProtocol.writeFieldBegin(REGISTERED_AT_FIELD_DESC);
            tProtocol.writeI64(this.registeredAt);
            tProtocol.writeFieldEnd();
        }
        if (this.aliasName != null && isSetAliasName()) {
            tProtocol.writeFieldBegin(ALIAS_NAME_FIELD_DESC);
            tProtocol.writeString(this.aliasName);
            tProtocol.writeFieldEnd();
        }
        if (this.clientId != null && isSetClientId()) {
            tProtocol.writeFieldBegin(CLIENT_ID_FIELD_DESC);
            tProtocol.writeString(this.clientId);
            tProtocol.writeFieldEnd();
        }
        if (isSetCostTime()) {
            tProtocol.writeFieldBegin(COST_TIME_FIELD_DESC);
            tProtocol.writeI64(this.costTime);
            tProtocol.writeFieldEnd();
        }
        if (this.appVersion != null && isSetAppVersion()) {
            tProtocol.writeFieldBegin(APP_VERSION_FIELD_DESC);
            tProtocol.writeString(this.appVersion);
            tProtocol.writeFieldEnd();
        }
        if (isSetPushSdkVersionCode()) {
            tProtocol.writeFieldBegin(PUSH_SDK_VERSION_CODE_FIELD_DESC);
            tProtocol.writeI32(this.pushSdkVersionCode);
            tProtocol.writeFieldEnd();
        }
        if (this.hybridPushEndpoint != null && isSetHybridPushEndpoint()) {
            tProtocol.writeFieldBegin(HYBRID_PUSH_ENDPOINT_FIELD_DESC);
            tProtocol.writeString(this.hybridPushEndpoint);
            tProtocol.writeFieldEnd();
        }
        if (isSetAppVersionCode()) {
            tProtocol.writeFieldBegin(APP_VERSION_CODE_FIELD_DESC);
            tProtocol.writeI32(this.appVersionCode);
            tProtocol.writeFieldEnd();
        }
        if (this.region != null && isSetRegion()) {
            tProtocol.writeFieldBegin(REGION_FIELD_DESC);
            tProtocol.writeString(this.region);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
