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

public class Target implements Serializable, Cloneable, TBase<Target, Object> {
    private static final TField CHANNEL_ID_FIELD_DESC = new TField("", 10, 1);
    private static final TField IS_PREVIEW_FIELD_DESC = new TField("", 2, 5);
    private static final TField RESOURCE_FIELD_DESC = new TField("", 11, 4);
    private static final TField SERVER_FIELD_DESC = new TField("", 11, 3);
    private static final TStruct STRUCT_DESC = new TStruct("Target");
    private static final TField TOKEN_FIELD_DESC = new TField("", 11, 7);
    private static final TField USER_ID_FIELD_DESC = new TField("", 11, 2);
    private BitSet __isset_bit_vector = new BitSet(2);
    public long channelId = 5;
    public boolean isPreview = false;
    public String resource = "";
    public String server = "xiaomi.com";
    public String token;
    public String userId;

    public int compareTo(Target target) {
        if (!getClass().equals(target.getClass())) {
            return getClass().getName().compareTo(target.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetChannelId()).compareTo(Boolean.valueOf(target.isSetChannelId()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetChannelId()) {
            int compareTo2 = TBaseHelper.compareTo(this.channelId, target.channelId);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetUserId()).compareTo(Boolean.valueOf(target.isSetUserId()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetUserId()) {
            int compareTo4 = TBaseHelper.compareTo(this.userId, target.userId);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetServer()).compareTo(Boolean.valueOf(target.isSetServer()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetServer()) {
            int compareTo6 = TBaseHelper.compareTo(this.server, target.server);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetResource()).compareTo(Boolean.valueOf(target.isSetResource()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetResource()) {
            int compareTo8 = TBaseHelper.compareTo(this.resource, target.resource);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetIsPreview()).compareTo(Boolean.valueOf(target.isSetIsPreview()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetIsPreview()) {
            int compareTo10 = TBaseHelper.compareTo(this.isPreview, target.isPreview);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetToken()).compareTo(Boolean.valueOf(target.isSetToken()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetToken()) {
            int compareTo12 = TBaseHelper.compareTo(this.token, target.token);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        return 0;
    }

    public boolean equals(Target target) {
        if (target == null || this.channelId != target.channelId) {
            return false;
        }
        boolean isSetUserId = isSetUserId();
        boolean isSetUserId2 = target.isSetUserId();
        if ((isSetUserId || isSetUserId2) && (!isSetUserId || !isSetUserId2 || !this.userId.equals(target.userId))) {
            return false;
        }
        boolean isSetServer = isSetServer();
        boolean isSetServer2 = target.isSetServer();
        if ((isSetServer || isSetServer2) && (!isSetServer || !isSetServer2 || !this.server.equals(target.server))) {
            return false;
        }
        boolean isSetResource = isSetResource();
        boolean isSetResource2 = target.isSetResource();
        if ((isSetResource || isSetResource2) && (!isSetResource || !isSetResource2 || !this.resource.equals(target.resource))) {
            return false;
        }
        boolean isSetIsPreview = isSetIsPreview();
        boolean isSetIsPreview2 = target.isSetIsPreview();
        if ((isSetIsPreview || isSetIsPreview2) && (!isSetIsPreview || !isSetIsPreview2 || this.isPreview != target.isPreview)) {
            return false;
        }
        boolean isSetToken = isSetToken();
        boolean isSetToken2 = target.isSetToken();
        return (!isSetToken && !isSetToken2) || (isSetToken && isSetToken2 && this.token.equals(target.token));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof Target)) {
            return equals((Target) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetChannelId() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetIsPreview() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetResource() {
        return this.resource != null;
    }

    public boolean isSetServer() {
        return this.server != null;
    }

    public boolean isSetToken() {
        return this.token != null;
    }

    public boolean isSetUserId() {
        return this.userId != null;
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetChannelId()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'channelId' was not found in serialized data! Struct: ");
                sb.append(toString());
                throw new TProtocolException(sb.toString());
            }
            short s = readFieldBegin.id;
            if (s != 7) {
                switch (s) {
                    case 1:
                        if (readFieldBegin.type != 10) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.channelId = tProtocol.readI64();
                            setChannelIdIsSet(true);
                            break;
                        }
                    case 2:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.userId = tProtocol.readString();
                            break;
                        }
                    case 3:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.server = tProtocol.readString();
                            break;
                        }
                    case 4:
                        if (readFieldBegin.type != 11) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.resource = tProtocol.readString();
                            break;
                        }
                    case 5:
                        if (readFieldBegin.type != 2) {
                            TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                            break;
                        } else {
                            this.isPreview = tProtocol.readBool();
                            setIsPreviewIsSet(true);
                            break;
                        }
                    default:
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                }
            } else if (readFieldBegin.type == 11) {
                this.token = tProtocol.readString();
            } else {
                TProtocolUtil.skip(tProtocol, readFieldBegin.type);
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setChannelIdIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setIsPreviewIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Target(");
        sb.append("channelId:");
        sb.append(this.channelId);
        sb.append(", ");
        sb.append("userId:");
        if (this.userId == null) {
            sb.append("null");
        } else {
            sb.append(this.userId);
        }
        if (isSetServer()) {
            sb.append(", ");
            sb.append("server:");
            if (this.server == null) {
                sb.append("null");
            } else {
                sb.append(this.server);
            }
        }
        if (isSetResource()) {
            sb.append(", ");
            sb.append("resource:");
            if (this.resource == null) {
                sb.append("null");
            } else {
                sb.append(this.resource);
            }
        }
        if (isSetIsPreview()) {
            sb.append(", ");
            sb.append("isPreview:");
            sb.append(this.isPreview);
        }
        if (isSetToken()) {
            sb.append(", ");
            sb.append("token:");
            if (this.token == null) {
                sb.append("null");
            } else {
                sb.append(this.token);
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.userId == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'userId' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        tProtocol.writeFieldBegin(CHANNEL_ID_FIELD_DESC);
        tProtocol.writeI64(this.channelId);
        tProtocol.writeFieldEnd();
        if (this.userId != null) {
            tProtocol.writeFieldBegin(USER_ID_FIELD_DESC);
            tProtocol.writeString(this.userId);
            tProtocol.writeFieldEnd();
        }
        if (this.server != null && isSetServer()) {
            tProtocol.writeFieldBegin(SERVER_FIELD_DESC);
            tProtocol.writeString(this.server);
            tProtocol.writeFieldEnd();
        }
        if (this.resource != null && isSetResource()) {
            tProtocol.writeFieldBegin(RESOURCE_FIELD_DESC);
            tProtocol.writeString(this.resource);
            tProtocol.writeFieldEnd();
        }
        if (isSetIsPreview()) {
            tProtocol.writeFieldBegin(IS_PREVIEW_FIELD_DESC);
            tProtocol.writeBool(this.isPreview);
            tProtocol.writeFieldEnd();
        }
        if (this.token != null && isSetToken()) {
            tProtocol.writeFieldBegin(TOKEN_FIELD_DESC);
            tProtocol.writeString(this.token);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
