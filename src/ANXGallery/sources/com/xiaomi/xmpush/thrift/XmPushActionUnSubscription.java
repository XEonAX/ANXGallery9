package com.xiaomi.xmpush.thrift;

import java.io.Serializable;
import java.util.ArrayList;
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

public class XmPushActionUnSubscription implements Serializable, Cloneable, TBase<XmPushActionUnSubscription, Object> {
    private static final TField ALIASES_FIELD_DESC = new TField("", 15, 8);
    private static final TField APP_ID_FIELD_DESC = new TField("", 11, 4);
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 7);
    private static final TField DEBUG_FIELD_DESC = new TField("", 11, 1);
    private static final TField ID_FIELD_DESC = new TField("", 11, 3);
    private static final TField PACKAGE_NAME_FIELD_DESC = new TField("", 11, 6);
    private static final TStruct STRUCT_DESC = new TStruct("XmPushActionUnSubscription");
    private static final TField TARGET_FIELD_DESC = new TField("", 12, 2);
    private static final TField TOPIC_FIELD_DESC = new TField("", 11, 5);
    public List<String> aliases;
    public String appId;
    public String category;
    public String debug;
    public String id;
    public String packageName;
    public Target target;
    public String topic;

    public int compareTo(XmPushActionUnSubscription xmPushActionUnSubscription) {
        if (!getClass().equals(xmPushActionUnSubscription.getClass())) {
            return getClass().getName().compareTo(xmPushActionUnSubscription.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetDebug()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetDebug()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetDebug()) {
            int compareTo2 = TBaseHelper.compareTo(this.debug, xmPushActionUnSubscription.debug);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetTarget()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetTarget()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetTarget()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.target, (Comparable) xmPushActionUnSubscription.target);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetId()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetId()) {
            int compareTo6 = TBaseHelper.compareTo(this.id, xmPushActionUnSubscription.id);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetAppId()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetAppId()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetAppId()) {
            int compareTo8 = TBaseHelper.compareTo(this.appId, xmPushActionUnSubscription.appId);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetTopic()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetTopic()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetTopic()) {
            int compareTo10 = TBaseHelper.compareTo(this.topic, xmPushActionUnSubscription.topic);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetPackageName()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetPackageName()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetPackageName()) {
            int compareTo12 = TBaseHelper.compareTo(this.packageName, xmPushActionUnSubscription.packageName);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetCategory()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetCategory()) {
            int compareTo14 = TBaseHelper.compareTo(this.category, xmPushActionUnSubscription.category);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetAliases()).compareTo(Boolean.valueOf(xmPushActionUnSubscription.isSetAliases()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetAliases()) {
            int compareTo16 = TBaseHelper.compareTo((List) this.aliases, (List) xmPushActionUnSubscription.aliases);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        return 0;
    }

    public boolean equals(XmPushActionUnSubscription xmPushActionUnSubscription) {
        if (xmPushActionUnSubscription == null) {
            return false;
        }
        boolean isSetDebug = isSetDebug();
        boolean isSetDebug2 = xmPushActionUnSubscription.isSetDebug();
        if ((isSetDebug || isSetDebug2) && (!isSetDebug || !isSetDebug2 || !this.debug.equals(xmPushActionUnSubscription.debug))) {
            return false;
        }
        boolean isSetTarget = isSetTarget();
        boolean isSetTarget2 = xmPushActionUnSubscription.isSetTarget();
        if ((isSetTarget || isSetTarget2) && (!isSetTarget || !isSetTarget2 || !this.target.equals(xmPushActionUnSubscription.target))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = xmPushActionUnSubscription.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(xmPushActionUnSubscription.id))) {
            return false;
        }
        boolean isSetAppId = isSetAppId();
        boolean isSetAppId2 = xmPushActionUnSubscription.isSetAppId();
        if ((isSetAppId || isSetAppId2) && (!isSetAppId || !isSetAppId2 || !this.appId.equals(xmPushActionUnSubscription.appId))) {
            return false;
        }
        boolean isSetTopic = isSetTopic();
        boolean isSetTopic2 = xmPushActionUnSubscription.isSetTopic();
        if ((isSetTopic || isSetTopic2) && (!isSetTopic || !isSetTopic2 || !this.topic.equals(xmPushActionUnSubscription.topic))) {
            return false;
        }
        boolean isSetPackageName = isSetPackageName();
        boolean isSetPackageName2 = xmPushActionUnSubscription.isSetPackageName();
        if ((isSetPackageName || isSetPackageName2) && (!isSetPackageName || !isSetPackageName2 || !this.packageName.equals(xmPushActionUnSubscription.packageName))) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = xmPushActionUnSubscription.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(xmPushActionUnSubscription.category))) {
            return false;
        }
        boolean isSetAliases = isSetAliases();
        boolean isSetAliases2 = xmPushActionUnSubscription.isSetAliases();
        return (!isSetAliases && !isSetAliases2) || (isSetAliases && isSetAliases2 && this.aliases.equals(xmPushActionUnSubscription.aliases));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof XmPushActionUnSubscription)) {
            return equals((XmPushActionUnSubscription) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetAliases() {
        return this.aliases != null;
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

    public boolean isSetPackageName() {
        return this.packageName != null;
    }

    public boolean isSetTarget() {
        return this.target != null;
    }

    public boolean isSetTopic() {
        return this.topic != null;
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
                        this.topic = tProtocol.readString();
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.packageName = tProtocol.readString();
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.category = tProtocol.readString();
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 15) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TList readListBegin = tProtocol.readListBegin();
                        this.aliases = new ArrayList(readListBegin.size);
                        for (int i = 0; i < readListBegin.size; i++) {
                            this.aliases.add(tProtocol.readString());
                        }
                        tProtocol.readListEnd();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public XmPushActionUnSubscription setAppId(String str) {
        this.appId = str;
        return this;
    }

    public XmPushActionUnSubscription setCategory(String str) {
        this.category = str;
        return this;
    }

    public XmPushActionUnSubscription setId(String str) {
        this.id = str;
        return this;
    }

    public XmPushActionUnSubscription setPackageName(String str) {
        this.packageName = str;
        return this;
    }

    public XmPushActionUnSubscription setTopic(String str) {
        this.topic = str;
        return this;
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("XmPushActionUnSubscription(");
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
        sb.append("topic:");
        if (this.topic == null) {
            sb.append("null");
        } else {
            sb.append(this.topic);
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
        if (isSetAliases()) {
            sb.append(", ");
            sb.append("aliases:");
            if (this.aliases == null) {
                sb.append("null");
            } else {
                sb.append(this.aliases);
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
        } else if (this.topic == null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Required field 'topic' was not present! Struct: ");
            sb3.append(toString());
            throw new TProtocolException(sb3.toString());
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
        if (this.topic != null) {
            tProtocol.writeFieldBegin(TOPIC_FIELD_DESC);
            tProtocol.writeString(this.topic);
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
        if (this.aliases != null && isSetAliases()) {
            tProtocol.writeFieldBegin(ALIASES_FIELD_DESC);
            tProtocol.writeListBegin(new TList(11, this.aliases.size()));
            for (String writeString : this.aliases) {
                tProtocol.writeString(writeString);
            }
            tProtocol.writeListEnd();
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
