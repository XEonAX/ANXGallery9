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

public class DataCollectionItem implements Serializable, Cloneable, TBase<DataCollectionItem, Object> {
    private static final TField COLLECTED_AT_FIELD_DESC = new TField("", 10, 1);
    private static final TField COLLECTION_TYPE_FIELD_DESC = new TField("", 8, 2);
    private static final TField CONTENT_FIELD_DESC = new TField("", 11, 3);
    private static final TStruct STRUCT_DESC = new TStruct("DataCollectionItem");
    private BitSet __isset_bit_vector = new BitSet(1);
    public long collectedAt;
    public ClientCollectionType collectionType;
    public String content;

    public int compareTo(DataCollectionItem dataCollectionItem) {
        if (!getClass().equals(dataCollectionItem.getClass())) {
            return getClass().getName().compareTo(dataCollectionItem.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetCollectedAt()).compareTo(Boolean.valueOf(dataCollectionItem.isSetCollectedAt()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetCollectedAt()) {
            int compareTo2 = TBaseHelper.compareTo(this.collectedAt, dataCollectionItem.collectedAt);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetCollectionType()).compareTo(Boolean.valueOf(dataCollectionItem.isSetCollectionType()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetCollectionType()) {
            int compareTo4 = TBaseHelper.compareTo((Comparable) this.collectionType, (Comparable) dataCollectionItem.collectionType);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetContent()).compareTo(Boolean.valueOf(dataCollectionItem.isSetContent()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetContent()) {
            int compareTo6 = TBaseHelper.compareTo(this.content, dataCollectionItem.content);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        return 0;
    }

    public boolean equals(DataCollectionItem dataCollectionItem) {
        if (dataCollectionItem == null || this.collectedAt != dataCollectionItem.collectedAt) {
            return false;
        }
        boolean isSetCollectionType = isSetCollectionType();
        boolean isSetCollectionType2 = dataCollectionItem.isSetCollectionType();
        if ((isSetCollectionType || isSetCollectionType2) && (!isSetCollectionType || !isSetCollectionType2 || !this.collectionType.equals(dataCollectionItem.collectionType))) {
            return false;
        }
        boolean isSetContent = isSetContent();
        boolean isSetContent2 = dataCollectionItem.isSetContent();
        return (!isSetContent && !isSetContent2) || (isSetContent && isSetContent2 && this.content.equals(dataCollectionItem.content));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof DataCollectionItem)) {
            return equals((DataCollectionItem) obj);
        }
        return false;
    }

    public String getContent() {
        return this.content;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetCollectedAt() {
        return this.__isset_bit_vector.get(0);
    }

    public boolean isSetCollectionType() {
        return this.collectionType != null;
    }

    public boolean isSetContent() {
        return this.content != null;
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                if (isSetCollectedAt()) {
                    validate();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Required field 'collectedAt' was not found in serialized data! Struct: ");
                sb.append(toString());
                throw new TProtocolException(sb.toString());
            }
            switch (readFieldBegin.id) {
                case 1:
                    if (readFieldBegin.type != 10) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.collectedAt = tProtocol.readI64();
                        setCollectedAtIsSet(true);
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 8) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.collectionType = ClientCollectionType.findByValue(tProtocol.readI32());
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.content = tProtocol.readString();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public DataCollectionItem setCollectedAt(long j) {
        this.collectedAt = j;
        setCollectedAtIsSet(true);
        return this;
    }

    public void setCollectedAtIsSet(boolean z) {
        this.__isset_bit_vector.set(0, z);
    }

    public DataCollectionItem setCollectionType(ClientCollectionType clientCollectionType) {
        this.collectionType = clientCollectionType;
        return this;
    }

    public DataCollectionItem setContent(String str) {
        this.content = str;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("DataCollectionItem(");
        sb.append("collectedAt:");
        sb.append(this.collectedAt);
        sb.append(", ");
        sb.append("collectionType:");
        if (this.collectionType == null) {
            sb.append("null");
        } else {
            sb.append(this.collectionType);
        }
        sb.append(", ");
        sb.append("content:");
        if (this.content == null) {
            sb.append("null");
        } else {
            sb.append(this.content);
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.collectionType == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'collectionType' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
        } else if (this.content == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Required field 'content' was not present! Struct: ");
            sb2.append(toString());
            throw new TProtocolException(sb2.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        tProtocol.writeFieldBegin(COLLECTED_AT_FIELD_DESC);
        tProtocol.writeI64(this.collectedAt);
        tProtocol.writeFieldEnd();
        if (this.collectionType != null) {
            tProtocol.writeFieldBegin(COLLECTION_TYPE_FIELD_DESC);
            tProtocol.writeI32(this.collectionType.getValue());
            tProtocol.writeFieldEnd();
        }
        if (this.content != null) {
            tProtocol.writeFieldBegin(CONTENT_FIELD_DESC);
            tProtocol.writeString(this.content);
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
