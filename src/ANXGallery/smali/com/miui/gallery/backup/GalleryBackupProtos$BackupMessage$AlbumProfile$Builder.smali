.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
.super Lcom/google/protobuf/GeneratedMessageV3$Builder;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageV3$Builder<",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;",
        ">;",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;"
    }
.end annotation


# instance fields
.field private attributes_:J

.field private name_:Ljava/lang/Object;

.field private path_:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;-><init>()V

    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$1500()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$1900()Z

    return-void
.end method


# virtual methods
.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 3

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2102(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2202(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->attributes_:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2302(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;J)J

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onBuilt()V

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->attributes_:J

    return-object p0
.end method

.method public clearAttributes()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->attributes_:J

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public clearName()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public clearPath()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->attributes_:J

    return-wide v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$1500()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_0

    check-cast v0, Lcom/google/protobuf/ByteString;

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_0

    check-cast v0, Lcom/google/protobuf/ByteString;

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPathBytes()Lcom/google/protobuf/ByteString;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    return-object v0

    :cond_0
    check-cast v0, Lcom/google/protobuf/ByteString;

    return-object v0
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
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2500()Lcom/google/protobuf/Parser;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    :cond_0
    return-object p0

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_1
    invoke-virtual {p1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {p1}, Lcom/google/protobuf/InvalidProtocolBufferException;->unwrapIOException()Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    move-object v0, p2

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    :cond_1
    throw p1
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    return-object p0
.end method

.method public mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v0

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2100(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2200(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setAttributes(J)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public setAttributes(J)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->attributes_:J

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public setName(Ljava/lang/String;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public setNameBytes(Lcom/google/protobuf/ByteString;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2700(Lcom/google/protobuf/ByteString;)V

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->name_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public setPath(Ljava/lang/String;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public setPathBytes(Lcom/google/protobuf/ByteString;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->access$2600(Lcom/google/protobuf/ByteString;)V

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->path_:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->onChanged()V

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method
