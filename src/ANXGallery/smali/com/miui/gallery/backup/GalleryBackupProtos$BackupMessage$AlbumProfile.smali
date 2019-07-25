.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
.super Lcom/google/protobuf/GeneratedMessageV3;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AlbumProfile"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    }
.end annotation


# static fields
.field public static final ATTRIBUTES_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field private static final PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final PATH_FIELD_NUMBER:I = 0x1

.field private static final serialVersionUID:J


# instance fields
.field private attributes_:J

.field private memoizedIsInitialized:B

.field private volatile name_:Ljava/lang/Object;

.field private volatile path_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$1;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3;-><init>()V

    const/4 v0, -0x1

    iput-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedIsInitialized:B

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;-><init>()V

    if-eqz p2, :cond_6

    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    if-nez v1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_4

    const/16 v4, 0xa

    if-eq v2, v4, :cond_3

    const/16 v4, 0x12

    if-eq v2, v4, :cond_2

    const/16 v4, 0x18

    if-eq v2, v4, :cond_1

    invoke-virtual {p0, p1, v0, p2, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_4
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
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->makeExtensionsImmutable()V

    throw p1

    :cond_5
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->makeExtensionsImmutable()V

    return-void

    :cond_6
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

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    iput-byte p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedIsInitialized:B

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;)V

    return-void
.end method

.method static synthetic access$1900()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$2102(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$2202(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    return-wide p1
.end method

.method static synthetic access$2400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/google/protobuf/UnknownFieldSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object p0
.end method

.method static synthetic access$2500()Lcom/google/protobuf/Parser;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/google/protobuf/ByteString;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/google/protobuf/ByteString;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$1500()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    if-nez v1, :cond_1

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-eqz v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    iget-object p1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1, p1}, Lcom/google/protobuf/UnknownFieldSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public getAttributes()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    return-wide v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    return-object v0
.end method

.method public getPathBytes()Lcom/google/protobuf/ByteString;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 6

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPathBytes()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/google/protobuf/GeneratedMessageV3;->computeStringSize(ILjava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/google/protobuf/GeneratedMessageV3;->computeStringSize(ILjava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget-wide v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    const/4 v1, 0x3

    iget-wide v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    invoke-static {v1, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedSize:I

    return v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedHashCode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedHashCode:I

    return v0

    :cond_0
    const/16 v0, 0x30b

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x2

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1d

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedHashCode:I

    return v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$1600()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    const-class v2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method public final isInitialized()Z
    .locals 2

    iget-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedIsInitialized:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iput-byte v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->memoizedIsInitialized:B

    return v1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    const/4 v1, 0x0

    if-ne p0, v0, :cond_0

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPathBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->path_:Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageV3;->writeString(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->name_:Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageV3;->writeString(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;)V

    :cond_1
    iget-wide v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->attributes_:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt64(IJ)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    return-void
.end method
