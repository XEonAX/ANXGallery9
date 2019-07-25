.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
.super Lcom/google/protobuf/GeneratedMessageV3;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Settings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

.field public static final ONLYSHOWLOCALPHOTO_FIELD_NUMBER:I = 0x1

.field private static final PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMINDCONNECTNETWORKEVERYTIME_FIELD_NUMBER:I = 0x4

.field public static final SHOWHIDDENALBUM_FIELD_NUMBER:I = 0x2

.field public static final SLIDESHOWINTERVAL_FIELD_NUMBER:I = 0x3

.field private static final serialVersionUID:J


# instance fields
.field private memoizedIsInitialized:B

.field private onlyShowLocalPhoto_:Z

.field private remindConnectNetworkEveryTime_:Z

.field private showHiddenAlbum_:Z

.field private slideshowInterval_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$1;

    invoke-direct {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3;-><init>()V

    const/4 v0, -0x1

    iput-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedIsInitialized:B

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;-><init>()V

    if-eqz p2, :cond_7

    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    if-nez v1, :cond_6

    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_5

    const/16 v4, 0x8

    if-eq v2, v4, :cond_4

    const/16 v4, 0x10

    if-eq v2, v4, :cond_3

    const/16 v4, 0x18

    if-eq v2, v4, :cond_2

    const/16 v4, 0x20

    if-eq v2, v4, :cond_1

    invoke-virtual {p0, p1, v0, p2, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBool()Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBool()Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBool()Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z
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
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->makeExtensionsImmutable()V

    throw p1

    :cond_6
    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->makeExtensionsImmutable()V

    return-void

    :cond_7
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

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    iput-byte p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedIsInitialized:B

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;)V

    return-void
.end method

.method static synthetic access$1002(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    return p1
.end method

.method static synthetic access$1102(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/google/protobuf/UnknownFieldSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object p0
.end method

.method static synthetic access$1300()Lcom/google/protobuf/Parser;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method static synthetic access$600()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$802(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    return p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    return p1
.end method

.method public static getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$200()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseDelimitedWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->parseWithIOException(Lcom/google/protobuf/Parser;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-nez v1, :cond_1

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v2

    const/4 v3, 0x0

    if-eq v1, v2, :cond_2

    return v3

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v2

    if-eq v1, v2, :cond_3

    return v3

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result v2

    if-eq v1, v2, :cond_4

    return v3

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getRemindConnectNetworkEveryTime()Z

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getRemindConnectNetworkEveryTime()Z

    move-result v2

    if-eq v1, v2, :cond_5

    return v3

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    iget-object p1, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1, p1}, Lcom/google/protobuf/UnknownFieldSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    return v3

    :cond_6
    return v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object v0
.end method

.method public getOnlyShowLocalPhoto()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    return v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getRemindConnectNetworkEveryTime()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    return v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    iget-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    if-eqz v1, :cond_3

    const/4 v1, 0x3

    iget v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedSize:I

    return v0
.end method

.method public getShowHiddenAlbum()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    return v0
.end method

.method public getSlideshowInterval()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    return v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedHashCode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedHashCode:I

    return v0

    :cond_0
    const/16 v0, 0x30b

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v1

    invoke-static {v1}, Lcom/google/protobuf/Internal;->hashBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x2

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v1

    invoke-static {v1}, Lcom/google/protobuf/Internal;->hashBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x4

    mul-int/lit8 v0, v0, 0x35

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getRemindConnectNetworkEveryTime()Z

    move-result v1

    invoke-static {v1}, Lcom/google/protobuf/Internal;->hashBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1d

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v1}, Lcom/google/protobuf/UnknownFieldSet;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedHashCode:I

    return v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$300()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    const-class v2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method public final isInitialized()Z
    .locals 2

    iget-byte v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedIsInitialized:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iput-byte v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->memoizedIsInitialized:B

    return v1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 2

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->DEFAULT_INSTANCE:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    const/4 v1, 0x0

    if-ne p0, v0, :cond_0

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    invoke-direct {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;-><init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->onlyShowLocalPhoto_:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->showHiddenAlbum_:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    :cond_1
    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->slideshowInterval_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->remindConnectNetworkEveryTime_:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    return-void
.end method
