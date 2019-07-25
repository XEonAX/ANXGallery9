.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
.super Lcom/google/protobuf/GeneratedMessageV3;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BackupMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;,
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;,
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;,
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;,
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;
    }
.end annotation


# static fields
.field public static final ALBUMPROFILES_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

.field private static final PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final SETTINGS_FIELD_NUMBER:I = 0x1

.field private static final serialVersionUID:J


# instance fields
.field private albumProfiles_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation
.end field

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$1;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3;-><init>()V

    const/4 v0, -0x1

    iput-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedIsInitialized:B

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;-><init>()V

    if-eqz p2, :cond_9

    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    if-nez v1, :cond_7

    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_5

    const/16 v5, 0xa

    if-eq v3, v5, :cond_3

    const/16 v5, 0x12

    if-eq v3, v5, :cond_1

    invoke-virtual {p0, p1, v0, p2, v3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_1
    and-int/lit8 v3, v2, 0x2

    if-nez v3, :cond_2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    or-int/lit8 v2, v2, 0x2

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->parser()Lcom/google/protobuf/Parser;

    move-result-object v4

    invoke-virtual {p1, v4, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v4, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {v3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v3

    :cond_4
    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->parser()Lcom/google/protobuf/Parser;

    move-result-object v4

    invoke-virtual {p1, v4, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    iput-object v4, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {v3, v4}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    invoke-virtual {v3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_5
    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/io/IOException;)V

    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1

    :catch_1
    move-exception p1

    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    and-int/lit8 p2, v2, 0x2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    :cond_6
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->makeExtensionsImmutable()V

    throw p1

    :cond_7
    and-int/lit8 p1, v2, 0x2

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    :cond_8
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->makeExtensionsImmutable()V

    return-void

    :cond_9
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessageV3$Builder<",
            "*>;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;)V

    const/4 p1, -0x1

    iput-byte p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedIsInitialized:B

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;)V

    return-void
.end method

.method static synthetic access$3100()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$3302(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p1
.end method

.method static synthetic access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$3402(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$3502(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->bitField0_:I

    return p1
.end method

.method static synthetic access$3600()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$3700(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/google/protobuf/UnknownFieldSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object p0
.end method

.method static synthetic access$3800()Lcom/google/protobuf/Parser;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public static getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$000()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    if-nez v1, :cond_1

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->hasSettings()Z

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->hasSettings()Z

    move-result v2

    const/4 v3, 0x0

    if-eq v1, v2, :cond_2

    return v3

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->hasSettings()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v3

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getAlbumProfilesList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getAlbumProfilesList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v3

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    iget-object p1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1, p1}, Lcom/google/protobuf/UnknownFieldSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    return v3

    :cond_5
    return v0
.end method

.method public getAlbumProfiles(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p1
.end method

.method public getAlbumProfilesCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getAlbumProfilesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    return-object v0
.end method

.method public getAlbumProfilesOrBuilder(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;

    return-object p1
.end method

.method public getAlbumProfilesOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/MessageLite;

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedSize:I

    return v0
.end method

.method public getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :goto_0
    return-object v0
.end method

.method public getSettingsOrBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasSettings()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedHashCode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedHashCode:I

    return v0

    :cond_0
    const/16 v0, 0x30b

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->hasSettings()Z

    move-result v1

    if-eqz v1, :cond_1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getAlbumProfilesCount()I

    move-result v1

    if-lez v1, :cond_2

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x2

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getAlbumProfilesList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    mul-int/lit8 v0, v0, 0x1d

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedHashCode:I

    return v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$100()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    const-class v2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method public final isInitialized()Z
    .locals 2

    iget-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedIsInitialized:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iput-byte v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->memoizedIsInitialized:B

    return v1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    const/4 v1, 0x0

    if-ne p0, v0, :cond_0

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->albumProfiles_:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/MessageLite;

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    return-void
.end method
