package com.xiaomi.xmpush.thrift;

import java.io.Serializable;
import java.nio.ByteBuffer;
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

public class XmPushActionNotification implements Serializable, Cloneable, TBase<XmPushActionNotification, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 13);
    private static final TField ALREADY_LOG_CLICK_IN_XMQ_FIELD_DESC = new TField("", 2, 20);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField BINARY_EXTRA_FIELD_DESC = new TField("", 11, 14);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 10);
    private static final TField CREATED_TS_FIELD_DESC = new TField("", 10, 15);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField EXTRA_FIELD_DESC = new TField("", 13, 8);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 9);
    private static final TField PAYLOAD_FIELD_DESC = new TField("", 11, 7);
    private static final TField REG_ID_FIELD_DESC = new TField("", 11, 12);
    private static final TField REQUIRE_ACK_FIELD_DESC = new TField("", 2, 6);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionNotification");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TYPE_FIELD_DESC = new TField("", 11, 5);
    private BitSet __isset_bit_vector;
    public String aliasName;
    public boolean alreadyLogClickInXmq;
    public String appId;
    public ByteBuffer binaryExtra;
    public String category;
    public long createdTs;
    public String debug;
    public Map<String, String> extra;
    public String id;
    public String packageName;
    public String payload;
    public String regId;
    public boolean requireAck;
    public Target target;
    public String type;

    public XmPushActionNotification() {
        this.__isset_bit_vector = new BitSet(3);
        this.requireAck = true;
        this.alreadyLogClickInXmq = false;
    }

    public XmPushActionNotification(String str, boolean z) {
        this();
        this.id = str;
        this.requireAck = z;
        setRequireAckIsSet(true);
    }

    public int compareTo(XmPushActionNotification xmPushActionNotification) {
        if (!getClass().equals(xmPushActionNotification.getClass())) {
            return getClass().getName().compareTo(xmPushActionNotification.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionNotification.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionNotification.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionNotification.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionNotification.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetType()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetType()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetType()) {
            int compareTo10 = TBaseHelper.compareTo(this.type, xmPushActionNotification.type);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetRequireAck()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetRequireAck()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetRequireAck()) {
            int compareTo12 = TBaseHelper.compareTo(this.requireAck, xmPushActionNotification.requireAck);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetPayload()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetPayload()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetPayload()) {
            int compareTo14 = TBaseHelper.compareTo(this.payload, xmPushActionNotification.payload);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetExtra()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetExtra()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetExtra()) {
            int compareTo16 = TBaseHelper.compareTo((Map) this.extra, (Map) xmPushActionNotification.extra);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetPackageName()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetPackageName()) {
            int compareTo18 = TBaseHelper.compareTo(this.packageName, xmPushActionNotification.packageName);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetCategory()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetCategory()) {
            int compareTo20 = TBaseHelper.compareTo(this.category, xmPushActionNotification.category);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetRegId()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetRegId()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetRegId()) {
            int compareTo22 = TBaseHelper.compareTo(this.regId, xmPushActionNotification.regId);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetAliasName()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetAliasName()) {
            int compareTo24 = TBaseHelper.compareTo(this.aliasName, xmPushActionNotification.aliasName);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetBinaryExtra()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetBinaryExtra()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetBinaryExtra()) {
            int compareTo26 = TBaseHelper.compareTo((Comparable) this.binaryExtra, (Comparable) xmPushActionNotification.binaryExtra);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        int compareTo27 = Boolean.valueOf(isSetCreatedTs()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetCreatedTs()));
        if (compareTo27 != 0) {
            return compareTo27;
        }
        if (isSetCreatedTs()) {
            int compareTo28 = TBaseHelper.compareTo(this.createdTs, xmPushActionNotification.createdTs);
            if (compareTo28 != 0) {
                return compareTo28;
            }
        }
        int compareTo29 = Boolean.valueOf(isSetAlreadyLogClickInXmq()).compareTo(Boolean.valueOf(xmPushActionNotification.isSetAlreadyLogClickInXmq()));
        if (compareTo29 != 0) {
            return compareTo29;
        }
        if (isSetAlreadyLogClickInXmq()) {
            int compareTo30 = TBaseHelper.compareTo(this.alreadyLogClickInXmq, xmPushActionNotification.alreadyLogClickInXmq);
            if (compareTo30 != 0) {
                return compareTo30;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionNotification xmPushActionNotification) {
        if (xmPushActionNotification == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionNotification.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionNotification.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionNotification.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionNotification.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionNotification.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionNotification.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionNotification.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionNotification.appId))) {
            return false;
        }
        boolean isSetType = isSetType();
        boolean isSetType2 = xmPushActionNotification.isSetType();
        if (((isSetType || isSetType2) && (!isSetType || !isSetType2 || !this.type.equals(xmPushActionNotification.type))) || this.requireAck != xmPushActionNotification.requireAck) {
            return false;
        }
        boolean isSetPayload = isSetPayload();
        boolean isSetPayload2 = xmPushActionNotification.isSetPayload();
        if ((isSetPayload || isSetPayload2) && (!isSetPayload || !isSetPayload2 || !this.payload.equals(xmPushActionNotification.payload))) {
            return false;
        }
        boolean isSetExtra = isSetExtra();
        boolean isSetExtra2 = xmPushActionNotification.isSetExtra();
        if ((isSetExtra || isSetExtra2) && (!isSetExtra || !isSetExtra2 || !this.extra.equals(xmPushActionNotification.extra))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionNotification.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionNotification.packageName))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionNotification.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(xmPushActionNotification.category))) {
            return false;
        }
        boolean isSetRegId = isSetRegId();
        boolean isSetRegId2 = xmPushActionNotification.isSetRegId();
        if ((isSetRegId || isSetRegId2) && (!isSetRegId || !isSetRegId2 || !this.regId.equals(xmPushActionNotification.regId))) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = xmPushActionNotification.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(xmPushActionNotification.aliasName))) {
            return false;
        }
        boolean isSetBinaryExtra = isSetBinaryExtra();
        boolean isSetBinaryExtra2 = xmPushActionNotification.isSetBinaryExtra();
        if ((isSetBinaryExtra || isSetBinaryExtra2) && (!isSetBinaryExtra || !isSetBinaryExtra2 || !this.binaryExtra.equals(xmPushActionNotification.binaryExtra))) {
            return false;
        }
        boolean isSetCreatedTs = isSetCreatedTs();
        boolean isSetCreatedTs2 = xmPushActionNotification.isSetCreatedTs();
        if ((isSetCreatedTs || isSetCreatedTs2) && (!isSetCreatedTs || !isSetCreatedTs2 || this.createdTs != xmPushActionNotification.createdTs)) {
            return false;
        }
        boolean isSetAlreadyLogClickInXmq = isSetAlreadyLogClickInXmq();
        boolean isSetAlreadyLogClickInXmq2 = xmPushActionNotification.isSetAlreadyLogClickInXmq();
        return (!isSetAlreadyLogClickInXmq && !isSetAlreadyLogClickInXmq2) || (isSetAlreadyLogClickInXmq && isSetAlreadyLogClickInXmq2 && this.alreadyLogClickInXmq == xmPushActionNotification.alreadyLogClickInXmq);
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionNotification)) {
            return equals((XmPushActionNotification) obj);
        }
        return false;
    }

    public String getAppId() {
        return this.appId;
    }

    public byte[] getBinaryExtra() {
        setBinaryExtra(TBaseHelper.rightSize(this.binaryExtra));
        return this.binaryExtra.array();
    }

    public Map<String, String> getExtra() {
        return this.extra;
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

    public boolean isSetAlreadyLogClickInXmq() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetAppId() {
        return this.appId != null;
    }

    public boolean isSetBinaryExtra() {
        return this.binaryExtra != null;
    }

    public boolean isSetCategory() {
        return this.category != null;
    }

    public boolean isSetCreatedTs() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetDebug() {
        return this.debug != null;
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

    public boolean isSetPayload() {
        return this.payload != null;
    }

    public boolean isSetRegId() {
        return this.regId != null;
    }

    public boolean isSetRequireAck() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetTarget() {
        return this.target != null;
    }

    public boolean isSetType() {
        return this.type != null;
    }

    public void putToExtra(String str, String str2) {
        if (this.extra == null) {
            this.extra = new HashMap();
        }
        this.extra.put(str, str2);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetRequireAck()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'requireAck' was not found in serialized data! Struct: ");
                sb.append(toString());
                throw new TProtocolException(sb.toString());
            }
            short s = readFieldBegin.id;
            if (s != 20) {
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
                            this.type = tProtocol.readString();
                            break;
                        }
                    case 6:
                        if (readFieldBegin.type != 2) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.requireAck = tProtocol.readBool();
                            setRequireAckIsSet(true);
                            break;
                        }
                    case 7:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.payload = tProtocol.readString();
                            break;
                        }
                    case 8:
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
                    default:
                        switch (s) {
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
                                    this.aliasName = tProtocol.readString();
                                    break;
                                }
                            case 14:
                                if (readFieldBegin.type != 11) {
                                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                    break;
                                } else {
                                    this.binaryExtra = tProtocol.readBinary();
                                    break;
                                }
                            case 15:
                                if (readFieldBegin.type != 10) {
                                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                    break;
                                } else {
                                    this.createdTs = tProtocol.readI64();
                                    setCreatedTsIsSet(true);
                                    break;
                                }
                            default:
                                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                                break;
                        }
                }
            } else if (readFieldBegin.type == 2) {
                this.alreadyLogClickInXmq = tProtocol.readBool();
                setAlreadyLogClickInXmqIsSet(true);
            } else {
                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setAlreadyLogClickInXmqIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public XmPushActionNotification setAppId(String str) {
        this.appId = str;
        return this;
    }

    public XmPushActionNotification setBinaryExtra(ByteBuffer byteBuffer) {
        this.binaryExtra = byteBuffer;
        return this;
    }

    public XmPushActionNotification setBinaryExtra(byte[] bArr) {
        setBinaryExtra(ByteBuffer.wrap(bArr));
        return this;
    }

    public void setCreatedTsIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public XmPushActionNotification setExtra(Map<String, String> map) {
        this.extra = map;
        return this;
    }

    public XmPushActionNotification setId(String str) {
        this.id = str;
        return this;
    }

    public XmPushActionNotification setPackageName(String str) {
        this.packageName = str;
        return this;
    }

    public XmPushActionNotification setRequireAck(boolean z) {
        this.requireAck = z;
        setRequireAckIsSet(true);
        return this;
    }

    public void setRequireAckIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public XmPushActionNotification setType(String str) {
        this.type = str;
        return this;
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionNotification(");
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
        sb.append(", ");
        sb.append("requireAck:");
        sb.append(this.requireAck);
        if (isSetPayload()) {
            sb.append(", ");
            sb.append("payload:");
            if (this.payload == null) {
                sb.append("null");
            } else {
                sb.append(this.payload);
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
        if (isSetRegId()) {
            sb.append(", ");
            sb.append("regId:");
            if (this.regId == null) {
                sb.append("null");
            } else {
                sb.append(this.regId);
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
        if (isSetBinaryExtra()) {
            sb.append(", ");
            sb.append("binaryExtra:");
            if (this.binaryExtra == null) {
                sb.append("null");
            } else {
                TBaseHelper.toString(this.binaryExtra, sb);
            }
        }
        if (isSetCreatedTs()) {
            sb.append(", ");
            sb.append("createdTs:");
            sb.append(this.createdTs);
        }
        if (isSetAlreadyLogClickInXmq()) {
            sb.append(", ");
            sb.append("alreadyLogClickInXmq:");
            sb.append(this.alreadyLogClickInXmq);
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
        tProtocol.writeFieldBegin(REQUIRE_ACK_FIELD_DESC);
        tProtocol.writeBool(this.requireAck);
        tProtocol.writeFieldEnd();
        if (this.payload != null && isSetPayload()) {
            tProtocol.writeFieldBegin(PAYLOAD_FIELD_DESC);
            tProtocol.writeString(this.payload);
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
        if (this.regId != null && isSetRegId()) {
            tProtocol.writeFieldBegin(REG_ID_FIELD_DESC);
            tProtocol.writeString(this.regId);
            tProtocol.writeFieldEnd();
        }
        if (this.aliasName != null && isSetAliasName()) {
            tProtocol.writeFieldBegin(ALIAS_NAME_FIELD_DESC);
            tProtocol.writeString(this.aliasName);
            tProtocol.writeFieldEnd();
        }
        if (this.binaryExtra != null && isSetBinaryExtra()) {
            tProtocol.writeFieldBegin(BINARY_EXTRA_FIELD_DESC);
            tProtocol.writeBinary(this.binaryExtra);
            tProtocol.writeFieldEnd();
        }
        if (isSetCreatedTs()) {
            tProtocol.writeFieldBegin(CREATED_TS_FIELD_DESC);
            tProtocol.writeI64(this.createdTs);
            tProtocol.writeFieldEnd();
        }
        if (isSetAlreadyLogClickInXmq()) {
            tProtocol.writeFieldBegin(ALREADY_LOG_CLICK_IN_XMQ_FIELD_DESC);
            tProtocol.writeBool(this.alreadyLogClickInXmq);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
