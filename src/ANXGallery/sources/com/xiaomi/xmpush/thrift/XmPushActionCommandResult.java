package com.xiaomi.xmpush.thrift;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import org.apache.thrift.TBase;
import org.apache.thrift.TBaseHelper;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TList;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;

public class XmPushActionCommandResult implements Serializable, Cloneable, TBase<XmPushActionCommandResult, Object> {
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 12);
    private static final TField CMD_ARGS_FIELD_DESC = new TField("", 15, 10);
    private static final TField CMD_NAME_FIELD_DESC = new TField("", 11, 5);
    private static final TField ERROR_CODE_FIELD_DESC = new TField("", 10, 7);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 9);
    private static final TField REASON_FIELD_DESC = new TField("", 11, 8);
    private static final TField RESPONSE2_CLIENT_FIELD_DESC = new TField("", 2, 13);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionCommandResult");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private BitSet __isset_bit_vector = new BitSet(2);
    public String appId;
    public String category;
    public List<String> cmdArgs;
    public String cmdName;
    public long errorCode;
    public String id;
    public String packageName;
    public String reason;
    public boolean response2Client = true;
    public Target target;

    public int compareTo(XmPushActionCommandResult xmPushActionCommandResult) {
        if (!getClass().equals(xmPushActionCommandResult.getClass())) {
            return getClass().getName().compareTo(xmPushActionCommandResult.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetTarget()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetTarget()) {
            int compareTo2 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionCommandResult.target);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetId()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetId()) {
            int compareTo4 = TBaseHelper.compareTo(this.id, xmPushActionCommandResult.id);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetAppId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetAppId()) {
            int compareTo6 = TBaseHelper.compareTo(this.appId, xmPushActionCommandResult.appId);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetCmdName()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetCmdName()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetCmdName()) {
            int compareTo8 = TBaseHelper.compareTo(this.cmdName, xmPushActionCommandResult.cmdName);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetErrorCode()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetErrorCode()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetErrorCode()) {
            int compareTo10 = TBaseHelper.compareTo(this.errorCode, xmPushActionCommandResult.errorCode);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetReason()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetReason()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetReason()) {
            int compareTo12 = TBaseHelper.compareTo(this.reason, xmPushActionCommandResult.reason);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetPackageName()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetPackageName()) {
            int compareTo14 = TBaseHelper.compareTo(this.packageName, xmPushActionCommandResult.packageName);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetCmdArgs()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetCmdArgs()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetCmdArgs()) {
            int compareTo16 = TBaseHelper.compareTo((List) this.cmdArgs, (List) xmPushActionCommandResult.cmdArgs);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetCategory()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetCategory()) {
            int compareTo18 = TBaseHelper.compareTo(this.category, xmPushActionCommandResult.category);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetResponse2Client()).compareTo(Boolean.valueOf(xmPushActionCommandResult.isSetResponse2Client()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetResponse2Client()) {
            int compareTo20 = TBaseHelper.compareTo(this.response2Client, xmPushActionCommandResult.response2Client);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionCommandResult xmPushActionCommandResult) {
        if (xmPushActionCommandResult == null) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionCommandResult.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionCommandResult.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionCommandResult.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionCommandResult.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionCommandResult.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionCommandResult.appId))) {
            return false;
        }
        boolean isSetCmdName = isSetCmdName();
        boolean isSetCmdName2 = xmPushActionCommandResult.isSetCmdName();
        if (((isSetCmdName || isSetCmdName2) && (!isSetCmdName || !isSetCmdName2 || !this.cmdName.equals(xmPushActionCommandResult.cmdName))) || this.errorCode != xmPushActionCommandResult.errorCode) {
            return false;
        }
        boolean isSetReason = isSetReason();
        boolean isSetReason2 = xmPushActionCommandResult.isSetReason();
        if ((isSetReason || isSetReason2) && (!isSetReason || !isSetReason2 || !this.reason.equals(xmPushActionCommandResult.reason))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionCommandResult.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionCommandResult.packageName))) {
            return false;
        }
        boolean isSetCmdArgs = isSetCmdArgs();
        boolean isSetCmdArgs2 = xmPushActionCommandResult.isSetCmdArgs();
        if ((isSetCmdArgs || isSetCmdArgs2) && (!isSetCmdArgs || !isSetCmdArgs2 || !this.cmdArgs.equals(xmPushActionCommandResult.cmdArgs))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionCommandResult.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(xmPushActionCommandResult.category))) {
            return false;
        }
        boolean isSetResponse2Client = isSetResponse2Client();
        boolean isSetResponse2Client2 = xmPushActionCommandResult.isSetResponse2Client();
        return (!isSetResponse2Client && !isSetResponse2Client2) || (isSetResponse2Client && isSetResponse2Client2 && this.response2Client == xmPushActionCommandResult.response2Client);
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionCommandResult)) {
            return equals((XmPushActionCommandResult) obj);
        }
        return false;
    }

    public String getCategory() {
        return this.category;
    }

    public List<String> getCmdArgs() {
        return this.cmdArgs;
    }

    public String getCmdName() {
        return this.cmdName;
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

    public boolean isSetCmdArgs() {
        return this.cmdArgs != null;
    }

    public boolean isSetCmdName() {
        return this.cmdName != null;
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

    public boolean isSetResponse2Client() {
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
                        this.cmdName = tProtocol.readString();
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
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 15) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TList readListBegin = tProtocol.readListBegin();
                        this.cmdArgs = new ArrayList(readListBegin.size);
                        for (int i = 0; i < readListBegin.size; i++) {
                            this.cmdArgs.add(tProtocol.readString());
                        }
                        tProtocol.readListEnd();
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.category = tProtocol.readString();
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.response2Client = tProtocol.readBool();
                        setResponse2ClientIsSet(true);
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

    public void setResponse2ClientIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionCommandResult(");
        if (isSetTarget()) {
            sb.append("target:");
            if (this.target == null) {
                sb.append("null");
            } else {
                sb.append(this.target);
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
        sb.append("cmdName:");
        if (this.cmdName == null) {
            sb.append("null");
        } else {
            sb.append(this.cmdName);
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
        if (isSetCmdArgs()) {
            sb.append(", ");
            sb.append("cmdArgs:");
            if (this.cmdArgs == null) {
                sb.append("null");
            } else {
                sb.append(this.cmdArgs);
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
        if (isSetResponse2Client()) {
            sb.append(", ");
            sb.append("response2Client:");
            sb.append(this.response2Client);
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
        } else if (this.cmdName == null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Required field 'cmdName' was not present! Struct: ");
            sb3.append(toString());
            throw new TProtocolException(sb3.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
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
        if (this.cmdName != null) {
            tProtocol.writeFieldBegin(CMD_NAME_FIELD_DESC);
            tProtocol.writeString(this.cmdName);
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
        if (this.cmdArgs != null && isSetCmdArgs()) {
            tProtocol.writeFieldBegin(CMD_ARGS_FIELD_DESC);
            tProtocol.writeListBegin(new TList(11, this.cmdArgs.size()));
            for (String writeString : this.cmdArgs) {
                tProtocol.writeString(writeString);
            }
            tProtocol.writeListEnd();
            tProtocol.writeFieldEnd();
        }
        if (this.category != null && isSetCategory()) {
            tProtocol.writeFieldBegin(CATEGORY_FIELD_DESC);
            tProtocol.writeString(this.category);
            tProtocol.writeFieldEnd();
        }
        if (isSetResponse2Client()) {
            tProtocol.writeFieldBegin(RESPONSE2_CLIENT_FIELD_DESC);
            tProtocol.writeBool(this.response2Client);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
