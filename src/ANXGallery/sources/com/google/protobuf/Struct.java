package com.google.protobuf;

import com.google.protobuf.Descriptors.Descriptor;
import com.google.protobuf.Descriptors.FieldDescriptor;
import com.google.protobuf.Descriptors.OneofDescriptor;
import com.google.protobuf.GeneratedMessageV3.FieldAccessorTable;
import com.google.protobuf.WireFormat.FieldType;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Map;
import java.util.Map.Entry;

public final class Struct extends GeneratedMessageV3 implements StructOrBuilder {
    private static final Struct DEFAULT_INSTANCE = new Struct();
    public static final int FIELDS_FIELD_NUMBER = 1;
    /* access modifiers changed from: private */
    public static final Parser<Struct> PARSER = new AbstractParser<Struct>() {
        public Struct parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return new Struct(codedInputStream, extensionRegistryLite);
        }
    };
    private static final long serialVersionUID = 0;
    /* access modifiers changed from: private */
    public MapField<String, Value> fields_;
    private byte memoizedIsInitialized;

    public static final class Builder extends com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements StructOrBuilder {
        private int bitField0_;
        private MapField<String, Value> fields_;

        private Builder() {
            maybeForceBuilderInitialization();
        }

        private Builder(BuilderParent builderParent) {
            super(builderParent);
            maybeForceBuilderInitialization();
        }

        public static final Descriptor getDescriptor() {
            return StructProto.internal_static_google_protobuf_Struct_descriptor;
        }

        private MapField<String, Value> internalGetFields() {
            return this.fields_ == null ? MapField.emptyMapField(FieldsDefaultEntryHolder.defaultEntry) : this.fields_;
        }

        private MapField<String, Value> internalGetMutableFields() {
            onChanged();
            if (this.fields_ == null) {
                this.fields_ = MapField.newMapField(FieldsDefaultEntryHolder.defaultEntry);
            }
            if (!this.fields_.isMutable()) {
                this.fields_ = this.fields_.copy();
            }
            return this.fields_;
        }

        private void maybeForceBuilderInitialization() {
            boolean z = GeneratedMessageV3.alwaysUseFieldBuilders;
        }

        public Builder addRepeatedField(FieldDescriptor fieldDescriptor, Object obj) {
            return (Builder) super.addRepeatedField(fieldDescriptor, obj);
        }

        public Struct build() {
            Struct buildPartial = buildPartial();
            if (buildPartial.isInitialized()) {
                return buildPartial;
            }
            throw newUninitializedMessageException(buildPartial);
        }

        public Struct buildPartial() {
            Struct struct = new Struct((com.google.protobuf.GeneratedMessageV3.Builder) this);
            int i = this.bitField0_;
            struct.fields_ = internalGetFields();
            struct.fields_.makeImmutable();
            onBuilt();
            return struct;
        }

        public Builder clear() {
            super.clear();
            internalGetMutableFields().clear();
            return this;
        }

        public Builder clearField(FieldDescriptor fieldDescriptor) {
            return (Builder) super.clearField(fieldDescriptor);
        }

        public Builder clearFields() {
            internalGetMutableFields().getMutableMap().clear();
            return this;
        }

        public Builder clearOneof(OneofDescriptor oneofDescriptor) {
            return (Builder) super.clearOneof(oneofDescriptor);
        }

        public Builder clone() {
            return (Builder) super.clone();
        }

        public boolean containsFields(String str) {
            if (str != null) {
                return internalGetFields().getMap().containsKey(str);
            }
            throw new NullPointerException();
        }

        public Struct getDefaultInstanceForType() {
            return Struct.getDefaultInstance();
        }

        public Descriptor getDescriptorForType() {
            return StructProto.internal_static_google_protobuf_Struct_descriptor;
        }

        @Deprecated
        public Map<String, Value> getFields() {
            return getFieldsMap();
        }

        public int getFieldsCount() {
            return internalGetFields().getMap().size();
        }

        public Map<String, Value> getFieldsMap() {
            return internalGetFields().getMap();
        }

        public Value getFieldsOrDefault(String str, Value value) {
            if (str != null) {
                Map map = internalGetFields().getMap();
                return map.containsKey(str) ? (Value) map.get(str) : value;
            }
            throw new NullPointerException();
        }

        public Value getFieldsOrThrow(String str) {
            if (str != null) {
                Map map = internalGetFields().getMap();
                if (map.containsKey(str)) {
                    return (Value) map.get(str);
                }
                throw new IllegalArgumentException();
            }
            throw new NullPointerException();
        }

        @Deprecated
        public Map<String, Value> getMutableFields() {
            return internalGetMutableFields().getMutableMap();
        }

        /* access modifiers changed from: protected */
        public FieldAccessorTable internalGetFieldAccessorTable() {
            return StructProto.internal_static_google_protobuf_Struct_fieldAccessorTable.ensureFieldAccessorsInitialized(Struct.class, Builder.class);
        }

        /* access modifiers changed from: protected */
        public MapField internalGetMapField(int i) {
            if (i == 1) {
                return internalGetFields();
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Invalid map field number: ");
            sb.append(i);
            throw new RuntimeException(sb.toString());
        }

        /* access modifiers changed from: protected */
        public MapField internalGetMutableMapField(int i) {
            if (i == 1) {
                return internalGetMutableFields();
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Invalid map field number: ");
            sb.append(i);
            throw new RuntimeException(sb.toString());
        }

        public final boolean isInitialized() {
            return true;
        }

        /* JADX WARNING: Removed duplicated region for block: B:16:0x0023  */
        public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            Struct struct;
            Struct struct2 = null;
            try {
                Struct struct3 = (Struct) Struct.PARSER.parsePartialFrom(codedInputStream, extensionRegistryLite);
                if (struct3 != null) {
                    mergeFrom(struct3);
                }
                return this;
            } catch (InvalidProtocolBufferException e) {
                struct = (Struct) e.getUnfinishedMessage();
                throw e.unwrapIOException();
            } catch (Throwable th) {
                th = th;
                struct2 = struct;
                if (struct2 != null) {
                }
                throw th;
            }
        }

        public Builder mergeFrom(Message message) {
            if (message instanceof Struct) {
                return mergeFrom((Struct) message);
            }
            super.mergeFrom(message);
            return this;
        }

        public Builder mergeFrom(Struct struct) {
            if (struct == Struct.getDefaultInstance()) {
                return this;
            }
            internalGetMutableFields().mergeFrom(struct.internalGetFields());
            mergeUnknownFields(struct.unknownFields);
            onChanged();
            return this;
        }

        public final Builder mergeUnknownFields(UnknownFieldSet unknownFieldSet) {
            return (Builder) super.mergeUnknownFields(unknownFieldSet);
        }

        public Builder putAllFields(Map<String, Value> map) {
            internalGetMutableFields().getMutableMap().putAll(map);
            return this;
        }

        public Builder putFields(String str, Value value) {
            if (str == null) {
                throw new NullPointerException();
            } else if (value != null) {
                internalGetMutableFields().getMutableMap().put(str, value);
                return this;
            } else {
                throw new NullPointerException();
            }
        }

        public Builder removeFields(String str) {
            if (str != null) {
                internalGetMutableFields().getMutableMap().remove(str);
                return this;
            }
            throw new NullPointerException();
        }

        public Builder setField(FieldDescriptor fieldDescriptor, Object obj) {
            return (Builder) super.setField(fieldDescriptor, obj);
        }

        public Builder setRepeatedField(FieldDescriptor fieldDescriptor, int i, Object obj) {
            return (Builder) super.setRepeatedField(fieldDescriptor, i, obj);
        }

        public final Builder setUnknownFields(UnknownFieldSet unknownFieldSet) {
            return (Builder) super.setUnknownFields(unknownFieldSet);
        }
    }

    private static final class FieldsDefaultEntryHolder {
        static final MapEntry<String, Value> defaultEntry = MapEntry.newDefaultInstance(StructProto.internal_static_google_protobuf_Struct_FieldsEntry_descriptor, FieldType.STRING, "", FieldType.MESSAGE, Value.getDefaultInstance());

        private FieldsDefaultEntryHolder() {
        }
    }

    private Struct() {
        this.memoizedIsInitialized = -1;
    }

    private Struct(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        this();
        if (extensionRegistryLite != null) {
            com.google.protobuf.UnknownFieldSet.Builder newBuilder = UnknownFieldSet.newBuilder();
            boolean z = false;
            boolean z2 = false;
            while (!z) {
                try {
                    int readTag = codedInputStream.readTag();
                    if (readTag != 0) {
                        if (readTag == 10) {
                            if (!z2 || !true) {
                                this.fields_ = MapField.newMapField(FieldsDefaultEntryHolder.defaultEntry);
                                z2 |= true;
                            }
                            MapEntry mapEntry = (MapEntry) codedInputStream.readMessage(FieldsDefaultEntryHolder.defaultEntry.getParserForType(), extensionRegistryLite);
                            this.fields_.getMutableMap().put(mapEntry.getKey(), mapEntry.getValue());
                        } else if (!parseUnknownField(codedInputStream, newBuilder, extensionRegistryLite, readTag)) {
                        }
                    }
                    z = true;
                } catch (InvalidProtocolBufferException e) {
                    throw e.setUnfinishedMessage(this);
                } catch (IOException e2) {
                    throw new InvalidProtocolBufferException(e2).setUnfinishedMessage(this);
                } catch (Throwable th) {
                    this.unknownFields = newBuilder.build();
                    makeExtensionsImmutable();
                    throw th;
                }
            }
            this.unknownFields = newBuilder.build();
            makeExtensionsImmutable();
            return;
        }
        throw new NullPointerException();
    }

    private Struct(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
        super(builder);
        this.memoizedIsInitialized = -1;
    }

    public static Struct getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static final Descriptor getDescriptor() {
        return StructProto.internal_static_google_protobuf_Struct_descriptor;
    }

    /* access modifiers changed from: private */
    public MapField<String, Value> internalGetFields() {
        return this.fields_ == null ? MapField.emptyMapField(FieldsDefaultEntryHolder.defaultEntry) : this.fields_;
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.toBuilder();
    }

    public static Builder newBuilder(Struct struct) {
        return DEFAULT_INSTANCE.toBuilder().mergeFrom(struct);
    }

    public static Struct parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (Struct) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream);
    }

    public static Struct parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Struct) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream, extensionRegistryLite);
    }

    public static Struct parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(byteString);
    }

    public static Struct parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(byteString, extensionRegistryLite);
    }

    public static Struct parseFrom(CodedInputStream codedInputStream) throws IOException {
        return (Struct) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream);
    }

    public static Struct parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Struct) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream, extensionRegistryLite);
    }

    public static Struct parseFrom(InputStream inputStream) throws IOException {
        return (Struct) GeneratedMessageV3.parseWithIOException(PARSER, inputStream);
    }

    public static Struct parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Struct) GeneratedMessageV3.parseWithIOException(PARSER, inputStream, extensionRegistryLite);
    }

    public static Struct parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(byteBuffer);
    }

    public static Struct parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(byteBuffer, extensionRegistryLite);
    }

    public static Struct parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(bArr);
    }

    public static Struct parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Struct) PARSER.parseFrom(bArr, extensionRegistryLite);
    }

    public static Parser<Struct> parser() {
        return PARSER;
    }

    public boolean containsFields(String str) {
        if (str != null) {
            return internalGetFields().getMap().containsKey(str);
        }
        throw new NullPointerException();
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Struct)) {
            return super.equals(obj);
        }
        Struct struct = (Struct) obj;
        return internalGetFields().equals(struct.internalGetFields()) && this.unknownFields.equals(struct.unknownFields);
    }

    public Struct getDefaultInstanceForType() {
        return DEFAULT_INSTANCE;
    }

    @Deprecated
    public Map<String, Value> getFields() {
        return getFieldsMap();
    }

    public int getFieldsCount() {
        return internalGetFields().getMap().size();
    }

    public Map<String, Value> getFieldsMap() {
        return internalGetFields().getMap();
    }

    public Value getFieldsOrDefault(String str, Value value) {
        if (str != null) {
            Map map = internalGetFields().getMap();
            return map.containsKey(str) ? (Value) map.get(str) : value;
        }
        throw new NullPointerException();
    }

    public Value getFieldsOrThrow(String str) {
        if (str != null) {
            Map map = internalGetFields().getMap();
            if (map.containsKey(str)) {
                return (Value) map.get(str);
            }
            throw new IllegalArgumentException();
        }
        throw new NullPointerException();
    }

    public Parser<Struct> getParserForType() {
        return PARSER;
    }

    public int getSerializedSize() {
        int i = this.memoizedSize;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (Entry entry : internalGetFields().getMap().entrySet()) {
            i2 += CodedOutputStream.computeMessageSize(1, FieldsDefaultEntryHolder.defaultEntry.newBuilderForType().setKey(entry.getKey()).setValue(entry.getValue()).build());
        }
        int serializedSize = i2 + this.unknownFields.getSerializedSize();
        this.memoizedSize = serializedSize;
        return serializedSize;
    }

    public final UnknownFieldSet getUnknownFields() {
        return this.unknownFields;
    }

    public int hashCode() {
        if (this.memoizedHashCode != 0) {
            return this.memoizedHashCode;
        }
        int hashCode = 779 + getDescriptor().hashCode();
        if (!internalGetFields().getMap().isEmpty()) {
            hashCode = (((hashCode * 37) + 1) * 53) + internalGetFields().hashCode();
        }
        int hashCode2 = (hashCode * 29) + this.unknownFields.hashCode();
        this.memoizedHashCode = hashCode2;
        return hashCode2;
    }

    /* access modifiers changed from: protected */
    public FieldAccessorTable internalGetFieldAccessorTable() {
        return StructProto.internal_static_google_protobuf_Struct_fieldAccessorTable.ensureFieldAccessorsInitialized(Struct.class, Builder.class);
    }

    /* access modifiers changed from: protected */
    public MapField internalGetMapField(int i) {
        if (i == 1) {
            return internalGetFields();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Invalid map field number: ");
        sb.append(i);
        throw new RuntimeException(sb.toString());
    }

    public final boolean isInitialized() {
        byte b = this.memoizedIsInitialized;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        this.memoizedIsInitialized = 1;
        return true;
    }

    public Builder newBuilderForType() {
        return newBuilder();
    }

    /* access modifiers changed from: protected */
    public Builder newBuilderForType(BuilderParent builderParent) {
        return new Builder(builderParent);
    }

    public Builder toBuilder() {
        return this == DEFAULT_INSTANCE ? new Builder() : new Builder().mergeFrom(this);
    }

    public void writeTo(CodedOutputStream codedOutputStream) throws IOException {
        GeneratedMessageV3.serializeStringMapTo(codedOutputStream, internalGetFields(), FieldsDefaultEntryHolder.defaultEntry, 1);
        this.unknownFields.writeTo(codedOutputStream);
    }
}
