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

public class XmPushActionCheckClientInfo implements Serializable, Cloneable, TBase<XmPushActionCheckClientInfo, Object> {
    private static final TField MISC_CONFIG_VERSION_FIELD_DESC = new TField("", 8, 1);
    private static final TField PLUGIN_CONFIG_VERSION_FIELD_DESC = new TField("", 8, 2);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionCheckClientInfo");
    private BitSet __isset_bit_vector = new BitSet(2);
    public int miscConfigVersion;
    public int pluginConfigVersion;

    public int compareTo(XmPushActionCheckClientInfo xmPushActionCheckClientInfo) {
        if (!getClass().equals(xmPushActionCheckClientInfo.getClass())) {
            return getClass().getName().compareTo(xmPushActionCheckClientInfo.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetMiscConfigVersion()).compareTo(Boolean.valueOf(xmPushActionCheckClientInfo.isSetMiscConfigVersion()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetMiscConfigVersion()) {
            int compareTo2 = TBaseHelper.compareTo(this.miscConfigVersion, xmPushActionCheckClientInfo.miscConfigVersion);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetPluginConfigVersion()).compareTo(Boolean.valueOf(xmPushActionCheckClientInfo.isSetPluginConfigVersion()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetPluginConfigVersion()) {
            int compareTo4 = TBaseHelper.compareTo(this.pluginConfigVersion, xmPushActionCheckClientInfo.pluginConfigVersion);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionCheckClientInfo xmPushActionCheckClientInfo) {
        return xmPushActionCheckClientInfo != null && this.miscConfigVersion == xmPushActionCheckClientInfo.miscConfigVersion && this.pluginConfigVersion == xmPushActionCheckClientInfo.pluginConfigVersion;
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionCheckClientInfo)) {
            return equals((XmPushActionCheckClientInfo) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetMiscConfigVersion() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetPluginConfigVersion() {
        return this.__isset_bit_vector.get(1);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (!isSetMiscConfigVersion()) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Required field 'miscConfigVersion' was not found in serialized data! Struct: ");
                    sb.append(toString());
                    throw new TProtocolException(sb.toString());
                } else if (isSetPluginConfigVersion()) {
                    validate();
                    return;
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Required field 'pluginConfigVersion' was not found in serialized data! Struct: ");
                    sb2.append(toString());
                    throw new TProtocolException(sb2.toString());
                }
            } else {
                switch (readFieldBegin.id) {
                    case 1:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.miscConfigVersion = tProtocol.readI32();
                            setMiscConfigVersionIsSet(true);
                            break;
                        }
                    case 2:
                        if (readFieldBegin.type != 8) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.pluginConfigVersion = tProtocol.readI32();
                            setPluginConfigVersionIsSet(true);
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

    public XmPushActionCheckClientInfo setMiscConfigVersion(int i) {
        this.miscConfigVersion = i;
        setMiscConfigVersionIsSet(true);
        return this;
    }

    public void setMiscConfigVersionIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public XmPushActionCheckClientInfo setPluginConfigVersion(int i) {
        this.pluginConfigVersion = i;
        setPluginConfigVersionIsSet(true);
        return this;
    }

    public void setPluginConfigVersionIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("XmPushActionCheckClientInfo(");
        sb.append("miscConfigVersion:");
        sb.append(this.miscConfigVersion);
        sb.append(", ");
        sb.append("pluginConfigVersion:");
        sb.append(this.pluginConfigVersion);
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        tProtocol.writeFieldBegin(MISC_CONFIG_VERSION_FIELD_DESC);
        tProtocol.writeI32(this.miscConfigVersion);
        tProtocol.writeFieldEnd();
        tProtocol.writeFieldBegin(PLUGIN_CONFIG_VERSION_FIELD_DESC);
        tProtocol.writeI32(this.pluginConfigVersion);
        tProtocol.writeFieldEnd();
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
