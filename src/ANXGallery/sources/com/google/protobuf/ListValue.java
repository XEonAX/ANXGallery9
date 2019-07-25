package com.google.protobuf;

import com.google.protobuf.Descriptors.Descriptor;
import com.google.protobuf.Descriptors.FieldDescriptor;
import com.google.protobuf.Descriptors.OneofDescriptor;
import com.google.protobuf.GeneratedMessageV3.FieldAccessorTable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class ListValue extends GeneratedMessageV3 implements ListValueOrBuilder {
    private static final ListValue DEFAULT_INSTANCE = new ListValue();
    /* access modifiers changed from: private */
    public static final Parser<ListValue> PARSER = new AbstractParser<ListValue>() {
        public ListValue parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return new ListValue(codedInputStream, extensionRegistryLite);
        }
    };
    public static final int VALUES_FIELD_NUMBER = 1;
    private static final long serialVersionUID = 0;
    private byte memoizedIsInitialized;
    /* access modifiers changed from: private */
    public List<Value> values_;

    public static final class Builder extends com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements ListValueOrBuilder {
        private int bitField0_;
        private RepeatedFieldBuilderV3<Value, com.google.protobuf.Value.Builder, ValueOrBuilder> valuesBuilder_;
        private List<Value> values_;

        private Builder() {
            this.values_ = Collections.emptyList();
            maybeForceBuilderInitialization();
        }

        private Builder(BuilderParent builderParent) {
            super(builderParent);
            this.values_ = Collections.emptyList();
            maybeForceBuilderInitialization();
        }

        private void ensureValuesIsMutable() {
            if ((this.bitField0_ & 1) == 0) {
                this.values_ = new ArrayList(this.values_);
                this.bitField0_ |= 1;
            }
        }

        public static final Descriptor getDescriptor() {
            return StructProto.internal_static_google_protobuf_ListValue_descriptor;
        }

        private RepeatedFieldBuilderV3<Value, com.google.protobuf.Value.Builder, ValueOrBuilder> getValuesFieldBuilder() {
            if (this.valuesBuilder_ == null) {
                List<Value> list = this.values_;
                boolean z = true;
                if ((this.bitField0_ & 1) == 0) {
                    z = false;
                }
                this.valuesBuilder_ = new RepeatedFieldBuilderV3<>(list, z, getParentForChildren(), isClean());
                this.values_ = null;
            }
            return this.valuesBuilder_;
        }

        private void maybeForceBuilderInitialization() {
            if (GeneratedMessageV3.alwaysUseFieldBuilders) {
                getValuesFieldBuilder();
            }
        }

        public Builder addAllValues(Iterable<? extends Value> iterable) {
            if (this.valuesBuilder_ == null) {
                ensureValuesIsMutable();
                com.google.protobuf.AbstractMessageLite.Builder.addAll(iterable, this.values_);
                onChanged();
            } else {
                this.valuesBuilder_.addAllMessages(iterable);
            }
            return this;
        }

        public Builder addRepeatedField(FieldDescriptor fieldDescriptor, Object obj) {
            return (Builder) super.addRepeatedField(fieldDescriptor, obj);
        }

        public Builder addValues(int i, com.google.protobuf.Value.Builder builder) {
            if (this.valuesBuilder_ == null) {
                ensureValuesIsMutable();
                this.values_.add(i, builder.build());
                onChanged();
            } else {
                this.valuesBuilder_.addMessage(i, builder.build());
            }
            return this;
        }

        public Builder addValues(int i, Value value) {
            if (this.valuesBuilder_ != null) {
                this.valuesBuilder_.addMessage(i, value);
            } else if (value != null) {
                ensureValuesIsMutable();
                this.values_.add(i, value);
                onChanged();
            } else {
                throw new NullPointerException();
            }
            return this;
        }

        public Builder addValues(com.google.protobuf.Value.Builder builder) {
            if (this.valuesBuilder_ == null) {
                ensureValuesIsMutable();
                this.values_.add(builder.build());
                onChanged();
            } else {
                this.valuesBuilder_.addMessage(builder.build());
            }
            return this;
        }

        public Builder addValues(Value value) {
            if (this.valuesBuilder_ != null) {
                this.valuesBuilder_.addMessage(value);
            } else if (value != null) {
                ensureValuesIsMutable();
                this.values_.add(value);
                onChanged();
            } else {
                throw new NullPointerException();
            }
            return this;
        }

        public com.google.protobuf.Value.Builder addValuesBuilder() {
            return (com.google.protobuf.Value.Builder) getValuesFieldBuilder().addBuilder(Value.getDefaultInstance());
        }

        public com.google.protobuf.Value.Builder addValuesBuilder(int i) {
            return (com.google.protobuf.Value.Builder) getValuesFieldBuilder().addBuilder(i, Value.getDefaultInstance());
        }

        public ListValue build() {
            ListValue buildPartial = buildPartial();
            if (buildPartial.isInitialized()) {
                return buildPartial;
            }
            throw newUninitializedMessageException(buildPartial);
        }

        public ListValue buildPartial() {
            ListValue listValue = new ListValue((com.google.protobuf.GeneratedMessageV3.Builder) this);
            int i = this.bitField0_;
            if (this.valuesBuilder_ == null) {
                if ((this.bitField0_ & 1) != 0) {
                    this.values_ = Collections.unmodifiableList(this.values_);
                    this.bitField0_ &= -2;
                }
                listValue.values_ = this.values_;
            } else {
                listValue.values_ = this.valuesBuilder_.build();
            }
            onBuilt();
            return listValue;
        }

        public Builder clear() {
            super.clear();
            if (this.valuesBuilder_ == null) {
                this.values_ = Collections.emptyList();
                this.bitField0_ &= -2;
            } else {
                this.valuesBuilder_.clear();
            }
            return this;
        }

        public Builder clearField(FieldDescriptor fieldDescriptor) {
            return (Builder) super.clearField(fieldDescriptor);
        }

        public Builder clearOneof(OneofDescriptor oneofDescriptor) {
            return (Builder) super.clearOneof(oneofDescriptor);
        }

        public Builder clearValues() {
            if (this.valuesBuilder_ == null) {
                this.values_ = Collections.emptyList();
                this.bitField0_ &= -2;
                onChanged();
            } else {
                this.valuesBuilder_.clear();
            }
            return this;
        }

        public Builder clone() {
            return (Builder) super.clone();
        }

        public ListValue getDefaultInstanceForType() {
            return ListValue.getDefaultInstance();
        }

        public Descriptor getDescriptorForType() {
            return StructProto.internal_static_google_protobuf_ListValue_descriptor;
        }

        public Value getValues(int i) {
            return this.valuesBuilder_ == null ? (Value) this.values_.get(i) : (Value) this.valuesBuilder_.getMessage(i);
        }

        public com.google.protobuf.Value.Builder getValuesBuilder(int i) {
            return (com.google.protobuf.Value.Builder) getValuesFieldBuilder().getBuilder(i);
        }

        public List<com.google.protobuf.Value.Builder> getValuesBuilderList() {
            return getValuesFieldBuilder().getBuilderList();
        }

        public int getValuesCount() {
            return this.valuesBuilder_ == null ? this.values_.size() : this.valuesBuilder_.getCount();
        }

        public List<Value> getValuesList() {
            return this.valuesBuilder_ == null ? Collections.unmodifiableList(this.values_) : this.valuesBuilder_.getMessageList();
        }

        public ValueOrBuilder getValuesOrBuilder(int i) {
            return this.valuesBuilder_ == null ? (ValueOrBuilder) this.values_.get(i) : (ValueOrBuilder) this.valuesBuilder_.getMessageOrBuilder(i);
        }

        public List<? extends ValueOrBuilder> getValuesOrBuilderList() {
            return this.valuesBuilder_ != null ? this.valuesBuilder_.getMessageOrBuilderList() : Collections.unmodifiableList(this.values_);
        }

        /* access modifiers changed from: protected */
        public FieldAccessorTable internalGetFieldAccessorTable() {
            return StructProto.internal_static_google_protobuf_ListValue_fieldAccessorTable.ensureFieldAccessorsInitialized(ListValue.class, Builder.class);
        }

        public final boolean isInitialized() {
            return true;
        }

        /* JADX WARNING: Removed duplicated region for block: B:16:0x0023  */
        public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            ListValue listValue;
            ListValue listValue2 = null;
            try {
                ListValue listValue3 = (ListValue) ListValue.PARSER.parsePartialFrom(codedInputStream, extensionRegistryLite);
                if (listValue3 != null) {
                    mergeFrom(listValue3);
                }
                return this;
            } catch (InvalidProtocolBufferException e) {
                listValue = (ListValue) e.getUnfinishedMessage();
                throw e.unwrapIOException();
            } catch (Throwable th) {
                th = th;
                listValue2 = listValue;
                if (listValue2 != null) {
                }
                throw th;
            }
        }

        public Builder mergeFrom(ListValue listValue) {
            if (listValue == ListValue.getDefaultInstance()) {
                return this;
            }
            if (this.valuesBuilder_ == null) {
                if (!listValue.values_.isEmpty()) {
                    if (this.values_.isEmpty()) {
                        this.values_ = listValue.values_;
                        this.bitField0_ &= -2;
                    } else {
                        ensureValuesIsMutable();
                        this.values_.addAll(listValue.values_);
                    }
                    onChanged();
                }
            } else if (!listValue.values_.isEmpty()) {
                if (this.valuesBuilder_.isEmpty()) {
                    this.valuesBuilder_.dispose();
                    RepeatedFieldBuilderV3<Value, com.google.protobuf.Value.Builder, ValueOrBuilder> repeatedFieldBuilderV3 = null;
                    this.valuesBuilder_ = null;
                    this.values_ = listValue.values_;
                    this.bitField0_ &= -2;
                    if (GeneratedMessageV3.alwaysUseFieldBuilders) {
                        repeatedFieldBuilderV3 = getValuesFieldBuilder();
                    }
                    this.valuesBuilder_ = repeatedFieldBuilderV3;
                } else {
                    this.valuesBuilder_.addAllMessages(listValue.values_);
                }
            }
            mergeUnknownFields(listValue.unknownFields);
            onChanged();
            return this;
        }

        public Builder mergeFrom(Message message) {
            if (message instanceof ListValue) {
                return mergeFrom((ListValue) message);
            }
            super.mergeFrom(message);
            return this;
        }

        public final Builder mergeUnknownFields(UnknownFieldSet unknownFieldSet) {
            return (Builder) super.mergeUnknownFields(unknownFieldSet);
        }

        public Builder removeValues(int i) {
            if (this.valuesBuilder_ == null) {
                ensureValuesIsMutable();
                this.values_.remove(i);
                onChanged();
            } else {
                this.valuesBuilder_.remove(i);
            }
            return this;
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

        public Builder setValues(int i, com.google.protobuf.Value.Builder builder) {
            if (this.valuesBuilder_ == null) {
                ensureValuesIsMutable();
                this.values_.set(i, builder.build());
                onChanged();
            } else {
                this.valuesBuilder_.setMessage(i, builder.build());
            }
            return this;
        }

        public Builder setValues(int i, Value value) {
            if (this.valuesBuilder_ != null) {
                this.valuesBuilder_.setMessage(i, value);
            } else if (value != null) {
                ensureValuesIsMutable();
                this.values_.set(i, value);
                onChanged();
            } else {
                throw new NullPointerException();
            }
            return this;
        }
    }

    private ListValue() {
        this.memoizedIsInitialized = -1;
        this.values_ = Collections.emptyList();
    }

    private ListValue(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
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
                                this.values_ = new ArrayList();
                                z2 |= true;
                            }
                            this.values_.add(codedInputStream.readMessage(Value.parser(), extensionRegistryLite));
                        } else if (!parseUnknownField(codedInputStream, newBuilder, extensionRegistryLite, readTag)) {
                        }
                    }
                    z = true;
                } catch (InvalidProtocolBufferException e) {
                    throw e.setUnfinishedMessage(this);
                } catch (IOException e2) {
                    throw new InvalidProtocolBufferException(e2).setUnfinishedMessage(this);
                } catch (Throwable th) {
                    if (z2 && true) {
                        this.values_ = Collections.unmodifiableList(this.values_);
                    }
                    this.unknownFields = newBuilder.build();
                    makeExtensionsImmutable();
                    throw th;
                }
            }
            if (z2 && true) {
                this.values_ = Collections.unmodifiableList(this.values_);
            }
            this.unknownFields = newBuilder.build();
            makeExtensionsImmutable();
            return;
        }
        throw new NullPointerException();
    }

    private ListValue(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
        super(builder);
        this.memoizedIsInitialized = -1;
    }

    public static ListValue getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static final Descriptor getDescriptor() {
        return StructProto.internal_static_google_protobuf_ListValue_descriptor;
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.toBuilder();
    }

    public static Builder newBuilder(ListValue listValue) {
        return DEFAULT_INSTANCE.toBuilder().mergeFrom(listValue);
    }

    public static ListValue parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (ListValue) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream);
    }

    public static ListValue parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (ListValue) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream, extensionRegistryLite);
    }

    public static ListValue parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(byteString);
    }

    public static ListValue parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(byteString, extensionRegistryLite);
    }

    public static ListValue parseFrom(CodedInputStream codedInputStream) throws IOException {
        return (ListValue) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream);
    }

    public static ListValue parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (ListValue) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream, extensionRegistryLite);
    }

    public static ListValue parseFrom(InputStream inputStream) throws IOException {
        return (ListValue) GeneratedMessageV3.parseWithIOException(PARSER, inputStream);
    }

    public static ListValue parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (ListValue) GeneratedMessageV3.parseWithIOException(PARSER, inputStream, extensionRegistryLite);
    }

    public static ListValue parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(byteBuffer);
    }

    public static ListValue parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(byteBuffer, extensionRegistryLite);
    }

    public static ListValue parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(bArr);
    }

    public static ListValue parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (ListValue) PARSER.parseFrom(bArr, extensionRegistryLite);
    }

    public static Parser<ListValue> parser() {
        return PARSER;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ListValue)) {
            return super.equals(obj);
        }
        ListValue listValue = (ListValue) obj;
        return getValuesList().equals(listValue.getValuesList()) && this.unknownFields.equals(listValue.unknownFields);
    }

    public ListValue getDefaultInstanceForType() {
        return DEFAULT_INSTANCE;
    }

    public Parser<ListValue> getParserForType() {
        return PARSER;
    }

    public int getSerializedSize() {
        int i = this.memoizedSize;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < this.values_.size(); i3++) {
            i2 += CodedOutputStream.computeMessageSize(1, (MessageLite) this.values_.get(i3));
        }
        int serializedSize = i2 + this.unknownFields.getSerializedSize();
        this.memoizedSize = serializedSize;
        return serializedSize;
    }

    public final UnknownFieldSet getUnknownFields() {
        return this.unknownFields;
    }

    public Value getValues(int i) {
        return (Value) this.values_.get(i);
    }

    public int getValuesCount() {
        return this.values_.size();
    }

    public List<Value> getValuesList() {
        return this.values_;
    }

    public ValueOrBuilder getValuesOrBuilder(int i) {
        return (ValueOrBuilder) this.values_.get(i);
    }

    public List<? extends ValueOrBuilder> getValuesOrBuilderList() {
        return this.values_;
    }

    public int hashCode() {
        if (this.memoizedHashCode != 0) {
            return this.memoizedHashCode;
        }
        int hashCode = 779 + getDescriptor().hashCode();
        if (getValuesCount() > 0) {
            hashCode = (((hashCode * 37) + 1) * 53) + getValuesList().hashCode();
        }
        int hashCode2 = (hashCode * 29) + this.unknownFields.hashCode();
        this.memoizedHashCode = hashCode2;
        return hashCode2;
    }

    /* access modifiers changed from: protected */
    public FieldAccessorTable internalGetFieldAccessorTable() {
        return StructProto.internal_static_google_protobuf_ListValue_fieldAccessorTable.ensureFieldAccessorsInitialized(ListValue.class, Builder.class);
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
        for (int i = 0; i < this.values_.size(); i++) {
            codedOutputStream.writeMessage(1, (MessageLite) this.values_.get(i));
        }
        this.unknownFields.writeTo(codedOutputStream);
    }
}
