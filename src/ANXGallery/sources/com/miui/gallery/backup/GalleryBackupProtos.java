package com.miui.gallery.backup;

import com.google.protobuf.AbstractParser;
import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.Descriptors.Descriptor;
import com.google.protobuf.Descriptors.FieldDescriptor;
import com.google.protobuf.Descriptors.FileDescriptor;
import com.google.protobuf.Descriptors.FileDescriptor.InternalDescriptorAssigner;
import com.google.protobuf.Descriptors.OneofDescriptor;
import com.google.protobuf.ExtensionRegistry;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageV3;
import com.google.protobuf.GeneratedMessageV3.FieldAccessorTable;
import com.google.protobuf.Internal;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.Message;
import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageOrBuilder;
import com.google.protobuf.Parser;
import com.google.protobuf.RepeatedFieldBuilderV3;
import com.google.protobuf.SingleFieldBuilderV3;
import com.google.protobuf.UnknownFieldSet;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class GalleryBackupProtos {
    /* access modifiers changed from: private */
    public static FileDescriptor descriptor;
    /* access modifiers changed from: private */
    public static final Descriptor internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor = ((Descriptor) internal_static_com_miui_gallery_backup_BackupMessage_descriptor.getNestedTypes().get(1));
    /* access modifiers changed from: private */
    public static final FieldAccessorTable internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable = new FieldAccessorTable(internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor, new String[]{"Path", "Name", "Attributes"});
    /* access modifiers changed from: private */
    public static final Descriptor internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor = ((Descriptor) internal_static_com_miui_gallery_backup_BackupMessage_descriptor.getNestedTypes().get(0));
    /* access modifiers changed from: private */
    public static final FieldAccessorTable internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable = new FieldAccessorTable(internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor, new String[]{"OnlyShowLocalPhoto", "ShowHiddenAlbum", "SlideshowInterval", "RemindConnectNetworkEveryTime"});
    /* access modifiers changed from: private */
    public static final Descriptor internal_static_com_miui_gallery_backup_BackupMessage_descriptor = ((Descriptor) getDescriptor().getMessageTypes().get(0));
    /* access modifiers changed from: private */
    public static final FieldAccessorTable internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable = new FieldAccessorTable(internal_static_com_miui_gallery_backup_BackupMessage_descriptor, new String[]{"Settings", "AlbumProfiles"});

    public static final class BackupMessage extends GeneratedMessageV3 implements BackupMessageOrBuilder {
        public static final int ALBUMPROFILES_FIELD_NUMBER = 2;
        private static final BackupMessage DEFAULT_INSTANCE = new BackupMessage();
        /* access modifiers changed from: private */
        public static final Parser<BackupMessage> PARSER = new AbstractParser<BackupMessage>() {
            public BackupMessage parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return new BackupMessage(codedInputStream, extensionRegistryLite);
            }
        };
        public static final int SETTINGS_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        /* access modifiers changed from: private */
        public List<AlbumProfile> albumProfiles_;
        /* access modifiers changed from: private */
        public int bitField0_;
        private byte memoizedIsInitialized;
        /* access modifiers changed from: private */
        public Settings settings_;

        public static final class AlbumProfile extends GeneratedMessageV3 implements AlbumProfileOrBuilder {
            public static final int ATTRIBUTES_FIELD_NUMBER = 3;
            private static final AlbumProfile DEFAULT_INSTANCE = new AlbumProfile();
            public static final int NAME_FIELD_NUMBER = 2;
            /* access modifiers changed from: private */
            public static final Parser<AlbumProfile> PARSER = new AbstractParser<AlbumProfile>() {
                public AlbumProfile parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                    return new AlbumProfile(codedInputStream, extensionRegistryLite);
                }
            };
            public static final int PATH_FIELD_NUMBER = 1;
            private static final long serialVersionUID = 0;
            /* access modifiers changed from: private */
            public long attributes_;
            private byte memoizedIsInitialized;
            /* access modifiers changed from: private */
            public volatile Object name_;
            /* access modifiers changed from: private */
            public volatile Object path_;

            public static final class Builder extends com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements AlbumProfileOrBuilder {
                private long attributes_;
                private Object name_;
                private Object path_;

                private Builder() {
                    this.path_ = "";
                    this.name_ = "";
                    maybeForceBuilderInitialization();
                }

                private Builder(BuilderParent builderParent) {
                    super(builderParent);
                    this.path_ = "";
                    this.name_ = "";
                    maybeForceBuilderInitialization();
                }

                public static final Descriptor getDescriptor() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor;
                }

                private void maybeForceBuilderInitialization() {
                    AlbumProfile.alwaysUseFieldBuilders;
                }

                public Builder addRepeatedField(FieldDescriptor fieldDescriptor, Object obj) {
                    return (Builder) super.addRepeatedField(fieldDescriptor, obj);
                }

                public AlbumProfile build() {
                    AlbumProfile buildPartial = buildPartial();
                    if (buildPartial.isInitialized()) {
                        return buildPartial;
                    }
                    throw newUninitializedMessageException(buildPartial);
                }

                public AlbumProfile buildPartial() {
                    AlbumProfile albumProfile = new AlbumProfile((com.google.protobuf.GeneratedMessageV3.Builder) this);
                    albumProfile.path_ = this.path_;
                    albumProfile.name_ = this.name_;
                    albumProfile.attributes_ = this.attributes_;
                    onBuilt();
                    return albumProfile;
                }

                public Builder clear() {
                    super.clear();
                    this.path_ = "";
                    this.name_ = "";
                    this.attributes_ = 0;
                    return this;
                }

                public Builder clearAttributes() {
                    this.attributes_ = 0;
                    onChanged();
                    return this;
                }

                public Builder clearField(FieldDescriptor fieldDescriptor) {
                    return (Builder) super.clearField(fieldDescriptor);
                }

                public Builder clearName() {
                    this.name_ = AlbumProfile.getDefaultInstance().getName();
                    onChanged();
                    return this;
                }

                public Builder clearOneof(OneofDescriptor oneofDescriptor) {
                    return (Builder) super.clearOneof(oneofDescriptor);
                }

                public Builder clearPath() {
                    this.path_ = AlbumProfile.getDefaultInstance().getPath();
                    onChanged();
                    return this;
                }

                public Builder clone() {
                    return (Builder) super.clone();
                }

                public long getAttributes() {
                    return this.attributes_;
                }

                public AlbumProfile getDefaultInstanceForType() {
                    return AlbumProfile.getDefaultInstance();
                }

                public Descriptor getDescriptorForType() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor;
                }

                public String getName() {
                    Object obj = this.name_;
                    if (obj instanceof String) {
                        return (String) obj;
                    }
                    String stringUtf8 = ((ByteString) obj).toStringUtf8();
                    this.name_ = stringUtf8;
                    return stringUtf8;
                }

                public ByteString getNameBytes() {
                    Object obj = this.name_;
                    if (!(obj instanceof String)) {
                        return (ByteString) obj;
                    }
                    ByteString copyFromUtf8 = ByteString.copyFromUtf8((String) obj);
                    this.name_ = copyFromUtf8;
                    return copyFromUtf8;
                }

                public String getPath() {
                    Object obj = this.path_;
                    if (obj instanceof String) {
                        return (String) obj;
                    }
                    String stringUtf8 = ((ByteString) obj).toStringUtf8();
                    this.path_ = stringUtf8;
                    return stringUtf8;
                }

                public ByteString getPathBytes() {
                    Object obj = this.path_;
                    if (!(obj instanceof String)) {
                        return (ByteString) obj;
                    }
                    ByteString copyFromUtf8 = ByteString.copyFromUtf8((String) obj);
                    this.path_ = copyFromUtf8;
                    return copyFromUtf8;
                }

                /* access modifiers changed from: protected */
                public FieldAccessorTable internalGetFieldAccessorTable() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable.ensureFieldAccessorsInitialized(AlbumProfile.class, Builder.class);
                }

                public final boolean isInitialized() {
                    return true;
                }

                /* JADX WARNING: Removed duplicated region for block: B:16:0x0023  */
                public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                    AlbumProfile albumProfile;
                    AlbumProfile albumProfile2 = null;
                    try {
                        AlbumProfile albumProfile3 = (AlbumProfile) AlbumProfile.PARSER.parsePartialFrom(codedInputStream, extensionRegistryLite);
                        if (albumProfile3 != null) {
                            mergeFrom(albumProfile3);
                        }
                        return this;
                    } catch (InvalidProtocolBufferException e) {
                        albumProfile = (AlbumProfile) e.getUnfinishedMessage();
                        throw e.unwrapIOException();
                    } catch (Throwable th) {
                        th = th;
                        albumProfile2 = albumProfile;
                        if (albumProfile2 != null) {
                        }
                        throw th;
                    }
                }

                public Builder mergeFrom(Message message) {
                    if (message instanceof AlbumProfile) {
                        return mergeFrom((AlbumProfile) message);
                    }
                    super.mergeFrom(message);
                    return this;
                }

                public Builder mergeFrom(AlbumProfile albumProfile) {
                    if (albumProfile == AlbumProfile.getDefaultInstance()) {
                        return this;
                    }
                    if (!albumProfile.getPath().isEmpty()) {
                        this.path_ = albumProfile.path_;
                        onChanged();
                    }
                    if (!albumProfile.getName().isEmpty()) {
                        this.name_ = albumProfile.name_;
                        onChanged();
                    }
                    if (albumProfile.getAttributes() != 0) {
                        setAttributes(albumProfile.getAttributes());
                    }
                    mergeUnknownFields(albumProfile.unknownFields);
                    onChanged();
                    return this;
                }

                public final Builder mergeUnknownFields(UnknownFieldSet unknownFieldSet) {
                    return (Builder) super.mergeUnknownFields(unknownFieldSet);
                }

                public Builder setAttributes(long j) {
                    this.attributes_ = j;
                    onChanged();
                    return this;
                }

                public Builder setField(FieldDescriptor fieldDescriptor, Object obj) {
                    return (Builder) super.setField(fieldDescriptor, obj);
                }

                public Builder setName(String str) {
                    if (str != null) {
                        this.name_ = str;
                        onChanged();
                        return this;
                    }
                    throw new NullPointerException();
                }

                public Builder setNameBytes(ByteString byteString) {
                    if (byteString != null) {
                        AlbumProfile.checkByteStringIsUtf8(byteString);
                        this.name_ = byteString;
                        onChanged();
                        return this;
                    }
                    throw new NullPointerException();
                }

                public Builder setPath(String str) {
                    if (str != null) {
                        this.path_ = str;
                        onChanged();
                        return this;
                    }
                    throw new NullPointerException();
                }

                public Builder setPathBytes(ByteString byteString) {
                    if (byteString != null) {
                        AlbumProfile.checkByteStringIsUtf8(byteString);
                        this.path_ = byteString;
                        onChanged();
                        return this;
                    }
                    throw new NullPointerException();
                }

                public Builder setRepeatedField(FieldDescriptor fieldDescriptor, int i, Object obj) {
                    return (Builder) super.setRepeatedField(fieldDescriptor, i, obj);
                }

                public final Builder setUnknownFields(UnknownFieldSet unknownFieldSet) {
                    return (Builder) super.setUnknownFields(unknownFieldSet);
                }
            }

            private AlbumProfile() {
                this.memoizedIsInitialized = -1;
                this.path_ = "";
                this.name_ = "";
            }

            private AlbumProfile(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                this();
                if (extensionRegistryLite != null) {
                    com.google.protobuf.UnknownFieldSet.Builder newBuilder = UnknownFieldSet.newBuilder();
                    boolean z = false;
                    while (!z) {
                        try {
                            int readTag = codedInputStream.readTag();
                            if (readTag != 0) {
                                if (readTag == 10) {
                                    this.path_ = codedInputStream.readStringRequireUtf8();
                                } else if (readTag == 18) {
                                    this.name_ = codedInputStream.readStringRequireUtf8();
                                } else if (readTag == 24) {
                                    this.attributes_ = codedInputStream.readInt64();
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

            private AlbumProfile(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
                super(builder);
                this.memoizedIsInitialized = -1;
            }

            public static AlbumProfile getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static final Descriptor getDescriptor() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor;
            }

            public static Builder newBuilder() {
                return DEFAULT_INSTANCE.toBuilder();
            }

            public static Builder newBuilder(AlbumProfile albumProfile) {
                return DEFAULT_INSTANCE.toBuilder().mergeFrom(albumProfile);
            }

            public static AlbumProfile parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream);
            }

            public static AlbumProfile parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream, extensionRegistryLite);
            }

            public static AlbumProfile parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(byteString);
            }

            public static AlbumProfile parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(byteString, extensionRegistryLite);
            }

            public static AlbumProfile parseFrom(CodedInputStream codedInputStream) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream);
            }

            public static AlbumProfile parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream, extensionRegistryLite);
            }

            public static AlbumProfile parseFrom(InputStream inputStream) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseWithIOException(PARSER, inputStream);
            }

            public static AlbumProfile parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (AlbumProfile) GeneratedMessageV3.parseWithIOException(PARSER, inputStream, extensionRegistryLite);
            }

            public static AlbumProfile parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(byteBuffer);
            }

            public static AlbumProfile parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(byteBuffer, extensionRegistryLite);
            }

            public static AlbumProfile parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(bArr);
            }

            public static AlbumProfile parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (AlbumProfile) PARSER.parseFrom(bArr, extensionRegistryLite);
            }

            public static Parser<AlbumProfile> parser() {
                return PARSER;
            }

            public boolean equals(Object obj) {
                if (obj == this) {
                    return true;
                }
                if (!(obj instanceof AlbumProfile)) {
                    return super.equals(obj);
                }
                AlbumProfile albumProfile = (AlbumProfile) obj;
                return getPath().equals(albumProfile.getPath()) && getName().equals(albumProfile.getName()) && getAttributes() == albumProfile.getAttributes() && this.unknownFields.equals(albumProfile.unknownFields);
            }

            public long getAttributes() {
                return this.attributes_;
            }

            public AlbumProfile getDefaultInstanceForType() {
                return DEFAULT_INSTANCE;
            }

            public String getName() {
                Object obj = this.name_;
                if (obj instanceof String) {
                    return (String) obj;
                }
                String stringUtf8 = ((ByteString) obj).toStringUtf8();
                this.name_ = stringUtf8;
                return stringUtf8;
            }

            public ByteString getNameBytes() {
                Object obj = this.name_;
                if (!(obj instanceof String)) {
                    return (ByteString) obj;
                }
                ByteString copyFromUtf8 = ByteString.copyFromUtf8((String) obj);
                this.name_ = copyFromUtf8;
                return copyFromUtf8;
            }

            public Parser<AlbumProfile> getParserForType() {
                return PARSER;
            }

            public String getPath() {
                Object obj = this.path_;
                if (obj instanceof String) {
                    return (String) obj;
                }
                String stringUtf8 = ((ByteString) obj).toStringUtf8();
                this.path_ = stringUtf8;
                return stringUtf8;
            }

            public ByteString getPathBytes() {
                Object obj = this.path_;
                if (!(obj instanceof String)) {
                    return (ByteString) obj;
                }
                ByteString copyFromUtf8 = ByteString.copyFromUtf8((String) obj);
                this.path_ = copyFromUtf8;
                return copyFromUtf8;
            }

            public int getSerializedSize() {
                int i = this.memoizedSize;
                if (i != -1) {
                    return i;
                }
                int i2 = 0;
                if (!getPathBytes().isEmpty()) {
                    i2 = 0 + GeneratedMessageV3.computeStringSize(1, this.path_);
                }
                if (!getNameBytes().isEmpty()) {
                    i2 += GeneratedMessageV3.computeStringSize(2, this.name_);
                }
                if (this.attributes_ != 0) {
                    i2 += CodedOutputStream.computeInt64Size(3, this.attributes_);
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
                int hashCode = ((((((((((((((779 + getDescriptor().hashCode()) * 37) + 1) * 53) + getPath().hashCode()) * 37) + 2) * 53) + getName().hashCode()) * 37) + 3) * 53) + Internal.hashLong(getAttributes())) * 29) + this.unknownFields.hashCode();
                this.memoizedHashCode = hashCode;
                return hashCode;
            }

            /* access modifiers changed from: protected */
            public FieldAccessorTable internalGetFieldAccessorTable() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable.ensureFieldAccessorsInitialized(AlbumProfile.class, Builder.class);
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
                if (!getPathBytes().isEmpty()) {
                    GeneratedMessageV3.writeString(codedOutputStream, 1, this.path_);
                }
                if (!getNameBytes().isEmpty()) {
                    GeneratedMessageV3.writeString(codedOutputStream, 2, this.name_);
                }
                if (this.attributes_ != 0) {
                    codedOutputStream.writeInt64(3, this.attributes_);
                }
                this.unknownFields.writeTo(codedOutputStream);
            }
        }

        public interface AlbumProfileOrBuilder extends MessageOrBuilder {
            long getAttributes();

            String getName();

            ByteString getNameBytes();

            String getPath();

            ByteString getPathBytes();
        }

        public static final class Builder extends com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements BackupMessageOrBuilder {
            private RepeatedFieldBuilderV3<AlbumProfile, Builder, AlbumProfileOrBuilder> albumProfilesBuilder_;
            private List<AlbumProfile> albumProfiles_;
            private int bitField0_;
            private SingleFieldBuilderV3<Settings, Builder, SettingsOrBuilder> settingsBuilder_;
            private Settings settings_;

            private Builder() {
                this.albumProfiles_ = Collections.emptyList();
                maybeForceBuilderInitialization();
            }

            private Builder(BuilderParent builderParent) {
                super(builderParent);
                this.albumProfiles_ = Collections.emptyList();
                maybeForceBuilderInitialization();
            }

            private void ensureAlbumProfilesIsMutable() {
                if ((this.bitField0_ & 2) == 0) {
                    this.albumProfiles_ = new ArrayList(this.albumProfiles_);
                    this.bitField0_ |= 2;
                }
            }

            private RepeatedFieldBuilderV3<AlbumProfile, Builder, AlbumProfileOrBuilder> getAlbumProfilesFieldBuilder() {
                if (this.albumProfilesBuilder_ == null) {
                    this.albumProfilesBuilder_ = new RepeatedFieldBuilderV3<>(this.albumProfiles_, (this.bitField0_ & 2) != 0, getParentForChildren(), isClean());
                    this.albumProfiles_ = null;
                }
                return this.albumProfilesBuilder_;
            }

            public static final Descriptor getDescriptor() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_descriptor;
            }

            private SingleFieldBuilderV3<Settings, Builder, SettingsOrBuilder> getSettingsFieldBuilder() {
                if (this.settingsBuilder_ == null) {
                    this.settingsBuilder_ = new SingleFieldBuilderV3<>(getSettings(), getParentForChildren(), isClean());
                    this.settings_ = null;
                }
                return this.settingsBuilder_;
            }

            private void maybeForceBuilderInitialization() {
                if (BackupMessage.alwaysUseFieldBuilders) {
                    getAlbumProfilesFieldBuilder();
                }
            }

            public Builder addAlbumProfiles(int i, Builder builder) {
                if (this.albumProfilesBuilder_ == null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.add(i, builder.build());
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.addMessage(i, builder.build());
                }
                return this;
            }

            public Builder addAlbumProfiles(int i, AlbumProfile albumProfile) {
                if (this.albumProfilesBuilder_ != null) {
                    this.albumProfilesBuilder_.addMessage(i, albumProfile);
                } else if (albumProfile != null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.add(i, albumProfile);
                    onChanged();
                } else {
                    throw new NullPointerException();
                }
                return this;
            }

            public Builder addAlbumProfiles(Builder builder) {
                if (this.albumProfilesBuilder_ == null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.add(builder.build());
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.addMessage(builder.build());
                }
                return this;
            }

            public Builder addAlbumProfiles(AlbumProfile albumProfile) {
                if (this.albumProfilesBuilder_ != null) {
                    this.albumProfilesBuilder_.addMessage(albumProfile);
                } else if (albumProfile != null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.add(albumProfile);
                    onChanged();
                } else {
                    throw new NullPointerException();
                }
                return this;
            }

            public Builder addAlbumProfilesBuilder() {
                return (Builder) getAlbumProfilesFieldBuilder().addBuilder(AlbumProfile.getDefaultInstance());
            }

            public Builder addAlbumProfilesBuilder(int i) {
                return (Builder) getAlbumProfilesFieldBuilder().addBuilder(i, AlbumProfile.getDefaultInstance());
            }

            public Builder addAllAlbumProfiles(Iterable<? extends AlbumProfile> iterable) {
                if (this.albumProfilesBuilder_ == null) {
                    ensureAlbumProfilesIsMutable();
                    com.google.protobuf.AbstractMessageLite.Builder.addAll(iterable, this.albumProfiles_);
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.addAllMessages(iterable);
                }
                return this;
            }

            public Builder addRepeatedField(FieldDescriptor fieldDescriptor, Object obj) {
                return (Builder) super.addRepeatedField(fieldDescriptor, obj);
            }

            public BackupMessage build() {
                BackupMessage buildPartial = buildPartial();
                if (buildPartial.isInitialized()) {
                    return buildPartial;
                }
                throw newUninitializedMessageException(buildPartial);
            }

            public BackupMessage buildPartial() {
                BackupMessage backupMessage = new BackupMessage((com.google.protobuf.GeneratedMessageV3.Builder) this);
                int i = this.bitField0_;
                if (this.settingsBuilder_ == null) {
                    backupMessage.settings_ = this.settings_;
                } else {
                    backupMessage.settings_ = (Settings) this.settingsBuilder_.build();
                }
                if (this.albumProfilesBuilder_ == null) {
                    if ((this.bitField0_ & 2) != 0) {
                        this.albumProfiles_ = Collections.unmodifiableList(this.albumProfiles_);
                        this.bitField0_ &= -3;
                    }
                    backupMessage.albumProfiles_ = this.albumProfiles_;
                } else {
                    backupMessage.albumProfiles_ = this.albumProfilesBuilder_.build();
                }
                backupMessage.bitField0_ = 0;
                onBuilt();
                return backupMessage;
            }

            public Builder clear() {
                super.clear();
                if (this.settingsBuilder_ == null) {
                    this.settings_ = null;
                } else {
                    this.settings_ = null;
                    this.settingsBuilder_ = null;
                }
                if (this.albumProfilesBuilder_ == null) {
                    this.albumProfiles_ = Collections.emptyList();
                    this.bitField0_ &= -3;
                } else {
                    this.albumProfilesBuilder_.clear();
                }
                return this;
            }

            public Builder clearAlbumProfiles() {
                if (this.albumProfilesBuilder_ == null) {
                    this.albumProfiles_ = Collections.emptyList();
                    this.bitField0_ &= -3;
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.clear();
                }
                return this;
            }

            public Builder clearField(FieldDescriptor fieldDescriptor) {
                return (Builder) super.clearField(fieldDescriptor);
            }

            public Builder clearOneof(OneofDescriptor oneofDescriptor) {
                return (Builder) super.clearOneof(oneofDescriptor);
            }

            public Builder clearSettings() {
                if (this.settingsBuilder_ == null) {
                    this.settings_ = null;
                    onChanged();
                } else {
                    this.settings_ = null;
                    this.settingsBuilder_ = null;
                }
                return this;
            }

            public Builder clone() {
                return (Builder) super.clone();
            }

            public AlbumProfile getAlbumProfiles(int i) {
                return this.albumProfilesBuilder_ == null ? (AlbumProfile) this.albumProfiles_.get(i) : (AlbumProfile) this.albumProfilesBuilder_.getMessage(i);
            }

            public Builder getAlbumProfilesBuilder(int i) {
                return (Builder) getAlbumProfilesFieldBuilder().getBuilder(i);
            }

            public List<Builder> getAlbumProfilesBuilderList() {
                return getAlbumProfilesFieldBuilder().getBuilderList();
            }

            public int getAlbumProfilesCount() {
                return this.albumProfilesBuilder_ == null ? this.albumProfiles_.size() : this.albumProfilesBuilder_.getCount();
            }

            public List<AlbumProfile> getAlbumProfilesList() {
                return this.albumProfilesBuilder_ == null ? Collections.unmodifiableList(this.albumProfiles_) : this.albumProfilesBuilder_.getMessageList();
            }

            public AlbumProfileOrBuilder getAlbumProfilesOrBuilder(int i) {
                return this.albumProfilesBuilder_ == null ? (AlbumProfileOrBuilder) this.albumProfiles_.get(i) : (AlbumProfileOrBuilder) this.albumProfilesBuilder_.getMessageOrBuilder(i);
            }

            public List<? extends AlbumProfileOrBuilder> getAlbumProfilesOrBuilderList() {
                return this.albumProfilesBuilder_ != null ? this.albumProfilesBuilder_.getMessageOrBuilderList() : Collections.unmodifiableList(this.albumProfiles_);
            }

            public BackupMessage getDefaultInstanceForType() {
                return BackupMessage.getDefaultInstance();
            }

            public Descriptor getDescriptorForType() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_descriptor;
            }

            public Settings getSettings() {
                if (this.settingsBuilder_ != null) {
                    return (Settings) this.settingsBuilder_.getMessage();
                }
                return this.settings_ == null ? Settings.getDefaultInstance() : this.settings_;
            }

            public Builder getSettingsBuilder() {
                onChanged();
                return (Builder) getSettingsFieldBuilder().getBuilder();
            }

            public SettingsOrBuilder getSettingsOrBuilder() {
                if (this.settingsBuilder_ != null) {
                    return (SettingsOrBuilder) this.settingsBuilder_.getMessageOrBuilder();
                }
                return this.settings_ == null ? Settings.getDefaultInstance() : this.settings_;
            }

            public boolean hasSettings() {
                return (this.settingsBuilder_ == null && this.settings_ == null) ? false : true;
            }

            /* access modifiers changed from: protected */
            public FieldAccessorTable internalGetFieldAccessorTable() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable.ensureFieldAccessorsInitialized(BackupMessage.class, Builder.class);
            }

            public final boolean isInitialized() {
                return true;
            }

            /* JADX WARNING: Removed duplicated region for block: B:16:0x0023  */
            public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                BackupMessage backupMessage;
                BackupMessage backupMessage2 = null;
                try {
                    BackupMessage backupMessage3 = (BackupMessage) BackupMessage.PARSER.parsePartialFrom(codedInputStream, extensionRegistryLite);
                    if (backupMessage3 != null) {
                        mergeFrom(backupMessage3);
                    }
                    return this;
                } catch (InvalidProtocolBufferException e) {
                    backupMessage = (BackupMessage) e.getUnfinishedMessage();
                    throw e.unwrapIOException();
                } catch (Throwable th) {
                    th = th;
                    backupMessage2 = backupMessage;
                    if (backupMessage2 != null) {
                    }
                    throw th;
                }
            }

            public Builder mergeFrom(Message message) {
                if (message instanceof BackupMessage) {
                    return mergeFrom((BackupMessage) message);
                }
                super.mergeFrom(message);
                return this;
            }

            public Builder mergeFrom(BackupMessage backupMessage) {
                if (backupMessage == BackupMessage.getDefaultInstance()) {
                    return this;
                }
                if (backupMessage.hasSettings()) {
                    mergeSettings(backupMessage.getSettings());
                }
                if (this.albumProfilesBuilder_ == null) {
                    if (!backupMessage.albumProfiles_.isEmpty()) {
                        if (this.albumProfiles_.isEmpty()) {
                            this.albumProfiles_ = backupMessage.albumProfiles_;
                            this.bitField0_ &= -3;
                        } else {
                            ensureAlbumProfilesIsMutable();
                            this.albumProfiles_.addAll(backupMessage.albumProfiles_);
                        }
                        onChanged();
                    }
                } else if (!backupMessage.albumProfiles_.isEmpty()) {
                    if (this.albumProfilesBuilder_.isEmpty()) {
                        this.albumProfilesBuilder_.dispose();
                        RepeatedFieldBuilderV3<AlbumProfile, Builder, AlbumProfileOrBuilder> repeatedFieldBuilderV3 = null;
                        this.albumProfilesBuilder_ = null;
                        this.albumProfiles_ = backupMessage.albumProfiles_;
                        this.bitField0_ &= -3;
                        if (BackupMessage.alwaysUseFieldBuilders) {
                            repeatedFieldBuilderV3 = getAlbumProfilesFieldBuilder();
                        }
                        this.albumProfilesBuilder_ = repeatedFieldBuilderV3;
                    } else {
                        this.albumProfilesBuilder_.addAllMessages(backupMessage.albumProfiles_);
                    }
                }
                mergeUnknownFields(backupMessage.unknownFields);
                onChanged();
                return this;
            }

            public Builder mergeSettings(Settings settings) {
                if (this.settingsBuilder_ == null) {
                    if (this.settings_ != null) {
                        this.settings_ = Settings.newBuilder(this.settings_).mergeFrom(settings).buildPartial();
                    } else {
                        this.settings_ = settings;
                    }
                    onChanged();
                } else {
                    this.settingsBuilder_.mergeFrom(settings);
                }
                return this;
            }

            public final Builder mergeUnknownFields(UnknownFieldSet unknownFieldSet) {
                return (Builder) super.mergeUnknownFields(unknownFieldSet);
            }

            public Builder removeAlbumProfiles(int i) {
                if (this.albumProfilesBuilder_ == null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.remove(i);
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.remove(i);
                }
                return this;
            }

            public Builder setAlbumProfiles(int i, Builder builder) {
                if (this.albumProfilesBuilder_ == null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.set(i, builder.build());
                    onChanged();
                } else {
                    this.albumProfilesBuilder_.setMessage(i, builder.build());
                }
                return this;
            }

            public Builder setAlbumProfiles(int i, AlbumProfile albumProfile) {
                if (this.albumProfilesBuilder_ != null) {
                    this.albumProfilesBuilder_.setMessage(i, albumProfile);
                } else if (albumProfile != null) {
                    ensureAlbumProfilesIsMutable();
                    this.albumProfiles_.set(i, albumProfile);
                    onChanged();
                } else {
                    throw new NullPointerException();
                }
                return this;
            }

            public Builder setField(FieldDescriptor fieldDescriptor, Object obj) {
                return (Builder) super.setField(fieldDescriptor, obj);
            }

            public Builder setRepeatedField(FieldDescriptor fieldDescriptor, int i, Object obj) {
                return (Builder) super.setRepeatedField(fieldDescriptor, i, obj);
            }

            public Builder setSettings(Builder builder) {
                if (this.settingsBuilder_ == null) {
                    this.settings_ = builder.build();
                    onChanged();
                } else {
                    this.settingsBuilder_.setMessage(builder.build());
                }
                return this;
            }

            public Builder setSettings(Settings settings) {
                if (this.settingsBuilder_ != null) {
                    this.settingsBuilder_.setMessage(settings);
                } else if (settings != null) {
                    this.settings_ = settings;
                    onChanged();
                } else {
                    throw new NullPointerException();
                }
                return this;
            }

            public final Builder setUnknownFields(UnknownFieldSet unknownFieldSet) {
                return (Builder) super.setUnknownFields(unknownFieldSet);
            }
        }

        public static final class Settings extends GeneratedMessageV3 implements SettingsOrBuilder {
            private static final Settings DEFAULT_INSTANCE = new Settings();
            public static final int ONLYSHOWLOCALPHOTO_FIELD_NUMBER = 1;
            /* access modifiers changed from: private */
            public static final Parser<Settings> PARSER = new AbstractParser<Settings>() {
                public Settings parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                    return new Settings(codedInputStream, extensionRegistryLite);
                }
            };
            public static final int REMINDCONNECTNETWORKEVERYTIME_FIELD_NUMBER = 4;
            public static final int SHOWHIDDENALBUM_FIELD_NUMBER = 2;
            public static final int SLIDESHOWINTERVAL_FIELD_NUMBER = 3;
            private static final long serialVersionUID = 0;
            private byte memoizedIsInitialized;
            /* access modifiers changed from: private */
            public boolean onlyShowLocalPhoto_;
            /* access modifiers changed from: private */
            public boolean remindConnectNetworkEveryTime_;
            /* access modifiers changed from: private */
            public boolean showHiddenAlbum_;
            /* access modifiers changed from: private */
            public int slideshowInterval_;

            public static final class Builder extends com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements SettingsOrBuilder {
                private boolean onlyShowLocalPhoto_;
                private boolean remindConnectNetworkEveryTime_;
                private boolean showHiddenAlbum_;
                private int slideshowInterval_;

                private Builder() {
                    maybeForceBuilderInitialization();
                }

                private Builder(BuilderParent builderParent) {
                    super(builderParent);
                    maybeForceBuilderInitialization();
                }

                public static final Descriptor getDescriptor() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor;
                }

                private void maybeForceBuilderInitialization() {
                    Settings.alwaysUseFieldBuilders;
                }

                public Builder addRepeatedField(FieldDescriptor fieldDescriptor, Object obj) {
                    return (Builder) super.addRepeatedField(fieldDescriptor, obj);
                }

                public Settings build() {
                    Settings buildPartial = buildPartial();
                    if (buildPartial.isInitialized()) {
                        return buildPartial;
                    }
                    throw newUninitializedMessageException(buildPartial);
                }

                public Settings buildPartial() {
                    Settings settings = new Settings((com.google.protobuf.GeneratedMessageV3.Builder) this);
                    settings.onlyShowLocalPhoto_ = this.onlyShowLocalPhoto_;
                    settings.showHiddenAlbum_ = this.showHiddenAlbum_;
                    settings.slideshowInterval_ = this.slideshowInterval_;
                    settings.remindConnectNetworkEveryTime_ = this.remindConnectNetworkEveryTime_;
                    onBuilt();
                    return settings;
                }

                public Builder clear() {
                    super.clear();
                    this.onlyShowLocalPhoto_ = false;
                    this.showHiddenAlbum_ = false;
                    this.slideshowInterval_ = 0;
                    this.remindConnectNetworkEveryTime_ = false;
                    return this;
                }

                public Builder clearField(FieldDescriptor fieldDescriptor) {
                    return (Builder) super.clearField(fieldDescriptor);
                }

                public Builder clearOneof(OneofDescriptor oneofDescriptor) {
                    return (Builder) super.clearOneof(oneofDescriptor);
                }

                public Builder clearOnlyShowLocalPhoto() {
                    this.onlyShowLocalPhoto_ = false;
                    onChanged();
                    return this;
                }

                @Deprecated
                public Builder clearRemindConnectNetworkEveryTime() {
                    this.remindConnectNetworkEveryTime_ = false;
                    onChanged();
                    return this;
                }

                public Builder clearShowHiddenAlbum() {
                    this.showHiddenAlbum_ = false;
                    onChanged();
                    return this;
                }

                public Builder clearSlideshowInterval() {
                    this.slideshowInterval_ = 0;
                    onChanged();
                    return this;
                }

                public Builder clone() {
                    return (Builder) super.clone();
                }

                public Settings getDefaultInstanceForType() {
                    return Settings.getDefaultInstance();
                }

                public Descriptor getDescriptorForType() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor;
                }

                public boolean getOnlyShowLocalPhoto() {
                    return this.onlyShowLocalPhoto_;
                }

                @Deprecated
                public boolean getRemindConnectNetworkEveryTime() {
                    return this.remindConnectNetworkEveryTime_;
                }

                public boolean getShowHiddenAlbum() {
                    return this.showHiddenAlbum_;
                }

                public int getSlideshowInterval() {
                    return this.slideshowInterval_;
                }

                /* access modifiers changed from: protected */
                public FieldAccessorTable internalGetFieldAccessorTable() {
                    return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable.ensureFieldAccessorsInitialized(Settings.class, Builder.class);
                }

                public final boolean isInitialized() {
                    return true;
                }

                /* JADX WARNING: Removed duplicated region for block: B:16:0x0023  */
                public Builder mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                    Settings settings;
                    Settings settings2 = null;
                    try {
                        Settings settings3 = (Settings) Settings.PARSER.parsePartialFrom(codedInputStream, extensionRegistryLite);
                        if (settings3 != null) {
                            mergeFrom(settings3);
                        }
                        return this;
                    } catch (InvalidProtocolBufferException e) {
                        settings = (Settings) e.getUnfinishedMessage();
                        throw e.unwrapIOException();
                    } catch (Throwable th) {
                        th = th;
                        settings2 = settings;
                        if (settings2 != null) {
                        }
                        throw th;
                    }
                }

                public Builder mergeFrom(Message message) {
                    if (message instanceof Settings) {
                        return mergeFrom((Settings) message);
                    }
                    super.mergeFrom(message);
                    return this;
                }

                public Builder mergeFrom(Settings settings) {
                    if (settings == Settings.getDefaultInstance()) {
                        return this;
                    }
                    if (settings.getOnlyShowLocalPhoto()) {
                        setOnlyShowLocalPhoto(settings.getOnlyShowLocalPhoto());
                    }
                    if (settings.getShowHiddenAlbum()) {
                        setShowHiddenAlbum(settings.getShowHiddenAlbum());
                    }
                    if (settings.getSlideshowInterval() != 0) {
                        setSlideshowInterval(settings.getSlideshowInterval());
                    }
                    if (settings.getRemindConnectNetworkEveryTime()) {
                        setRemindConnectNetworkEveryTime(settings.getRemindConnectNetworkEveryTime());
                    }
                    mergeUnknownFields(settings.unknownFields);
                    onChanged();
                    return this;
                }

                public final Builder mergeUnknownFields(UnknownFieldSet unknownFieldSet) {
                    return (Builder) super.mergeUnknownFields(unknownFieldSet);
                }

                public Builder setField(FieldDescriptor fieldDescriptor, Object obj) {
                    return (Builder) super.setField(fieldDescriptor, obj);
                }

                public Builder setOnlyShowLocalPhoto(boolean z) {
                    this.onlyShowLocalPhoto_ = z;
                    onChanged();
                    return this;
                }

                @Deprecated
                public Builder setRemindConnectNetworkEveryTime(boolean z) {
                    this.remindConnectNetworkEveryTime_ = z;
                    onChanged();
                    return this;
                }

                public Builder setRepeatedField(FieldDescriptor fieldDescriptor, int i, Object obj) {
                    return (Builder) super.setRepeatedField(fieldDescriptor, i, obj);
                }

                public Builder setShowHiddenAlbum(boolean z) {
                    this.showHiddenAlbum_ = z;
                    onChanged();
                    return this;
                }

                public Builder setSlideshowInterval(int i) {
                    this.slideshowInterval_ = i;
                    onChanged();
                    return this;
                }

                public final Builder setUnknownFields(UnknownFieldSet unknownFieldSet) {
                    return (Builder) super.setUnknownFields(unknownFieldSet);
                }
            }

            private Settings() {
                this.memoizedIsInitialized = -1;
            }

            private Settings(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                this();
                if (extensionRegistryLite != null) {
                    com.google.protobuf.UnknownFieldSet.Builder newBuilder = UnknownFieldSet.newBuilder();
                    boolean z = false;
                    while (!z) {
                        try {
                            int readTag = codedInputStream.readTag();
                            if (readTag != 0) {
                                if (readTag == 8) {
                                    this.onlyShowLocalPhoto_ = codedInputStream.readBool();
                                } else if (readTag == 16) {
                                    this.showHiddenAlbum_ = codedInputStream.readBool();
                                } else if (readTag == 24) {
                                    this.slideshowInterval_ = codedInputStream.readInt32();
                                } else if (readTag == 32) {
                                    this.remindConnectNetworkEveryTime_ = codedInputStream.readBool();
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

            private Settings(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
                super(builder);
                this.memoizedIsInitialized = -1;
            }

            public static Settings getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static final Descriptor getDescriptor() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor;
            }

            public static Builder newBuilder() {
                return DEFAULT_INSTANCE.toBuilder();
            }

            public static Builder newBuilder(Settings settings) {
                return DEFAULT_INSTANCE.toBuilder().mergeFrom(settings);
            }

            public static Settings parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Settings) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream);
            }

            public static Settings parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (Settings) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream, extensionRegistryLite);
            }

            public static Settings parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(byteString);
            }

            public static Settings parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(byteString, extensionRegistryLite);
            }

            public static Settings parseFrom(CodedInputStream codedInputStream) throws IOException {
                return (Settings) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream);
            }

            public static Settings parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (Settings) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream, extensionRegistryLite);
            }

            public static Settings parseFrom(InputStream inputStream) throws IOException {
                return (Settings) GeneratedMessageV3.parseWithIOException(PARSER, inputStream);
            }

            public static Settings parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
                return (Settings) GeneratedMessageV3.parseWithIOException(PARSER, inputStream, extensionRegistryLite);
            }

            public static Settings parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(byteBuffer);
            }

            public static Settings parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(byteBuffer, extensionRegistryLite);
            }

            public static Settings parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(bArr);
            }

            public static Settings parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
                return (Settings) PARSER.parseFrom(bArr, extensionRegistryLite);
            }

            public static Parser<Settings> parser() {
                return PARSER;
            }

            public boolean equals(Object obj) {
                if (obj == this) {
                    return true;
                }
                if (!(obj instanceof Settings)) {
                    return super.equals(obj);
                }
                Settings settings = (Settings) obj;
                return getOnlyShowLocalPhoto() == settings.getOnlyShowLocalPhoto() && getShowHiddenAlbum() == settings.getShowHiddenAlbum() && getSlideshowInterval() == settings.getSlideshowInterval() && getRemindConnectNetworkEveryTime() == settings.getRemindConnectNetworkEveryTime() && this.unknownFields.equals(settings.unknownFields);
            }

            public Settings getDefaultInstanceForType() {
                return DEFAULT_INSTANCE;
            }

            public boolean getOnlyShowLocalPhoto() {
                return this.onlyShowLocalPhoto_;
            }

            public Parser<Settings> getParserForType() {
                return PARSER;
            }

            @Deprecated
            public boolean getRemindConnectNetworkEveryTime() {
                return this.remindConnectNetworkEveryTime_;
            }

            public int getSerializedSize() {
                int i = this.memoizedSize;
                if (i != -1) {
                    return i;
                }
                int i2 = 0;
                if (this.onlyShowLocalPhoto_) {
                    i2 = 0 + CodedOutputStream.computeBoolSize(1, this.onlyShowLocalPhoto_);
                }
                if (this.showHiddenAlbum_) {
                    i2 += CodedOutputStream.computeBoolSize(2, this.showHiddenAlbum_);
                }
                if (this.slideshowInterval_ != 0) {
                    i2 += CodedOutputStream.computeInt32Size(3, this.slideshowInterval_);
                }
                if (this.remindConnectNetworkEveryTime_) {
                    i2 += CodedOutputStream.computeBoolSize(4, this.remindConnectNetworkEveryTime_);
                }
                int serializedSize = i2 + this.unknownFields.getSerializedSize();
                this.memoizedSize = serializedSize;
                return serializedSize;
            }

            public boolean getShowHiddenAlbum() {
                return this.showHiddenAlbum_;
            }

            public int getSlideshowInterval() {
                return this.slideshowInterval_;
            }

            public final UnknownFieldSet getUnknownFields() {
                return this.unknownFields;
            }

            public int hashCode() {
                if (this.memoizedHashCode != 0) {
                    return this.memoizedHashCode;
                }
                int hashCode = ((((((((((((((((((779 + getDescriptor().hashCode()) * 37) + 1) * 53) + Internal.hashBoolean(getOnlyShowLocalPhoto())) * 37) + 2) * 53) + Internal.hashBoolean(getShowHiddenAlbum())) * 37) + 3) * 53) + getSlideshowInterval()) * 37) + 4) * 53) + Internal.hashBoolean(getRemindConnectNetworkEveryTime())) * 29) + this.unknownFields.hashCode();
                this.memoizedHashCode = hashCode;
                return hashCode;
            }

            /* access modifiers changed from: protected */
            public FieldAccessorTable internalGetFieldAccessorTable() {
                return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable.ensureFieldAccessorsInitialized(Settings.class, Builder.class);
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
                if (this.onlyShowLocalPhoto_) {
                    codedOutputStream.writeBool(1, this.onlyShowLocalPhoto_);
                }
                if (this.showHiddenAlbum_) {
                    codedOutputStream.writeBool(2, this.showHiddenAlbum_);
                }
                if (this.slideshowInterval_ != 0) {
                    codedOutputStream.writeInt32(3, this.slideshowInterval_);
                }
                if (this.remindConnectNetworkEveryTime_) {
                    codedOutputStream.writeBool(4, this.remindConnectNetworkEveryTime_);
                }
                this.unknownFields.writeTo(codedOutputStream);
            }
        }

        public interface SettingsOrBuilder extends MessageOrBuilder {
            boolean getOnlyShowLocalPhoto();

            @Deprecated
            boolean getRemindConnectNetworkEveryTime();

            boolean getShowHiddenAlbum();

            int getSlideshowInterval();
        }

        private BackupMessage() {
            this.memoizedIsInitialized = -1;
            this.albumProfiles_ = Collections.emptyList();
        }

        private BackupMessage(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
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
                                Builder builder = null;
                                if (this.settings_ != null) {
                                    builder = this.settings_.toBuilder();
                                }
                                this.settings_ = (Settings) codedInputStream.readMessage(Settings.parser(), extensionRegistryLite);
                                if (builder != null) {
                                    builder.mergeFrom(this.settings_);
                                    this.settings_ = builder.buildPartial();
                                }
                            } else if (readTag == 18) {
                                if (!z2 || !true) {
                                    this.albumProfiles_ = new ArrayList();
                                    z2 |= true;
                                }
                                this.albumProfiles_.add(codedInputStream.readMessage(AlbumProfile.parser(), extensionRegistryLite));
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
                            this.albumProfiles_ = Collections.unmodifiableList(this.albumProfiles_);
                        }
                        this.unknownFields = newBuilder.build();
                        makeExtensionsImmutable();
                        throw th;
                    }
                }
                if (z2 && true) {
                    this.albumProfiles_ = Collections.unmodifiableList(this.albumProfiles_);
                }
                this.unknownFields = newBuilder.build();
                makeExtensionsImmutable();
                return;
            }
            throw new NullPointerException();
        }

        private BackupMessage(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
            super(builder);
            this.memoizedIsInitialized = -1;
        }

        public static BackupMessage getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static final Descriptor getDescriptor() {
            return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_descriptor;
        }

        public static Builder newBuilder() {
            return DEFAULT_INSTANCE.toBuilder();
        }

        public static Builder newBuilder(BackupMessage backupMessage) {
            return DEFAULT_INSTANCE.toBuilder().mergeFrom(backupMessage);
        }

        public static BackupMessage parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream);
        }

        public static BackupMessage parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseDelimitedWithIOException(PARSER, inputStream, extensionRegistryLite);
        }

        public static BackupMessage parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(byteString);
        }

        public static BackupMessage parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(byteString, extensionRegistryLite);
        }

        public static BackupMessage parseFrom(CodedInputStream codedInputStream) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream);
        }

        public static BackupMessage parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseWithIOException(PARSER, codedInputStream, extensionRegistryLite);
        }

        public static BackupMessage parseFrom(InputStream inputStream) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseWithIOException(PARSER, inputStream);
        }

        public static BackupMessage parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            return (BackupMessage) GeneratedMessageV3.parseWithIOException(PARSER, inputStream, extensionRegistryLite);
        }

        public static BackupMessage parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(byteBuffer);
        }

        public static BackupMessage parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(byteBuffer, extensionRegistryLite);
        }

        public static BackupMessage parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(bArr);
        }

        public static BackupMessage parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
            return (BackupMessage) PARSER.parseFrom(bArr, extensionRegistryLite);
        }

        public static Parser<BackupMessage> parser() {
            return PARSER;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof BackupMessage)) {
                return super.equals(obj);
            }
            BackupMessage backupMessage = (BackupMessage) obj;
            if (hasSettings() != backupMessage.hasSettings()) {
                return false;
            }
            return (!hasSettings() || getSettings().equals(backupMessage.getSettings())) && getAlbumProfilesList().equals(backupMessage.getAlbumProfilesList()) && this.unknownFields.equals(backupMessage.unknownFields);
        }

        public AlbumProfile getAlbumProfiles(int i) {
            return (AlbumProfile) this.albumProfiles_.get(i);
        }

        public int getAlbumProfilesCount() {
            return this.albumProfiles_.size();
        }

        public List<AlbumProfile> getAlbumProfilesList() {
            return this.albumProfiles_;
        }

        public AlbumProfileOrBuilder getAlbumProfilesOrBuilder(int i) {
            return (AlbumProfileOrBuilder) this.albumProfiles_.get(i);
        }

        public List<? extends AlbumProfileOrBuilder> getAlbumProfilesOrBuilderList() {
            return this.albumProfiles_;
        }

        public BackupMessage getDefaultInstanceForType() {
            return DEFAULT_INSTANCE;
        }

        public Parser<BackupMessage> getParserForType() {
            return PARSER;
        }

        public int getSerializedSize() {
            int i = this.memoizedSize;
            if (i != -1) {
                return i;
            }
            int computeMessageSize = this.settings_ != null ? CodedOutputStream.computeMessageSize(1, getSettings()) + 0 : 0;
            for (int i2 = 0; i2 < this.albumProfiles_.size(); i2++) {
                computeMessageSize += CodedOutputStream.computeMessageSize(2, (MessageLite) this.albumProfiles_.get(i2));
            }
            int serializedSize = computeMessageSize + this.unknownFields.getSerializedSize();
            this.memoizedSize = serializedSize;
            return serializedSize;
        }

        public Settings getSettings() {
            return this.settings_ == null ? Settings.getDefaultInstance() : this.settings_;
        }

        public SettingsOrBuilder getSettingsOrBuilder() {
            return getSettings();
        }

        public final UnknownFieldSet getUnknownFields() {
            return this.unknownFields;
        }

        public boolean hasSettings() {
            return this.settings_ != null;
        }

        public int hashCode() {
            if (this.memoizedHashCode != 0) {
                return this.memoizedHashCode;
            }
            int hashCode = 779 + getDescriptor().hashCode();
            if (hasSettings()) {
                hashCode = (((hashCode * 37) + 1) * 53) + getSettings().hashCode();
            }
            if (getAlbumProfilesCount() > 0) {
                hashCode = (((hashCode * 37) + 2) * 53) + getAlbumProfilesList().hashCode();
            }
            int hashCode2 = (hashCode * 29) + this.unknownFields.hashCode();
            this.memoizedHashCode = hashCode2;
            return hashCode2;
        }

        /* access modifiers changed from: protected */
        public FieldAccessorTable internalGetFieldAccessorTable() {
            return GalleryBackupProtos.internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable.ensureFieldAccessorsInitialized(BackupMessage.class, Builder.class);
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
            if (this.settings_ != null) {
                codedOutputStream.writeMessage(1, getSettings());
            }
            for (int i = 0; i < this.albumProfiles_.size(); i++) {
                codedOutputStream.writeMessage(2, (MessageLite) this.albumProfiles_.get(i));
            }
            this.unknownFields.writeTo(codedOutputStream);
        }
    }

    public interface BackupMessageOrBuilder extends MessageOrBuilder {
        AlbumProfile getAlbumProfiles(int i);

        int getAlbumProfilesCount();

        List<AlbumProfile> getAlbumProfilesList();

        AlbumProfileOrBuilder getAlbumProfilesOrBuilder(int i);

        List<? extends AlbumProfileOrBuilder> getAlbumProfilesOrBuilderList();

        Settings getSettings();

        SettingsOrBuilder getSettingsOrBuilder();

        boolean hasSettings();
    }

    static {
        FileDescriptor.internalBuildGeneratedFileFrom(new String[]{"\n+com.miui.gallery.backup/GalleryBackup.proto\u0012\u0017com.miui.gallery.backup\"æ\u0002\n\rBackupMessage\u0012A\n\bsettings\u0018\u0001 \u0001(\u000b2/.com.miui.gallery.backup.BackupMessage.Settings\u0012J\n\ralbumProfiles\u0018\u0002 \u0003(\u000b23.com.miui.gallery.backup.BackupMessage.AlbumProfile\u001a\u0001\n\bSettings\u0012\u001a\n\u0012onlyShowLocalPhoto\u0018\u0001 \u0001(\b\u0012\u0017\n\u000fshowHiddenAlbum\u0018\u0002 \u0001(\b\u0012\u0019\n\u0011slideshowInterval\u0018\u0003 \u0001(\u0005\u0012)\n\u001dremindConnectNetworkEveryTime\u0018\u0004 \u0001(\bB\u0002\u0018\u0001\u001a>\n\fAlbumProfile\u0012\f\n\u0004path\u0018\u0001 \u0001(\t\u0012\f\n\u0004name\u0018\u0002 \u0001(\t\u0012\u0012\n\nattributes\u0018\u0003 \u0001(\u0003B.\n\u0017com.miui.gallery.backupB\u0013GalleryBackupProtosb\u0006proto3"}, new FileDescriptor[0], new InternalDescriptorAssigner() {
            public ExtensionRegistry assignDescriptors(FileDescriptor fileDescriptor) {
                GalleryBackupProtos.descriptor = fileDescriptor;
                return null;
            }
        });
    }

    private GalleryBackupProtos() {
    }

    public static FileDescriptor getDescriptor() {
        return descriptor;
    }

    public static void registerAllExtensions(ExtensionRegistry extensionRegistry) {
        registerAllExtensions((ExtensionRegistryLite) extensionRegistry);
    }

    public static void registerAllExtensions(ExtensionRegistryLite extensionRegistryLite) {
    }
}
