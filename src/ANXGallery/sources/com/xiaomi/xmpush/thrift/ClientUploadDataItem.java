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
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;

public class ClientUploadDataItem implements Serializable, Cloneable, TBase<ClientUploadDataItem, Object> {
    private static final TField CATEGORY_FIELD_DESC = new TField("", 11, 7);
    private static final TField CHANNEL_FIELD_DESC = new TField("", 11, 1);
    private static final TField COUNTER_FIELD_DESC = new TField("", 10, 4);
    private static final TField DATA_FIELD_DESC = new TField("", 11, 2);
    private static final TField EXTRA_FIELD_DESC = new TField("", 13, 10);
    private static final TField FROM_SDK_FIELD_DESC = new TField("", 2, 6);
    private static final TField ID_FIELD_DESC = new TField("", 11, 9);
    private static final TField NAME_FIELD_DESC = new TField("", 11, 3);
    private static final TField PKG_NAME_FIELD_DESC = new TField("", 11, 11);
    private static final TField SOURCE_PACKAGE_FIELD_DESC = new TField("", 11, 8);
    private static final TStruct STRUCT_DESC = new TStruct("ClientUploadDataItem");
    private static final TField TIMESTAMP_FIELD_DESC = new TField("", 10, 5);
    private BitSet __isset_bit_vector = new BitSet(3);
    public String category;
    public String channel;
    public long counter;
    public String data;
    public Map<String, String> extra;
    public boolean fromSdk;
    public String id;
    public String name;
    public String pkgName;
    public String sourcePackage;
    public long timestamp;

    public int compareTo(ClientUploadDataItem clientUploadDataItem) {
        if (!getClass().equals(clientUploadDataItem.getClass())) {
            return getClass().getName().compareTo(clientUploadDataItem.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetChannel()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetChannel()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetChannel()) {
            int compareTo2 = TBaseHelper.compareTo(this.channel, clientUploadDataItem.channel);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetData()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetData()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetData()) {
            int compareTo4 = TBaseHelper.compareTo(this.data, clientUploadDataItem.data);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetName()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetName()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetName()) {
            int compareTo6 = TBaseHelper.compareTo(this.name, clientUploadDataItem.name);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        int compareTo7 = Boolean.valueOf(isSetCounter()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetCounter()));
        if (compareTo7 != 0) {
            return compareTo7;
        }
        if (isSetCounter()) {
            int compareTo8 = TBaseHelper.compareTo(this.counter, clientUploadDataItem.counter);
            if (compareTo8 != 0) {
                return compareTo8;
            }
        }
        int compareTo9 = Boolean.valueOf(isSetTimestamp()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetTimestamp()));
        if (compareTo9 != 0) {
            return compareTo9;
        }
        if (isSetTimestamp()) {
            int compareTo10 = TBaseHelper.compareTo(this.timestamp, clientUploadDataItem.timestamp);
            if (compareTo10 != 0) {
                return compareTo10;
            }
        }
        int compareTo11 = Boolean.valueOf(isSetFromSdk()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetFromSdk()));
        if (compareTo11 != 0) {
            return compareTo11;
        }
        if (isSetFromSdk()) {
            int compareTo12 = TBaseHelper.compareTo(this.fromSdk, clientUploadDataItem.fromSdk);
            if (compareTo12 != 0) {
                return compareTo12;
            }
        }
        int compareTo13 = Boolean.valueOf(isSetCategory()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetCategory()));
        if (compareTo13 != 0) {
            return compareTo13;
        }
        if (isSetCategory()) {
            int compareTo14 = TBaseHelper.compareTo(this.category, clientUploadDataItem.category);
            if (compareTo14 != 0) {
                return compareTo14;
            }
        }
        int compareTo15 = Boolean.valueOf(isSetSourcePackage()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetSourcePackage()));
        if (compareTo15 != 0) {
            return compareTo15;
        }
        if (isSetSourcePackage()) {
            int compareTo16 = TBaseHelper.compareTo(this.sourcePackage, clientUploadDataItem.sourcePackage);
            if (compareTo16 != 0) {
                return compareTo16;
            }
        }
        int compareTo17 = Boolean.valueOf(isSetId()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetId()));
        if (compareTo17 != 0) {
            return compareTo17;
        }
        if (isSetId()) {
            int compareTo18 = TBaseHelper.compareTo(this.id, clientUploadDataItem.id);
            if (compareTo18 != 0) {
                return compareTo18;
            }
        }
        int compareTo19 = Boolean.valueOf(isSetExtra()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetExtra()));
        if (compareTo19 != 0) {
            return compareTo19;
        }
        if (isSetExtra()) {
            int compareTo20 = TBaseHelper.compareTo((Map) this.extra, (Map) clientUploadDataItem.extra);
            if (compareTo20 != 0) {
                return compareTo20;
            }
        }
        int compareTo21 = Boolean.valueOf(isSetPkgName()).compareTo(Boolean.valueOf(clientUploadDataItem.isSetPkgName()));
        if (compareTo21 != 0) {
            return compareTo21;
        }
        if (isSetPkgName()) {
            int compareTo22 = TBaseHelper.compareTo(this.pkgName, clientUploadDataItem.pkgName);
            if (compareTo22 != 0) {
                return compareTo22;
            }
        }
        return 0;
    }

    public boolean equals(ClientUploadDataItem clientUploadDataItem) {
        if (clientUploadDataItem == null) {
            return false;
        }
        boolean isSetChannel = isSetChannel();
        boolean isSetChannel2 = clientUploadDataItem.isSetChannel();
        if ((isSetChannel || isSetChannel2) && (!isSetChannel || !isSetChannel2 || !this.channel.equals(clientUploadDataItem.channel))) {
            return false;
        }
        boolean isSetData = isSetData();
        boolean isSetData2 = clientUploadDataItem.isSetData();
        if ((isSetData || isSetData2) && (!isSetData || !isSetData2 || !this.data.equals(clientUploadDataItem.data))) {
            return false;
        }
        boolean isSetName = isSetName();
        boolean isSetName2 = clientUploadDataItem.isSetName();
        if ((isSetName || isSetName2) && (!isSetName || !isSetName2 || !this.name.equals(clientUploadDataItem.name))) {
            return false;
        }
        boolean isSetCounter = isSetCounter();
        boolean isSetCounter2 = clientUploadDataItem.isSetCounter();
        if ((isSetCounter || isSetCounter2) && (!isSetCounter || !isSetCounter2 || this.counter != clientUploadDataItem.counter)) {
            return false;
        }
        boolean isSetTimestamp = isSetTimestamp();
        boolean isSetTimestamp2 = clientUploadDataItem.isSetTimestamp();
        if ((isSetTimestamp || isSetTimestamp2) && (!isSetTimestamp || !isSetTimestamp2 || this.timestamp != clientUploadDataItem.timestamp)) {
            return false;
        }
        boolean isSetFromSdk = isSetFromSdk();
        boolean isSetFromSdk2 = clientUploadDataItem.isSetFromSdk();
        if ((isSetFromSdk || isSetFromSdk2) && (!isSetFromSdk || !isSetFromSdk2 || this.fromSdk != clientUploadDataItem.fromSdk)) {
            return false;
        }
        boolean isSetCategory = isSetCategory();
        boolean isSetCategory2 = clientUploadDataItem.isSetCategory();
        if ((isSetCategory || isSetCategory2) && (!isSetCategory || !isSetCategory2 || !this.category.equals(clientUploadDataItem.category))) {
            return false;
        }
        boolean isSetSourcePackage = isSetSourcePackage();
        boolean isSetSourcePackage2 = clientUploadDataItem.isSetSourcePackage();
        if ((isSetSourcePackage || isSetSourcePackage2) && (!isSetSourcePackage || !isSetSourcePackage2 || !this.sourcePackage.equals(clientUploadDataItem.sourcePackage))) {
            return false;
        }
        boolean isSetId = isSetId();
        boolean isSetId2 = clientUploadDataItem.isSetId();
        if ((isSetId || isSetId2) && (!isSetId || !isSetId2 || !this.id.equals(clientUploadDataItem.id))) {
            return false;
        }
        boolean isSetExtra = isSetExtra();
        boolean isSetExtra2 = clientUploadDataItem.isSetExtra();
        if ((isSetExtra || isSetExtra2) && (!isSetExtra || !isSetExtra2 || !this.extra.equals(clientUploadDataItem.extra))) {
            return false;
        }
        boolean isSetPkgName = isSetPkgName();
        boolean isSetPkgName2 = clientUploadDataItem.isSetPkgName();
        return (!isSetPkgName && !isSetPkgName2) || (isSetPkgName && isSetPkgName2 && this.pkgName.equals(clientUploadDataItem.pkgName));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof ClientUploadDataItem)) {
            return equals((ClientUploadDataItem) obj);
        }
        return false;
    }

    public String getChannel() {
        return this.channel;
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getPkgName() {
        return this.pkgName;
    }

    public String getSourcePackage() {
        return this.sourcePackage;
    }

    public long getTimestamp() {
        return this.timestamp;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetCategory() {
        return this.category != null;
    }

    public boolean isSetChannel() {
        return this.channel != null;
    }

    public boolean isSetCounter() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetData() {
        return this.data != null;
    }

    public boolean isSetExtra() {
        return this.extra != null;
    }

    public boolean isSetFromSdk() {
        return this.__isset_bit_vector.get(2);
    }

    public boolean isSetId() {
        return this.id != null;
    }

    public boolean isSetName() {
        return this.name != null;
    }

    public boolean isSetPkgName() {
        return this.pkgName != null;
    }

    public boolean isSetSourcePackage() {
        return this.sourcePackage != null;
    }

    public boolean isSetTimestamp() {
        return this.__isset_bit_vector.get(1);
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
                        this.channel = tProtocol.readString();
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.data = tProtocol.readString();
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.name = tProtocol.readString();
                        break;
                    }
                case 4:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.counter = tProtocol.readI64();
                        setCounterIsSet(true);
                        break;
                    }
                case 5:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.timestamp = tProtocol.readI64();
                        setTimestampIsSet(true);
                        break;
                    }
                case 6:
                    if (readFieldBegin.type != 2) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.fromSdk = tProtocol.readBool();
                        setFromSdkIsSet(true);
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
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.sourcePackage = tProtocol.readString();
                        break;
                    }
                case 9:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.id = tProtocol.readString();
                        break;
                    }
                case 10:
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
                case 11:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.pkgName = tProtocol.readString();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public ClientUploadDataItem setCategory(String str) {
        this.category = str;
        return this;
    }

    public ClientUploadDataItem setChannel(String str) {
        this.channel = str;
        return this;
    }

    public ClientUploadDataItem setCounter(long j) {
        this.counter = j;
        setCounterIsSet(true);
        return this;
    }

    public void setCounterIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public ClientUploadDataItem setData(String str) {
        this.data = str;
        return this;
    }

    public ClientUploadDataItem setFromSdk(boolean z) {
        this.fromSdk = z;
        setFromSdkIsSet(true);
        return this;
    }

    public void setFromSdkIsSet(boolean z) {
        this.__isset_bit_vector.set(2, z);
    }

    public ClientUploadDataItem setId(String str) {
        this.id = str;
        return this;
    }

    public ClientUploadDataItem setName(String str) {
        this.name = str;
        return this;
    }

    public ClientUploadDataItem setPkgName(String str) {
        this.pkgName = str;
        return this;
    }

    public ClientUploadDataItem setSourcePackage(String str) {
        this.sourcePackage = str;
        return this;
    }

    public ClientUploadDataItem setTimestamp(long j) {
        this.timestamp = j;
        setTimestampIsSet(true);
        return this;
    }

    public void setTimestampIsSet(boolean z) {
        this.__isset_bit_vector.set(1, z);
    }

    public String toString() {
        boolean z;
        StringBuilder sb = new StringBuilder("ClientUploadDataItem(");
        if (isSetChannel()) {
            sb.append("channel:");
            if (this.channel == null) {
                sb.append("null");
            } else {
                sb.append(this.channel);
            }
            z = false;
        } else {
            z = true;
        }
        if (isSetData()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("data:");
            if (this.data == null) {
                sb.append("null");
            } else {
                sb.append(this.data);
            }
            z = false;
        }
        if (isSetName()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("name:");
            if (this.name == null) {
                sb.append("null");
            } else {
                sb.append(this.name);
            }
            z = false;
        }
        if (isSetCounter()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("counter:");
            sb.append(this.counter);
            z = false;
        }
        if (isSetTimestamp()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("timestamp:");
            sb.append(this.timestamp);
            z = false;
        }
        if (isSetFromSdk()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("fromSdk:");
            sb.append(this.fromSdk);
            z = false;
        }
        if (isSetCategory()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("category:");
            if (this.category == null) {
                sb.append("null");
            } else {
                sb.append(this.category);
            }
            z = false;
        }
        if (isSetSourcePackage()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("sourcePackage:");
            if (this.sourcePackage == null) {
                sb.append("null");
            } else {
                sb.append(this.sourcePackage);
            }
            z = false;
        }
        if (isSetId()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("id:");
            if (this.id == null) {
                sb.append("null");
            } else {
                sb.append(this.id);
            }
            z = false;
        }
        if (isSetExtra()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("extra:");
            if (this.extra == null) {
                sb.append("null");
            } else {
                sb.append(this.extra);
            }
            z = false;
        }
        if (isSetPkgName()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append("pkgName:");
            if (this.pkgName == null) {
                sb.append("null");
            } else {
                sb.append(this.pkgName);
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        if (this.channel != null && isSetChannel()) {
            tProtocol.writeFieldBegin(CHANNEL_FIELD_DESC);
            tProtocol.writeString(this.channel);
            tProtocol.writeFieldEnd();
        }
        if (this.data != null && isSetData()) {
            tProtocol.writeFieldBegin(DATA_FIELD_DESC);
            tProtocol.writeString(this.data);
            tProtocol.writeFieldEnd();
        }
        if (this.name != null && isSetName()) {
            tProtocol.writeFieldBegin(NAME_FIELD_DESC);
            tProtocol.writeString(this.name);
            tProtocol.writeFieldEnd();
        }
        if (isSetCounter()) {
            tProtocol.writeFieldBegin(COUNTER_FIELD_DESC);
            tProtocol.writeI64(this.counter);
            tProtocol.writeFieldEnd();
        }
        if (isSetTimestamp()) {
            tProtocol.writeFieldBegin(TIMESTAMP_FIELD_DESC);
            tProtocol.writeI64(this.timestamp);
            tProtocol.writeFieldEnd();
        }
        if (isSetFromSdk()) {
            tProtocol.writeFieldBegin(FROM_SDK_FIELD_DESC);
            tProtocol.writeBool(this.fromSdk);
            tProtocol.writeFieldEnd();
        }
        if (this.category != null && isSetCategory()) {
            tProtocol.writeFieldBegin(CATEGORY_FIELD_DESC);
            tProtocol.writeString(this.category);
            tProtocol.writeFieldEnd();
        }
        if (this.sourcePackage != null && isSetSourcePackage()) {
            tProtocol.writeFieldBegin(SOURCE_PACKAGE_FIELD_DESC);
            tProtocol.writeString(this.sourcePackage);
            tProtocol.writeFieldEnd();
        }
        if (this.id != null && isSetId()) {
            tProtocol.writeFieldBegin(ID_FIELD_DESC);
            tProtocol.writeString(this.id);
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
        if (this.pkgName != null && isSetPkgName()) {
            tProtocol.writeFieldBegin(PKG_NAME_FIELD_DESC);
            tProtocol.writeString(this.pkgName);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
