package com.google.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public final class UnknownFieldSet implements MessageLite {
    private static final Parser PARSER = new Parser();
    private static final UnknownFieldSet defaultInstance = new UnknownFieldSet(Collections.emptyMap(), Collections.emptyMap());
    /* access modifiers changed from: private */
    public final Map<Integer, Field> fields;

    public static final class Builder implements com.google.protobuf.MessageLite.Builder {
        private Map<Integer, Field> fields;
        private Builder lastField;
        private int lastFieldNumber;

        private Builder() {
        }

        /* access modifiers changed from: private */
        public static Builder create() {
            Builder builder = new Builder();
            builder.reinitialize();
            return builder;
        }

        private Builder getFieldBuilder(int i) {
            if (this.lastField != null) {
                if (i == this.lastFieldNumber) {
                    return this.lastField;
                }
                addField(this.lastFieldNumber, this.lastField.build());
            }
            if (i == 0) {
                return null;
            }
            Field field = (Field) this.fields.get(Integer.valueOf(i));
            this.lastFieldNumber = i;
            this.lastField = Field.newBuilder();
            if (field != null) {
                this.lastField.mergeFrom(field);
            }
            return this.lastField;
        }

        private void reinitialize() {
            this.fields = Collections.emptyMap();
            this.lastFieldNumber = 0;
            this.lastField = null;
        }

        public Builder addField(int i, Field field) {
            if (i != 0) {
                if (this.lastField != null && this.lastFieldNumber == i) {
                    this.lastField = null;
                    this.lastFieldNumber = 0;
                }
                if (this.fields.isEmpty()) {
                    this.fields = new TreeMap();
                }
                this.fields.put(Integer.valueOf(i), field);
                return this;
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }

        public Map<Integer, Field> asMap() {
            getFieldBuilder(0);
            return Collections.unmodifiableMap(this.fields);
        }

        public UnknownFieldSet build() {
            getFieldBuilder(0);
            UnknownFieldSet defaultInstance = this.fields.isEmpty() ? UnknownFieldSet.getDefaultInstance() : new UnknownFieldSet(Collections.unmodifiableMap(this.fields), null);
            this.fields = null;
            return defaultInstance;
        }

        public UnknownFieldSet buildPartial() {
            return build();
        }

        public Builder clear() {
            reinitialize();
            return this;
        }

        public Builder clearField(int i) {
            if (i != 0) {
                if (this.lastField != null && this.lastFieldNumber == i) {
                    this.lastField = null;
                    this.lastFieldNumber = 0;
                }
                if (this.fields.containsKey(Integer.valueOf(i))) {
                    this.fields.remove(Integer.valueOf(i));
                }
                return this;
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }

        public Builder clone() {
            getFieldBuilder(0);
            return UnknownFieldSet.newBuilder().mergeFrom(new UnknownFieldSet(this.fields, null));
        }

        public UnknownFieldSet getDefaultInstanceForType() {
            return UnknownFieldSet.getDefaultInstance();
        }

        public boolean hasField(int i) {
            if (i != 0) {
                return i == this.lastFieldNumber || this.fields.containsKey(Integer.valueOf(i));
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }

        public boolean isInitialized() {
            return true;
        }

        public boolean mergeDelimitedFrom(InputStream inputStream) throws IOException {
            int read = inputStream.read();
            if (read == -1) {
                return false;
            }
            mergeFrom((InputStream) new LimitedInputStream(inputStream, CodedInputStream.readRawVarint32(read, inputStream)));
            return true;
        }

        public boolean mergeDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return mergeDelimitedFrom(inputStream);
        }

        public Builder mergeField(int i, Field field) {
            if (i != 0) {
                if (hasField(i)) {
                    getFieldBuilder(i).mergeFrom(field);
                } else {
                    addField(i, field);
                }
                return this;
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }

        public boolean mergeFieldFrom(int i, CodedInputStream codedInputStream) throws IOException {
            int tagFieldNumber = WireFormat.getTagFieldNumber(i);
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    getFieldBuilder(tagFieldNumber).addVarint(codedInputStream.readInt64());
                    return true;
                case 1:
                    getFieldBuilder(tagFieldNumber).addFixed64(codedInputStream.readFixed64());
                    return true;
                case 2:
                    getFieldBuilder(tagFieldNumber).addLengthDelimited(codedInputStream.readBytes());
                    return true;
                case 3:
                    Builder newBuilder = UnknownFieldSet.newBuilder();
                    codedInputStream.readGroup(tagFieldNumber, (com.google.protobuf.MessageLite.Builder) newBuilder, (ExtensionRegistryLite) ExtensionRegistry.getEmptyRegistry());
                    getFieldBuilder(tagFieldNumber).addGroup(newBuilder.build());
                    return true;
                case 4:
                    return false;
                case 5:
                    getFieldBuilder(tagFieldNumber).addFixed32(codedInputStream.readFixed32());
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
            }
        }

        public Builder mergeFrom(ByteString byteString) throws InvalidProtocolBufferException {
            try {
                CodedInputStream newCodedInput = byteString.newCodedInput();
                mergeFrom(newCodedInput);
                newCodedInput.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a ByteString threw an IOException (should never happen).", e2);
            }
        }

        public Builder mergeFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return mergeFrom(byteString);
        }

        public Builder mergeFrom(CodedInputStream codedInputStream) throws IOException {
            int readTag;
            do {
                readTag = codedInputStream.readTag();
                if (readTag == 0) {
                    break;
                }
            } while (mergeFieldFrom(readTag, codedInputStream));
            return this;
        }

        public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return mergeFrom(codedInputStream);
        }

        public Builder mergeFrom(MessageLite messageLite) {
            if (messageLite instanceof UnknownFieldSet) {
                return mergeFrom((UnknownFieldSet) messageLite);
            }
            throw new IllegalArgumentException("mergeFrom(MessageLite) can only merge messages of the same type.");
        }

        public Builder mergeFrom(UnknownFieldSet unknownFieldSet) {
            if (unknownFieldSet != UnknownFieldSet.getDefaultInstance()) {
                for (Entry entry : unknownFieldSet.fields.entrySet()) {
                    mergeField(((Integer) entry.getKey()).intValue(), (Field) entry.getValue());
                }
            }
            return this;
        }

        public Builder mergeFrom(InputStream inputStream) throws IOException {
            CodedInputStream newInstance = CodedInputStream.newInstance(inputStream);
            mergeFrom(newInstance);
            newInstance.checkLastTagWas(0);
            return this;
        }

        public Builder mergeFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return mergeFrom(inputStream);
        }

        public Builder mergeFrom(byte[] bArr) throws InvalidProtocolBufferException {
            try {
                CodedInputStream newInstance = CodedInputStream.newInstance(bArr);
                mergeFrom(newInstance);
                newInstance.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
            }
        }

        public Builder mergeFrom(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
            try {
                CodedInputStream newInstance = CodedInputStream.newInstance(bArr, i, i2);
                mergeFrom(newInstance);
                newInstance.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
            }
        }

        public Builder mergeFrom(byte[] bArr, int i, int i2, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return mergeFrom(bArr, i, i2);
        }

        public Builder mergeFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return mergeFrom(bArr);
        }

        public Builder mergeLengthDelimitedField(int i, ByteString byteString) {
            if (i != 0) {
                getFieldBuilder(i).addLengthDelimited(byteString);
                return this;
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }

        public Builder mergeVarintField(int i, int i2) {
            if (i != 0) {
                getFieldBuilder(i).addVarint((long) i2);
                return this;
            }
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }
    }

    public static final class Field {
        private static final Field fieldDefaultInstance = newBuilder().build();
        /* access modifiers changed from: private */
        public List<Integer> fixed32;
        /* access modifiers changed from: private */
        public List<Long> fixed64;
        /* access modifiers changed from: private */
        public List<UnknownFieldSet> group;
        /* access modifiers changed from: private */
        public List<ByteString> lengthDelimited;
        /* access modifiers changed from: private */
        public List<Long> varint;

        public static final class Builder {
            private Field result;

            private Builder() {
            }

            /* access modifiers changed from: private */
            public static Builder create() {
                Builder builder = new Builder();
                builder.result = new Field();
                return builder;
            }

            public Builder addFixed32(int i) {
                if (this.result.fixed32 == null) {
                    this.result.fixed32 = new ArrayList();
                }
                this.result.fixed32.add(Integer.valueOf(i));
                return this;
            }

            public Builder addFixed64(long j) {
                if (this.result.fixed64 == null) {
                    this.result.fixed64 = new ArrayList();
                }
                this.result.fixed64.add(Long.valueOf(j));
                return this;
            }

            public Builder addGroup(UnknownFieldSet unknownFieldSet) {
                if (this.result.group == null) {
                    this.result.group = new ArrayList();
                }
                this.result.group.add(unknownFieldSet);
                return this;
            }

            public Builder addLengthDelimited(ByteString byteString) {
                if (this.result.lengthDelimited == null) {
                    this.result.lengthDelimited = new ArrayList();
                }
                this.result.lengthDelimited.add(byteString);
                return this;
            }

            public Builder addVarint(long j) {
                if (this.result.varint == null) {
                    this.result.varint = new ArrayList();
                }
                this.result.varint.add(Long.valueOf(j));
                return this;
            }

            public Field build() {
                if (this.result.varint == null) {
                    this.result.varint = Collections.emptyList();
                } else {
                    this.result.varint = Collections.unmodifiableList(this.result.varint);
                }
                if (this.result.fixed32 == null) {
                    this.result.fixed32 = Collections.emptyList();
                } else {
                    this.result.fixed32 = Collections.unmodifiableList(this.result.fixed32);
                }
                if (this.result.fixed64 == null) {
                    this.result.fixed64 = Collections.emptyList();
                } else {
                    this.result.fixed64 = Collections.unmodifiableList(this.result.fixed64);
                }
                if (this.result.lengthDelimited == null) {
                    this.result.lengthDelimited = Collections.emptyList();
                } else {
                    this.result.lengthDelimited = Collections.unmodifiableList(this.result.lengthDelimited);
                }
                if (this.result.group == null) {
                    this.result.group = Collections.emptyList();
                } else {
                    this.result.group = Collections.unmodifiableList(this.result.group);
                }
                Field field = this.result;
                this.result = null;
                return field;
            }

            public Builder clear() {
                this.result = new Field();
                return this;
            }

            public Builder mergeFrom(Field field) {
                if (!field.varint.isEmpty()) {
                    if (this.result.varint == null) {
                        this.result.varint = new ArrayList();
                    }
                    this.result.varint.addAll(field.varint);
                }
                if (!field.fixed32.isEmpty()) {
                    if (this.result.fixed32 == null) {
                        this.result.fixed32 = new ArrayList();
                    }
                    this.result.fixed32.addAll(field.fixed32);
                }
                if (!field.fixed64.isEmpty()) {
                    if (this.result.fixed64 == null) {
                        this.result.fixed64 = new ArrayList();
                    }
                    this.result.fixed64.addAll(field.fixed64);
                }
                if (!field.lengthDelimited.isEmpty()) {
                    if (this.result.lengthDelimited == null) {
                        this.result.lengthDelimited = new ArrayList();
                    }
                    this.result.lengthDelimited.addAll(field.lengthDelimited);
                }
                if (!field.group.isEmpty()) {
                    if (this.result.group == null) {
                        this.result.group = new ArrayList();
                    }
                    this.result.group.addAll(field.group);
                }
                return this;
            }
        }

        private Field() {
        }

        public static Field getDefaultInstance() {
            return fieldDefaultInstance;
        }

        private Object[] getIdentityArray() {
            return new Object[]{this.varint, this.fixed32, this.fixed64, this.lengthDelimited, this.group};
        }

        public static Builder newBuilder() {
            return Builder.create();
        }

        public static Builder newBuilder(Field field) {
            return newBuilder().mergeFrom(field);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Field)) {
                return false;
            }
            return Arrays.equals(getIdentityArray(), ((Field) obj).getIdentityArray());
        }

        public List<Integer> getFixed32List() {
            return this.fixed32;
        }

        public List<Long> getFixed64List() {
            return this.fixed64;
        }

        public List<UnknownFieldSet> getGroupList() {
            return this.group;
        }

        public List<ByteString> getLengthDelimitedList() {
            return this.lengthDelimited;
        }

        public int getSerializedSize(int i) {
            int i2 = 0;
            for (Long longValue : this.varint) {
                i2 += CodedOutputStream.computeUInt64Size(i, longValue.longValue());
            }
            for (Integer intValue : this.fixed32) {
                i2 += CodedOutputStream.computeFixed32Size(i, intValue.intValue());
            }
            for (Long longValue2 : this.fixed64) {
                i2 += CodedOutputStream.computeFixed64Size(i, longValue2.longValue());
            }
            for (ByteString computeBytesSize : this.lengthDelimited) {
                i2 += CodedOutputStream.computeBytesSize(i, computeBytesSize);
            }
            for (UnknownFieldSet computeGroupSize : this.group) {
                i2 += CodedOutputStream.computeGroupSize(i, computeGroupSize);
            }
            return i2;
        }

        public int getSerializedSizeAsMessageSetExtension(int i) {
            int i2 = 0;
            for (ByteString computeRawMessageSetExtensionSize : this.lengthDelimited) {
                i2 += CodedOutputStream.computeRawMessageSetExtensionSize(i, computeRawMessageSetExtensionSize);
            }
            return i2;
        }

        public List<Long> getVarintList() {
            return this.varint;
        }

        public int hashCode() {
            return Arrays.hashCode(getIdentityArray());
        }

        public ByteString toByteString(int i) {
            try {
                CodedBuilder newCodedBuilder = ByteString.newCodedBuilder(getSerializedSize(i));
                writeTo(i, newCodedBuilder.getCodedOutput());
                return newCodedBuilder.build();
            } catch (IOException e) {
                throw new RuntimeException("Serializing to a ByteString should never fail with an IOException", e);
            }
        }

        public void writeAsMessageSetExtensionTo(int i, CodedOutputStream codedOutputStream) throws IOException {
            for (ByteString writeRawMessageSetExtension : this.lengthDelimited) {
                codedOutputStream.writeRawMessageSetExtension(i, writeRawMessageSetExtension);
            }
        }

        public void writeTo(int i, CodedOutputStream codedOutputStream) throws IOException {
            for (Long longValue : this.varint) {
                codedOutputStream.writeUInt64(i, longValue.longValue());
            }
            for (Integer intValue : this.fixed32) {
                codedOutputStream.writeFixed32(i, intValue.intValue());
            }
            for (Long longValue2 : this.fixed64) {
                codedOutputStream.writeFixed64(i, longValue2.longValue());
            }
            for (ByteString writeBytes : this.lengthDelimited) {
                codedOutputStream.writeBytes(i, writeBytes);
            }
            for (UnknownFieldSet writeGroup : this.group) {
                codedOutputStream.writeGroup(i, writeGroup);
            }
        }
    }

    public static final class Parser extends AbstractParser<UnknownFieldSet> {
        public UnknownFieldSet parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            Builder newBuilder = UnknownFieldSet.newBuilder();
            try {
                newBuilder.mergeFrom(codedInputStream);
                return newBuilder.buildPartial();
            } catch (InvalidProtocolBufferException e) {
                throw e.setUnfinishedMessage(newBuilder.buildPartial());
            } catch (IOException e2) {
                throw new InvalidProtocolBufferException(e2).setUnfinishedMessage(newBuilder.buildPartial());
            }
        }
    }

    private UnknownFieldSet() {
        this.fields = null;
    }

    UnknownFieldSet(Map<Integer, Field> map, Map<Integer, Field> map2) {
        this.fields = map;
    }

    public static UnknownFieldSet getDefaultInstance() {
        return defaultInstance;
    }

    public static Builder newBuilder() {
        return Builder.create();
    }

    public static Builder newBuilder(UnknownFieldSet unknownFieldSet) {
        return newBuilder().mergeFrom(unknownFieldSet);
    }

    public static UnknownFieldSet parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return newBuilder().mergeFrom(byteString).build();
    }

    public static UnknownFieldSet parseFrom(CodedInputStream codedInputStream) throws IOException {
        return newBuilder().mergeFrom(codedInputStream).build();
    }

    public static UnknownFieldSet parseFrom(InputStream inputStream) throws IOException {
        return newBuilder().mergeFrom(inputStream).build();
    }

    public static UnknownFieldSet parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return newBuilder().mergeFrom(bArr).build();
    }

    public Map<Integer, Field> asMap() {
        return this.fields;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof UnknownFieldSet) || !this.fields.equals(((UnknownFieldSet) obj).fields)) {
            z = false;
        }
        return z;
    }

    public UnknownFieldSet getDefaultInstanceForType() {
        return defaultInstance;
    }

    public Field getField(int i) {
        Field field = (Field) this.fields.get(Integer.valueOf(i));
        return field == null ? Field.getDefaultInstance() : field;
    }

    public final Parser getParserForType() {
        return PARSER;
    }

    public int getSerializedSize() {
        int i = 0;
        for (Entry entry : this.fields.entrySet()) {
            i += ((Field) entry.getValue()).getSerializedSize(((Integer) entry.getKey()).intValue());
        }
        return i;
    }

    public int getSerializedSizeAsMessageSet() {
        int i = 0;
        for (Entry entry : this.fields.entrySet()) {
            i += ((Field) entry.getValue()).getSerializedSizeAsMessageSetExtension(((Integer) entry.getKey()).intValue());
        }
        return i;
    }

    public boolean hasField(int i) {
        return this.fields.containsKey(Integer.valueOf(i));
    }

    public int hashCode() {
        return this.fields.hashCode();
    }

    public boolean isInitialized() {
        return true;
    }

    public Builder newBuilderForType() {
        return newBuilder();
    }

    public Builder toBuilder() {
        return newBuilder().mergeFrom(this);
    }

    public byte[] toByteArray() {
        try {
            byte[] bArr = new byte[getSerializedSize()];
            CodedOutputStream newInstance = CodedOutputStream.newInstance(bArr);
            writeTo(newInstance);
            newInstance.checkNoSpaceLeft();
            return bArr;
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    public ByteString toByteString() {
        try {
            CodedBuilder newCodedBuilder = ByteString.newCodedBuilder(getSerializedSize());
            writeTo(newCodedBuilder.getCodedOutput());
            return newCodedBuilder.build();
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a ByteString threw an IOException (should never happen).", e);
        }
    }

    public String toString() {
        return TextFormat.printToString(this);
    }

    public void writeAsMessageSetTo(CodedOutputStream codedOutputStream) throws IOException {
        for (Entry entry : this.fields.entrySet()) {
            ((Field) entry.getValue()).writeAsMessageSetExtensionTo(((Integer) entry.getKey()).intValue(), codedOutputStream);
        }
    }

    public void writeDelimitedTo(OutputStream outputStream) throws IOException {
        CodedOutputStream newInstance = CodedOutputStream.newInstance(outputStream);
        newInstance.writeRawVarint32(getSerializedSize());
        writeTo(newInstance);
        newInstance.flush();
    }

    public void writeTo(CodedOutputStream codedOutputStream) throws IOException {
        for (Entry entry : this.fields.entrySet()) {
            ((Field) entry.getValue()).writeTo(((Integer) entry.getKey()).intValue(), codedOutputStream);
        }
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        CodedOutputStream newInstance = CodedOutputStream.newInstance(outputStream);
        writeTo(newInstance);
        newInstance.flush();
    }
}
