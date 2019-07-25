.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
.super Lcom/google/protobuf/GeneratedMessageV3$Builder;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageV3$Builder<",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;",
        ">;",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;"
    }
.end annotation


# instance fields
.field private onlyShowLocalPhoto_:Z

.field private remindConnectNetworkEveryTime_:Z

.field private showHiddenAlbum_:Z

.field private slideshowInterval_:I


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;-><init>()V

    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$200()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$600()Z

    return-void
.end method


# virtual methods
.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 2

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onlyShowLocalPhoto_:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$802(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->showHiddenAlbum_:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$902(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->slideshowInterval_:I

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$1002(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;I)I

    iget-boolean v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->remindConnectNetworkEveryTime_:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$1102(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;Z)Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onBuilt()V

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onlyShowLocalPhoto_:Z

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->showHiddenAlbum_:Z

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->slideshowInterval_:I

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->remindConnectNetworkEveryTime_:Z

    return-object p0
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public clearOnlyShowLocalPhoto()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onlyShowLocalPhoto_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public clearRemindConnectNetworkEveryTime()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->remindConnectNetworkEveryTime_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public clearShowHiddenAlbum()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->showHiddenAlbum_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public clearSlideshowInterval()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->slideshowInterval_:I

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$200()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getOnlyShowLocalPhoto()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onlyShowLocalPhoto_:Z

    return v0
.end method

.method public getRemindConnectNetworkEveryTime()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->remindConnectNetworkEveryTime_:Z

    return v0
.end method

.method public getShowHiddenAlbum()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->showHiddenAlbum_:Z

    return v0
.end method

.method public getSlideshowInterval()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->slideshowInterval_:I

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$1300()Lcom/google/protobuf/Parser;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

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

    check-cast p2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
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

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    :cond_1
    throw p1
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    return-object p0
.end method

.method public mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setOnlyShowLocalPhoto(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setShowHiddenAlbum(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setSlideshowInterval(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getRemindConnectNetworkEveryTime()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getRemindConnectNetworkEveryTime()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setRemindConnectNetworkEveryTime(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    :cond_4
    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->access$1200(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public setOnlyShowLocalPhoto(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onlyShowLocalPhoto_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public setRemindConnectNetworkEveryTime(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->remindConnectNetworkEveryTime_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method

.method public setShowHiddenAlbum(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->showHiddenAlbum_:Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public setSlideshowInterval(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->slideshowInterval_:I

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->onChanged()V

    return-object p0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object p1
.end method
