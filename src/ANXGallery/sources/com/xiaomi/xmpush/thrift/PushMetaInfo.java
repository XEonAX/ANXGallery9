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

public class PushMetaInfo implements Serializable, Cloneable, TBase<PushMetaInfo, Object> {
    private static final TField APS_PROPER_FIELDS_FIELD_DESC = new TField("", 13, 13);
    private static final TField DESCRIPTION_FIELD_DESC = new TField("", 11, 5);
    private static final TField EXTRA_FIELD_DESC = new TField("", 13, 10);
    private static final TField ID_FIELD_DESC = new TField("", 11, 1);
    private static final TField IGNORE_REG_INFO_FIELD_DESC = new TField("", 2, 12);
    private static final TField INTERNAL_FIELD_DESC = new TField("", 13, 11);
    private static final TField MESSAGE_TS_FIELD_DESC = new TField("", 10, 2);
    private static final TField NOTIFY_ID_FIELD_DESC = new TField("", 8, 9);
    private static final TField NOTIFY_TYPE_FIELD_DESC = new TField("", 8, 6);
    private static final TField PASS_THROUGH_FIELD_DESC = new TField("", 8, 8);
    private static final TStruct STRUCT_DESC = new TStruct("PushMetaInfo");
    private static final TField TITLE_FIELD_DESC = new TField("", 11, 4);
    private static final TField TOPIC_FIELD_DESC = new TField("", 11, 3);
    private static final TField URL_FIELD_DESC = new TField("", 11, 7);
    private BitSet __isset_bit_vector;
    public Map<String, String> apsProperFields;
    public String description;
    public Map<String, String> extra;
    public String id;
    public boolean ignoreRegInfo;
    public Map<String, String> internal;
    public long messageTs;
    public int notifyId;
    public int notifyType;
    public int passThrough;
    public String title;
    public String topic;
    public String url;

    public PushMetaInfo() {
        this.__isset_bit_vector = new BitSet(5);
        this.ignoreRegInfo = false;
    }

    public PushMetaInfo(PushMetaInfo pushMetaInfo) {
        this.__isset_bit_vector = new BitSet(5);
        this.__isset_bit_vector.clear();
        this.__isset_bit_vector.or(pushMetaInfo.__isset_bit_vector);
        if (pushMetaInfo.isSetId()) {
            this.id = pushMetaInfo.id;
        }
        this.messageTs = pushMetaInfo.messageTs;
        if (pushMetaInfo.isSetTopic()) {
            this.topic = pushMetaInfo.topic;
        }
        if (pushMetaInfo.isSetTitle()) {
            this.title = pushMetaInfo.title;
        }
        if (pushMetaInfo.isSetDescription()) {
            this.description = pushMetaInfo.description;
        }
        this.notifyType = pushMetaInfo.notifyType;
        if (pushMetaInfo.isSetUrl()) {
            this.url = pushMetaInfo.url;
        }
        this.passThrough = pushMetaInfo.passThrough;
        this.notifyId = pushMetaInfo.notifyId;
        if (pushMetaInfo.isSetExtra()) {
            HashMap hashMap = new HashMap();
            for (Entry entry : pushMetaInfo.extra.entrySet()) {
                hashMap.put((String) entry.getKey(), (String) entry.getValue());
            }
            this.extra = hashMap;
        }
        if (pushMetaInfo.isSetInternal()) {
            HashMap hashMap2 = new HashMap();
            for (Entry entry2 : pushMetaInfo.internal.entrySet()) {
                hashMap2.put((String) entry2.getKey(), (String) entry2.getValue());
            }
            this.internal = hashMap2;
        }
        this.ignoreRegInfo = pushMetaInfo.ignoreRegInfo;
        if (pushMetaInfo.isSetApsProperFields()) {
            HashMap hashMap3 = new HashMap();
            for (Entry entry3 : pushMetaInfo.apsProperFields.entrySet()) {
                hashMap3.put((String) entry3.getKey(), (String) entry3.getValue());
            }
            this.apsProperFields = hashMap3;
        }
    }

    public int compareTo(PushMetaInfo pushMetaInfo) {
        if (!getClass().equals(pushMetaInfo.getClass())) {
            return getClass().getName().compareTo(pushMetaInfo.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(pushMetaInfo.isSetId()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetId()) {
            int compareTo2 = TBaseHelper.compareTo(this.id, pushMetaInfo.id);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetMessageTs()).compareTo(Boolean.valueOf(pushMetaInfo.isSetMessageTs()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetMessageTs()) {
            int compareTo4 = TBaseHelper.compareTo(this.messageTs, pushMetaInfo.messageTs);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetTopic()).compareTo(Boolean.valueOf(pushMetaInfo.isSetTopic()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetTopic()) {
            int compareTo6 = TBaseHelper.compareTo(this.topic, pushMetaInfo.topic);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetTitle()).compareTo(Boolean.valueOf(pushMetaInfo.isSetTitle()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetTitle()) {
            int compareTo8 = TBaseHelper.compareTo(this.title, pushMetaInfo.title);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetDescription()).compareTo(Boolean.valueOf(pushMetaInfo.isSetDescription()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetDescription()) {
            int compareTo10 = TBaseHelper.compareTo(this.description, pushMetaInfo.description);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetNotifyType()).compareTo(Boolean.valueOf(pushMetaInfo.isSetNotifyType()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetNotifyType()) {
            int compareTo12 = TBaseHelper.compareTo(this.notifyType, pushMetaInfo.notifyType);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetUrl()).compareTo(Boolean.valueOf(pushMetaInfo.isSetUrl()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetUrl()) {
            int compareTo14 = TBaseHelper.compareTo(this.url, pushMetaInfo.url);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetPassThrough()).compareTo(Boolean.valueOf(pushMetaInfo.isSetPassThrough()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetPassThrough()) {
            int compareTo16 = TBaseHelper.compareTo(this.passThrough, pushMetaInfo.passThrough);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetNotifyId()).compareTo(Boolean.valueOf(pushMetaInfo.isSetNotifyId()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetNotifyId()) {
            int compareTo18 = TBaseHelper.compareTo(this.notifyId, pushMetaInfo.notifyId);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetExtra()).compareTo(Boolean.valueOf(pushMetaInfo.isSetExtra()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetExtra()) {
            int compareTo20 = TBaseHelper.compareTo((Map) this.extra, (Map) pushMetaInfo.extra);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetInternal()).compareTo(Boolean.valueOf(pushMetaInfo.isSetInternal()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetInternal()) {
            int compareTo22 = TBaseHelper.compareTo((Map) this.internal, (Map) pushMetaInfo.internal);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        int compareTo23 = Boolean.valueOf(isSetIgnoreRegInfo()).compareTo(Boolean.valueOf(pushMetaInfo.isSetIgnoreRegInfo()));
        if (compareTo23 != 0) {
            return compareTo23;
        }
        if (isSetIgnoreRegInfo()) {
            int compareTo24 = TBaseHelper.compareTo(this.ignoreRegInfo, pushMetaInfo.ignoreRegInfo);
            if (compareTo24 != 0) {
                return compareTo24;
            }
        }
        int compareTo25 = Boolean.valueOf(isSetApsProperFields()).compareTo(Boolean.valueOf(pushMetaInfo.isSetApsProperFields()));
        if (compareTo25 != 0) {
            return compareTo25;
        }
        if (isSetApsProperFields()) {
            int compareTo26 = TBaseHelper.compareTo((Map) this.apsProperFields, (Map) pushMetaInfo.apsProperFields);
            if (compareTo26 != 0) {
                return compareTo26;
            }
        }
        return 0;
    }

    public PushMetaInfo deepCopy() {
        return new PushMetaInfo(this);
    }

    public boolean equals(PushMetaInfo pushMetaInfo) {
        if (pushMetaInfo == null) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = pushMetaInfo.isSetId();
        if (((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(pushMetaInfo.id))) || this.messageTs != pushMetaInfo.messageTs) {
            return false;
        }
        boolean isSetTopic = isSetTopic();
        boolean isSetTopic2 = pushMetaInfo.isSetTopic();
        if ((isSetTopic || isSetTopic2) && (!isSetTopic || !isSetTopic2 || !this.topic.equals(pushMetaInfo.topic))) {
            return false;
        }
        boolean isSetTitle = isSetTitle();
        boolean isSetTitle2 = pushMetaInfo.isSetTitle();
        if ((isSetTitle || isSetTitle2) && (!isSetTitle || !isSetTitle2 || !this.title.equals(pushMetaInfo.title))) {
            return false;
        }
        boolean isSetDescription = isSetDescription();
        boolean isSetDescription2 = pushMetaInfo.isSetDescription();
        if ((isSetDescription || isSetDescription2) && (!isSetDescription || !isSetDescription2 || !this.description.equals(pushMetaInfo.description))) {
            return false;
        }
        boolean isSetNotifyType = isSetNotifyType();
        boolean isSetNotifyType2 = pushMetaInfo.isSetNotifyType();
        if ((isSetNotifyType || isSetNotifyType2) && (!isSetNotifyType || !isSetNotifyType2 || this.notifyType != pushMetaInfo.notifyType)) {
            return false;
        }
        boolean isSetUrl = isSetUrl();
        boolean isSetUrl2 = pushMetaInfo.isSetUrl();
        if ((isSetUrl || isSetUrl2) && (!isSetUrl || !isSetUrl2 || !this.url.equals(pushMetaInfo.url))) {
            return false;
        }
        boolean isSetPassThrough = isSetPassThrough();
        boolean isSetPassThrough2 = pushMetaInfo.isSetPassThrough();
        if ((isSetPassThrough || isSetPassThrough2) && (!isSetPassThrough || !isSetPassThrough2 || this.passThrough != pushMetaInfo.passThrough)) {
            return false;
        }
        boolean isSetNotifyId = isSetNotifyId();
        boolean isSetNotifyId2 = pushMetaInfo.isSetNotifyId();
        if ((isSetNotifyId || isSetNotifyId2) && (!isSetNotifyId || !isSetNotifyId2 || this.notifyId != pushMetaInfo.notifyId)) {
            return false;
        }
        boolean isSetExtra = isSetExtra();
        boolean isSetExtra2 = pushMetaInfo.isSetExtra();
        if ((isSetExtra || isSetExtra2) && (!isSetExtra || !isSetExtra2 || !this.extra.equals(pushMetaInfo.extra))) {
            return false;
        }
        boolean isSetInternal = isSetInternal();
        boolean isSetInternal2 = pushMetaInfo.isSetInternal();
        if ((isSetInternal || isSetInternal2) && (!isSetInternal || !isSetInternal2 || !this.internal.equals(pushMetaInfo.internal))) {
            return false;
        }
        boolean isSetIgnoreRegInfo = isSetIgnoreRegInfo();
        boolean isSetIgnoreRegInfo2 = pushMetaInfo.isSetIgnoreRegInfo();
        if ((isSetIgnoreRegInfo || isSetIgnoreRegInfo2) && (!isSetIgnoreRegInfo || !isSetIgnoreRegInfo2 || this.ignoreRegInfo != pushMetaInfo.ignoreRegInfo)) {
            return false;
        }
        boolean isSetApsProperFields = isSetApsProperFields();
        boolean isSetApsProperFields2 = pushMetaInfo.isSetApsProperFields();
        return (!isSetApsProperFields && !isSetApsProperFields2) || (isSetApsProperFields && isSetApsProperFields2 && this.apsProperFields.equals(pushMetaInfo.apsProperFields));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof PushMetaInfo)) {
            return equals((PushMetaInfo) obj);
        }
        return false;
    }

    public String getDescription() {
        return this.description;
    }

    public Map<String, String> getExtra() {
        return this.extra;
    }

    public String getId() {
        return this.id;
    }

    public Map<String, String> getInternal() {
        return this.internal;
    }

    public long getMessageTs() {
        return this.messageTs;
    }

    public int getNotifyId() {
        return this.notifyId;
    }

    public int getNotifyType() {
        return this.notifyType;
    }

    public int getPassThrough() {
        return this.passThrough;
    }

    public String getTitle() {
        return this.title;
    }

    public String getTopic() {
        return this.topic;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isIgnoreRegInfo() {
        return this.ignoreRegInfo;
    }

    public boolean isSetApsProperFields() {
        return this.apsProperFields != null;
    }

    public boolean isSetDescription() {
        return this.description != null;
    }

    public boolean isSetExtra() {
        return this.extra != null;
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetIgnoreRegInfo() {
        return this.__isset_bit_vector.get(4);
    }

    public boolean isSetInternal() {
        return this.internal != null;
    }

    public boolean isSetMessageTs() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetNotifyId() {
        return this.__isset_bit_vector.get(3);
    }

    public boolean isSetNotifyType() {
        return this.__isset_bit_vector.get(1);
    }

    public boolean isSetPassThrough() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetTitle() {
        return this.title != null;
    }

    public boolean isSetTopic() {
        return this.topic != null;
    }

    public boolean isSetUrl() {
        return this.url != null;
    }

    public void putToExtra(String str, String str2) {
        if (this.extra == null) {
            this.extra = new HashMap();
        }
        this.extra.put(str, str2);
    }

    public void putToInternal(String str, String str2) {
        if (this.internal == null) {
            this.internal = new HashMap();
        }
        this.internal.put(str, str2);
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetMessageTs()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'messageTs' was not found in serialized data! Struct: ");
                sb.append(toString());
                throw new TProtocolException(sb.toString());
            }
            int i = 0;
            switch (readFieldBegin.id) {
                case 1:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.id = tProtocol.readString();
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.messageTs = tProtocol.readI64();
                        setMessageTsIsSet(true);
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.topic = tProtocol.readString();
                        break;
                    }
                case 4:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.title = tProtocol.readString();
                        break;
                    }
                case 5:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.description = tProtocol.readString();
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.notifyType = tProtocol.readI32();
                        setNotifyTypeIsSet(true);
                        break;
                    }
                case 7:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.url = tProtocol.readString();
                        break;
                    }
                case 8:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.passThrough = tProtocol.readI32();
                        setPassThroughIsSet(true);
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.notifyId = tProtocol.readI32();
                        setNotifyIdIsSet(true);
                        break;
                    }
                case 10:
                    if (readFieldBegin.type != 13) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TMap readMapBegin = tProtocol.readMapBegin();
                        this.extra = new HashMap(readMapBegin.size * 2);
                        while (i < readMapBegin.size) {
                            this.extra.put(tProtocol.readString(), tProtocol.readString());
                            i++;
                        }
                        tProtocol.readMapEnd();
                        break;
                    }
                case 11:
                    if (readFieldBegin.type != 13) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TMap readMapBegin2 = tProtocol.readMapBegin();
                        this.internal = new HashMap(readMapBegin2.size * 2);
                        while (i < readMapBegin2.size) {
                            this.internal.put(tProtocol.readString(), tProtocol.readString());
                            i++;
                        }
                        tProtocol.readMapEnd();
                        break;
                    }
                case 12:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.ignoreRegInfo = tProtocol.readBool();
                        setIgnoreRegInfoIsSet(true);
                        break;
                    }
                case 13:
                    if (readFieldBegin.type != 13) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TMap readMapBegin3 = tProtocol.readMapBegin();
                        this.apsProperFields = new HashMap(readMapBegin3.size * 2);
                        while (i < readMapBegin3.size) {
                            this.apsProperFields.put(tProtocol.readString(), tProtocol.readString());
                            i++;
                        }
                        tProtocol.readMapEnd();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public PushMetaInfo setId(String str) {
        this.id = str;
        return this;
    }

    public void setIgnoreRegInfoIsSet(boolean z) {
        this.__isset_bit_vector.set(4, z);
    }

    public void setMessageTsIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public void setNotifyIdIsSet(boolean z) {
        this.__isset_bit_vector.set(3, z);
    }

    public void setNotifyTypeIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public void setPassThroughIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("PushMetaInfo(");
        sb.append("id:");
        if (this.id == null) {
            sb.append("null");
        } else {
            sb.append(this.id);
        }
        sb.append(", ");
        sb.append("messageTs:");
        sb.append(this.messageTs);
        if (isSetTopic()) {
            sb.append(", ");
            sb.append("topic:");
            if (this.topic == null) {
                sb.append("null");
            } else {
                sb.append(this.topic);
            }
        }
        if (isSetTitle()) {
            sb.append(", ");
            sb.append("title:");
            if (this.title == null) {
                sb.append("null");
            } else {
                sb.append(this.title);
            }
        }
        if (isSetDescription()) {
            sb.append(", ");
            sb.append("description:");
            if (this.description == null) {
                sb.append("null");
            } else {
                sb.append(this.description);
            }
        }
        if (isSetNotifyType()) {
            sb.append(", ");
            sb.append("notifyType:");
            sb.append(this.notifyType);
        }
        if (isSetUrl()) {
            sb.append(", ");
            sb.append("url:");
            if (this.url == null) {
                sb.append("null");
            } else {
                sb.append(this.url);
            }
        }
        if (isSetPassThrough()) {
            sb.append(", ");
            sb.append("passThrough:");
            sb.append(this.passThrough);
        }
        if (isSetNotifyId()) {
            sb.append(", ");
            sb.append("notifyId:");
            sb.append(this.notifyId);
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
        if (isSetInternal()) {
            sb.append(", ");
            sb.append("internal:");
            if (this.internal == null) {
                sb.append("null");
            } else {
                sb.append(this.internal);
            }
        }
        if (isSetIgnoreRegInfo()) {
            sb.append(", ");
            sb.append("ignoreRegInfo:");
            sb.append(this.ignoreRegInfo);
        }
        if (isSetApsProperFields()) {
            sb.append(", ");
            sb.append("apsProperFields:");
            if (this.apsProperFields == null) {
                sb.append("null");
            } else {
                sb.append(this.apsProperFields);
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
        if (this.id != null) {
            tProtocol.writeFieldBegin(ID_FIELD_DESC);
            tProtocol.writeString(this.id);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldBegin(MESSAGE_TS_FIELD_DESC);
        tProtocol.writeI64(this.messageTs);
        tProtocol.writeFieldEnd();
        if (this.topic != null && isSetTopic()) {
            tProtocol.writeFieldBegin(TOPIC_FIELD_DESC);
            tProtocol.writeString(this.topic);
            tProtocol.writeFieldEnd();
        }
        if (this.title != null && isSetTitle()) {
            tProtocol.writeFieldBegin(TITLE_FIELD_DESC);
            tProtocol.writeString(this.title);
            tProtocol.writeFieldEnd();
        }
        if (this.description != null && isSetDescription()) {
            tProtocol.writeFieldBegin(DESCRIPTION_FIELD_DESC);
            tProtocol.writeString(this.description);
            tProtocol.writeFieldEnd();
        }
        if (isSetNotifyType()) {
            tProtocol.writeFieldBegin(NOTIFY_TYPE_FIELD_DESC);
            tProtocol.writeI32(this.notifyType);
            tProtocol.writeFieldEnd();
        }
        if (this.url != null && isSetUrl()) {
            tProtocol.writeFieldBegin(URL_FIELD_DESC);
            tProtocol.writeString(this.url);
            tProtocol.writeFieldEnd();
        }
        if (isSetPassThrough()) {
            tProtocol.writeFieldBegin(PASS_THROUGH_FIELD_DESC);
            tProtocol.writeI32(this.passThrough);
            tProtocol.writeFieldEnd();
        }
        if (isSetNotifyId()) {
            tProtocol.writeFieldBegin(NOTIFY_ID_FIELD_DESC);
            tProtocol.writeI32(this.notifyId);
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
        if (this.internal != null && isSetInternal()) {
            tProtocol.writeFieldBegin(INTERNAL_FIELD_DESC);
            tProtocol.writeMapBegin(new TMap(11, 11, this.internal.size()));
            for (Entry entry2 : this.internal.entrySet()) {
                tProtocol.writeString((String) entry2.getKey());
                tProtocol.writeString((String) entry2.getValue());
            }
            tProtocol.writeMapEnd();
            tProtocol.writeFieldEnd();
        }
        if (isSetIgnoreRegInfo()) {
            tProtocol.writeFieldBegin(IGNORE_REG_INFO_FIELD_DESC);
            tProtocol.writeBool(this.ignoreRegInfo);
            tProtocol.writeFieldEnd();
        }
        if (this.apsProperFields != null && isSetApsProperFields()) {
            tProtocol.writeFieldBegin(APS_PROPER_FIELDS_FIELD_DESC);
            tProtocol.writeMapBegin(new TMap(11, 11, this.apsProperFields.size()));
            for (Entry entry3 : this.apsProperFields.entrySet()) {
                tProtocol.writeString((String) entry3.getKey());
                tProtocol.writeString((String) entry3.getValue());
            }
            tProtocol.writeMapEnd();
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
