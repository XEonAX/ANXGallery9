package com.xiaomi.push.thrift;

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

public class StatsEvent implements Serializable, Cloneable, TBase<StatsEvent, Object> {
    private static final TField ANNOTATION_FIELD_DESC = new TField("", 11, 7);
    private static final TField CHID_FIELD_DESC = new TField("", 3, 1);
    private static final TField CLIENT_IP_FIELD_DESC = new TField("", 8, 10);
    private static final TField CONNPT_FIELD_DESC = new TField("", 11, 4);
    private static final TField HOST_FIELD_DESC = new TField("", 11, 5);
    private static final TStruct STRUCT_DESC = new TStruct("StatsEvent");
    private static final TField SUBVALUE_FIELD_DESC = new TField("", 8, 6);
    private static final TField TIME_FIELD_DESC = new TField("", 8, 9);
    private static final TField TYPE_FIELD_DESC = new TField("", 8, 2);
    private static final TField USER_FIELD_DESC = new TField("", 11, 8);
    private static final TField VALUE_FIELD_DESC = new TField("", 8, 3);
    private BitSet __isset_bit_vector = new BitSet(6);
    public String annotation;
    public byte chid;
    public int clientIp;
    public String connpt;
    public String host;
    public int subvalue;
    public int time;
    public int type;
    public String user;
    public int value;

    public int compareTo(StatsEvent statsEvent) {
        if (!getClass().equals(statsEvent.getClass())) {
            return getClass().getName().compareTo(statsEvent.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetChid()).compareTo(Boolean.valueOf(statsEvent.isSetChid()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetChid()) {
            int compareTo2 = TBaseHelper.compareTo(this.chid, statsEvent.chid);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetType()).compareTo(Boolean.valueOf(statsEvent.isSetType()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetType()) {
            int compareTo4 = TBaseHelper.compareTo(this.type, statsEvent.type);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetValue()).compareTo(Boolean.valueOf(statsEvent.isSetValue()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetValue()) {
            int compareTo6 = TBaseHelper.compareTo(this.value, statsEvent.value);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetConnpt()).compareTo(Boolean.valueOf(statsEvent.isSetConnpt()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetConnpt()) {
            int compareTo8 = TBaseHelper.compareTo(this.connpt, statsEvent.connpt);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetHost()).compareTo(Boolean.valueOf(statsEvent.isSetHost()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetHost()) {
            int compareTo10 = TBaseHelper.compareTo(this.host, statsEvent.host);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetSubvalue()).compareTo(Boolean.valueOf(statsEvent.isSetSubvalue()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetSubvalue()) {
            int compareTo12 = TBaseHelper.compareTo(this.subvalue, statsEvent.subvalue);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetAnnotation()).compareTo(Boolean.valueOf(statsEvent.isSetAnnotation()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetAnnotation()) {
            int compareTo14 = TBaseHelper.compareTo(this.annotation, statsEvent.annotation);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetUser()).compareTo(Boolean.valueOf(statsEvent.isSetUser()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetUser()) {
            int compareTo16 = TBaseHelper.compareTo(this.user, statsEvent.user);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetTime()).compareTo(Boolean.valueOf(statsEvent.isSetTime()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetTime()) {
            int compareTo18 = TBaseHelper.compareTo(this.time, statsEvent.time);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetClientIp()).compareTo(Boolean.valueOf(statsEvent.isSetClientIp()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetClientIp()) {
            int compareTo20 = TBaseHelper.compareTo(this.clientIp, statsEvent.clientIp);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        return 0;
    }

    public boolean equals(StatsEvent statsEvent) {
        if (statsEvent == null || this.chid != statsEvent.chid || this.type != statsEvent.type || this.value != statsEvent.value) {
            return false;
        }
        boolean isSetConnpt = isSetConnpt();
        boolean isSetConnpt2 = statsEvent.isSetConnpt();
        if ((isSetConnpt || isSetConnpt2) && (!isSetConnpt || !isSetConnpt2 || !this.connpt.equals(statsEvent.connpt))) {
            return false;
        }
        boolean isSetHost = isSetHost();
        boolean isSetHost2 = statsEvent.isSetHost();
        if ((isSetHost || isSetHost2) && (!isSetHost || !isSetHost2 || !this.host.equals(statsEvent.host))) {
            return false;
        }
        boolean isSetSubvalue = isSetSubvalue();
        boolean isSetSubvalue2 = statsEvent.isSetSubvalue();
        if ((isSetSubvalue || isSetSubvalue2) && (!isSetSubvalue || !isSetSubvalue2 || this.subvalue != statsEvent.subvalue)) {
            return false;
        }
        boolean isSetAnnotation = isSetAnnotation();
        boolean isSetAnnotation2 = statsEvent.isSetAnnotation();
        if ((isSetAnnotation || isSetAnnotation2) && (!isSetAnnotation || !isSetAnnotation2 || !this.annotation.equals(statsEvent.annotation))) {
            return false;
        }
        boolean isSetUser = isSetUser();
        boolean isSetUser2 = statsEvent.isSetUser();
        if ((isSetUser || isSetUser2) && (!isSetUser || !isSetUser2 || !this.user.equals(statsEvent.user))) {
            return false;
        }
        boolean isSetTime = isSetTime();
        boolean isSetTime2 = statsEvent.isSetTime();
        if ((isSetTime || isSetTime2) && (!isSetTime || !isSetTime2 || this.time != statsEvent.time)) {
            return false;
        }
        boolean isSetClientIp = isSetClientIp();
        boolean isSetClientIp2 = statsEvent.isSetClientIp();
        return (!isSetClientIp && !isSetClientIp2) || (isSetClientIp && isSetClientIp2 && this.clientIp == statsEvent.clientIp);
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof StatsEvent)) {
            return equals((StatsEvent) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAnnotation() {
        return this.annotation != null;
    }

    public boolean isSetChid() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetClientIp() {
        return this.__isset_bit_vector.get(5);
    }

    public boolean isSetConnpt() {
        return this.connpt != null;
    }

    public boolean isSetHost() {
        return this.host != null;
    }

    public boolean isSetSubvalue() {
        return this.__isset_bit_vector.get(3);
    }

    public boolean isSetTime() {
        return this.__isset_bit_vector.get(4);
    }

    public boolean isSetType() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetUser() {
        return this.user != null;
    }

    public boolean isSetValue() {
        return this.__isset_bit_vector.get(2);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (!isSetChid()) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Required field 'chid' was not found in serialized data! Struct: ");
                    sb.append(toString());
                    throw new TProtocolException(sb.toString());
                } else if (!isSetType()) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Required field 'type' was not found in serialized data! Struct: ");
                    sb2.append(toString());
                    throw new TProtocolException(sb2.toString());
                } else if (isSetValue()) {
                    validate();
                    return;
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Required field 'value' was not found in serialized data! Struct: ");
                    sb3.append(toString());
                    throw new TProtocolException(sb3.toString());
                }
            } else {
                switch (readFieldBegin.id) {
                    case 1:
                        if (readFieldBegin.type != 3) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.chid = tProtocol.readByte();
                            setChidIsSet(true);
                            break;
                        }
                    case 2:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.type = tProtocol.readI32();
                            setTypeIsSet(true);
                            break;
                        }
                    case 3:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.value = tProtocol.readI32();
                            setValueIsSet(true);
                            break;
                        }
                    case 4:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.connpt = tProtocol.readString();
                            break;
                        }
                    case 5:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.host = tProtocol.readString();
                            break;
                        }
                    case 6:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.subvalue = tProtocol.readI32();
                            setSubvalueIsSet(true);
                            break;
                        }
                    case 7:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.annotation = tProtocol.readString();
                            break;
                        }
                    case 8:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.user = tProtocol.readString();
                            break;
                        }
                    case 9:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.time = tProtocol.readI32();
                            setTimeIsSet(true);
                            break;
                        }
                    case 10:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.clientIp = tProtocol.readI32();
                            setClientIpIsSet(true);
                            break;
                        }
                    default:
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                }
                tProtocol.readFieldEnd();
            }
        }
    }

    public StatsEvent setAnnotation(String str) {
        this.annotation = str;
        return this;
    }

    public StatsEvent setChid(byte b) {
        this.chid = b;
        setChidIsSet(true);
        return this;
    }

    public void setChidIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setClientIpIsSet(boolean z) {
        this.__isset_bit_vector.set(5, z);
    }

    public StatsEvent setConnpt(String str) {
        this.connpt = str;
        return this;
    }

    public StatsEvent setHost(String str) {
        this.host = str;
        return this;
    }

    public StatsEvent setSubvalue(int i) {
        this.subvalue = i;
        setSubvalueIsSet(true);
        return this;
    }

    public void setSubvalueIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public StatsEvent setTime(int i) {
        this.time = i;
        setTimeIsSet(true);
        return this;
    }

    public void setTimeIsSet(boolean z) {
        this.__isset_bit_vector.set(4, z);
    }

    public StatsEvent setType(int i) {
        this.type = i;
        setTypeIsSet(true);
        return this;
    }

    public void setTypeIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public StatsEvent setUser(String str) {
        this.user = str;
        return this;
    }

    public StatsEvent setValue(int i) {
        this.value = i;
        setValueIsSet(true);
        return this;
    }

    public void setValueIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("StatsEvent(");
        sb.append("chid:");
        sb.append(this.chid);
        sb.append(", ");
        sb.append("type:");
        sb.append(this.type);
        sb.append(", ");
        sb.append("value:");
        sb.append(this.value);
        sb.append(", ");
        sb.append("connpt:");
        if (this.connpt == null) {
            sb.append("null");
        } else {
            sb.append(this.connpt);
        }
        if (isSetHost()) {
            sb.append(", ");
            sb.append("host:");
            if (this.host == null) {
                sb.append("null");
            } else {
                sb.append(this.host);
            }
        }
        if (isSetSubvalue()) {
            sb.append(", ");
            sb.append("subvalue:");
            sb.append(this.subvalue);
        }
        if (isSetAnnotation()) {
            sb.append(", ");
            sb.append("annotation:");
            if (this.annotation == null) {
                sb.append("null");
            } else {
                sb.append(this.annotation);
            }
        }
        if (isSetUser()) {
            sb.append(", ");
            sb.append("user:");
            if (this.user == null) {
                sb.append("null");
            } else {
                sb.append(this.user);
            }
        }
        if (isSetTime()) {
            sb.append(", ");
            sb.append("time:");
            sb.append(this.time);
        }
        if (isSetClientIp()) {
            sb.append(", ");
            sb.append("clientIp:");
            sb.append(this.clientIp);
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.connpt == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'connpt' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        tProtocol.writeFieldBegin(CHID_FIELD_DESC);
        tProtocol.writeByte(this.chid);
        tProtocol.writeFieldEnd();
        tProtocol.writeFieldBegin(TYPE_FIELD_DESC);
        tProtocol.writeI32(this.type);
        tProtocol.writeFieldEnd();
        tProtocol.writeFieldBegin(VALUE_FIELD_DESC);
        tProtocol.writeI32(this.value);
        tProtocol.writeFieldEnd();
        if (this.connpt != null) {
            tProtocol.writeFieldBegin(CONNPT_FIELD_DESC);
            tProtocol.writeString(this.connpt);
            tProtocol.writeFieldEnd();
        }
        if (this.host != null && isSetHost()) {
            tProtocol.writeFieldBegin(HOST_FIELD_DESC);
            tProtocol.writeString(this.host);
            tProtocol.writeFieldEnd();
        }
        if (isSetSubvalue()) {
            tProtocol.writeFieldBegin(SUBVALUE_FIELD_DESC);
            tProtocol.writeI32(this.subvalue);
            tProtocol.writeFieldEnd();
        }
        if (this.annotation != null && isSetAnnotation()) {
            tProtocol.writeFieldBegin(ANNOTATION_FIELD_DESC);
            tProtocol.writeString(this.annotation);
            tProtocol.writeFieldEnd();
        }
        if (this.user != null && isSetUser()) {
            tProtocol.writeFieldBegin(USER_FIELD_DESC);
            tProtocol.writeString(this.user);
            tProtocol.writeFieldEnd();
        }
        if (isSetTime()) {
            tProtocol.writeFieldBegin(TIME_FIELD_DESC);
            tProtocol.writeI32(this.time);
            tProtocol.writeFieldEnd();
        }
        if (isSetClientIp()) {
            tProtocol.writeFieldBegin(CLIENT_IP_FIELD_DESC);
            tProtocol.writeI32(this.clientIp);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
