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

public class XmPushActionSendMessage implements Serializable, Cloneable, TBase<XmPushActionSendMessage, Object> {
    private static final TField ALIAS_NAME_FIELD_DESC = new TField("", 11, 7);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 11);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField MESSAGE_FIELD_DESC = new TField("", 12, 8);
    private static final TField NEED_ACK_FIELD_DESC = new TField("", 2, 9);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 5);
    private static final TField PARAMS_FIELD_DESC = new TField("", 13, 10);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionSendMessage");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TOPIC_FIELD_DESC = new TField("", 11, 6);
    private static final TField USER_ACCOUNT_FIELD_DESC = new TField("", 11, 12);
    private BitSet __isset_bit_vector = new BitSet(1);
    public String aliasName;
    public String appId;
    public String category;
    public String debug;
    public String id;
    public PushMessage message;
    public boolean needAck = true;
    public String packageName;
    public Map<String, String> params;
    public Target target;
    public String topic;
    public String userAccount;

    public int compareTo(XmPushActionSendMessage xmPushActionSendMessage) {
        if (!getClass().equals(xmPushActionSendMessage.getClass())) {
            return getClass().getName().compareTo(xmPushActionSendMessage.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionSendMessage.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionSendMessage.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionSendMessage.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionSendMessage.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetPackageName()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetPackageName()) {
            int compareTo10 = TBaseHelper.compareTo(this.packageName, xmPushActionSendMessage.packageName);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetTopic()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetTopic()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetTopic()) {
            int compareTo12 = TBaseHelper.compareTo(this.topic, xmPushActionSendMessage.topic);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetAliasName()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetAliasName()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetAliasName()) {
            int compareTo14 = TBaseHelper.compareTo(this.aliasName, xmPushActionSendMessage.aliasName);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetMessage()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetMessage()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetMessage()) {
            int compareTo16 = TBaseHelper.compareTo((Comparable) this.message, (Comparable) xmPushActionSendMessage.message);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetNeedAck()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetNeedAck()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetNeedAck()) {
            int compareTo18 = TBaseHelper.compareTo(this.needAck, xmPushActionSendMessage.needAck);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetParams()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetParams()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetParams()) {
            int compareTo20 = TBaseHelper.compareTo((Map) this.params, (Map) xmPushActionSendMessage.params);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetCategory()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetCategory()) {
            int compareTo22 = TBaseHelper.compareTo(this.category, xmPushActionSendMessage.category);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetUserAccount()).compareTo(Boolean.valueOf(xmPushActionSendMessage.isSetUserAccount()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetUserAccount()) {
            int compareTo24 = TBaseHelper.compareTo(this.userAccount, xmPushActionSendMessage.userAccount);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionSendMessage xmPushActionSendMessage) {
        if (xmPushActionSendMessage == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionSendMessage.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionSendMessage.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionSendMessage.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionSendMessage.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionSendMessage.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionSendMessage.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionSendMessage.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionSendMessage.appId))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionSendMessage.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionSendMessage.packageName))) {
            return false;
        }
        boolean isSetTopic = isSetTopic();
        boolean isSetTopic2 = xmPushActionSendMessage.isSetTopic();
        if ((isSetTopic || isSetTopic2) && (!isSetTopic || !isSetTopic2 || !this.topic.equals(xmPushActionSendMessage.topic))) {
            return false;
        }
        boolean isSetAliasName = isSetAliasName();
        boolean isSetAliasName2 = xmPushActionSendMessage.isSetAliasName();
        if ((isSetAliasName || isSetAliasName2) && (!isSetAliasName || !isSetAliasName2 || !this.aliasName.equals(xmPushActionSendMessage.aliasName))) {
            return false;
        }
        boolean isSetMessage = isSetMessage();
        boolean isSetMessage2 = xmPushActionSendMessage.isSetMessage();
        if ((isSetMessage || isSetMessage2) && (!isSetMessage || !isSetMessage2 || !this.message.equals(xmPushActionSendMessage.message))) {
            return false;
        }
        boolean isSetNeedAck = isSetNeedAck();
        boolean isSetNeedAck2 = xmPushActionSendMessage.isSetNeedAck();
        if ((isSetNeedAck || isSetNeedAck2) && (!isSetNeedAck || !isSetNeedAck2 || this.needAck != xmPushActionSendMessage.needAck)) {
            return false;
        }
        boolean isSetParams = isSetParams();
        boolean isSetParams2 = xmPushActionSendMessage.isSetParams();
        if ((isSetParams || isSetParams2) && (!isSetParams || !isSetParams2 || !this.params.equals(xmPushActionSendMessage.params))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionSendMessage.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(xmPushActionSendMessage.category))) {
            return false;
        }
        boolean isSetUserAccount = isSetUserAccount();
        boolean isSetUserAccount2 = xmPushActionSendMessage.isSetUserAccount();
        return (!isSetUserAccount && !isSetUserAccount2) || (isSetUserAccount && isSetUserAccount2 && this.userAccount.equals(xmPushActionSendMessage.userAccount));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionSendMessage)) {
            return equals((XmPushActionSendMessage) obj);
        }
        return false;
    }

    public String getAliasName() {
        return this.aliasName;
    }

    public String getAppId() {
        return this.appId;
    }

    public String getCategory() {
        return this.category;
    }

    public String getId() {
        return this.id;
    }

    public PushMessage getMessage() {
        return this.message;
    }

    public String getTopic() {
        return this.topic;
    }

    public String getUserAccount() {
        return this.userAccount;
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

    public boolean isSetDebug() {
        return this.debug != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetMessage() {
        return this.message != null;
    }

    public boolean isSetNeedAck() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetParams() {
        return this.params != null;
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
                        this.packageName = tProtocol.readString();
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
                        this.message = new PushMessage();
                        this.message.read(tProtocol);
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.needAck = tProtocol.readBool();
                        setNeedAckIsSet(true);
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 13) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TMap readMapBegin = tProtocol.readMapBegin();
                        this.params = new HashMap(readMapBegin.size * 2);
                        for (int i = 0; i < readMapBegin.size; i++) {
                            this.params.put(tProtocol.readString(), tProtocol.readString());
                        }
                        tProtocol.readMapEnd();
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
                case 12:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.userAccount = tProtocol.readString();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public void setNeedAckIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionSendMessage(");
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
        if (isSetPackageName()) {
            sb.append(", ");
            sb.append("packageName:");
            if (this.packageName == null) {
                sb.append("null");
            } else {
                sb.append(this.packageName);
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
        if (isSetAliasName()) {
            sb.append(", ");
            sb.append("aliasName:");
            if (this.aliasName == null) {
                sb.append("null");
            } else {
                sb.append(this.aliasName);
            }
        }
        if (isSetMessage()) {
            sb.append(", ");
            sb.append("message:");
            if (this.message == null) {
                sb.append("null");
            } else {
                sb.append(this.message);
            }
        }
        if (isSetNeedAck()) {
            sb.append(", ");
            sb.append("needAck:");
            sb.append(this.needAck);
        }
        if (isSetParams()) {
            sb.append(", ");
            sb.append("params:");
            if (this.params == null) {
                sb.append("null");
            } else {
                sb.append(this.params);
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
        if (isSetUserAccount()) {
            sb.append(", ");
            sb.append("userAccount:");
            if (this.userAccount == null) {
                sb.append("null");
            } else {
                sb.append(this.userAccount);
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
        if (this.packageName != null && isSetPackageName()) {
            tProtocol.writeFieldBegin(PACKAGE_NAME_FIELD_DESC);
            tProtocol.writeString(this.packageName);
            tProtocol.writeFieldEnd();
        }
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
        if (this.message != null && isSetMessage()) {
            tProtocol.writeFieldBegin(MESSAGE_FIELD_DESC);
            this.message.write(tProtocol);
            tProtocol.writeFieldEnd();
        }
        if (isSetNeedAck()) {
            tProtocol.writeFieldBegin(NEED_ACK_FIELD_DESC);
            tProtocol.writeBool(this.needAck);
            tProtocol.writeFieldEnd();
        }
        if (this.params != null && isSetParams()) {
            tProtocol.writeFieldBegin(PARAMS_FIELD_DESC);
            tProtocol.writeMapBegin(new TMap(11, 11, this.params.size()));
            for (Entry entry : this.params.entrySet()) {
                tProtocol.writeString((String) entry.getKey());
                tProtocol.writeString((String) entry.getValue());
            }
            tProtocol.writeMapEnd();
            tProtocol.writeFieldEnd();
        }
        if (this.category != null && isSetCategory()) {
            tProtocol.writeFieldBegin(CATEGORY_FIELD_DESC);
            tProtocol.writeString(this.category);
            tProtocol.writeFieldEnd();
        }
        if (this.userAccount != null && isSetUserAccount()) {
            tProtocol.writeFieldBegin(USER_ACCOUNT_FIELD_DESC);
            tProtocol.writeString(this.userAccount);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
