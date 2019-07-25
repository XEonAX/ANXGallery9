.class public final Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageV3$Builder;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageV3$Builder<",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;",
        ">;",
        "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessageOrBuilder;"
    }
.end annotation


# instance fields
.field private albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/RepeatedFieldBuilderV3<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;",
            ">;"
        }
    .end annotation
.end field

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

.field private settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/SingleFieldBuilderV3<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>()V

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->maybeForceBuilderInitialization()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;-><init>()V

    return-void
.end method

.method private ensureAlbumProfilesIsMutable()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    :cond_0
    return-void
.end method

.method private getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/RepeatedFieldBuilderV3<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/protobuf/RepeatedFieldBuilderV3;

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v2, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->isClean()Z

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/protobuf/RepeatedFieldBuilderV3;-><init>(Ljava/util/List;ZLcom/google/protobuf/AbstractMessage$BuilderParent;Z)V

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$000()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getSettingsFieldBuilder()Lcom/google/protobuf/SingleFieldBuilderV3;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/SingleFieldBuilderV3<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessageV3$BuilderParent;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilderV3;-><init>(Lcom/google/protobuf/AbstractMessage;Lcom/google/protobuf/AbstractMessage$BuilderParent;Z)V

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3100()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :cond_0
    return-void
.end method


# virtual methods
.method public addAlbumProfiles(ILcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addMessage(ILcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public addAlbumProfiles(ILcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addMessage(ILcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public addAlbumProfiles(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addMessage(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public addAlbumProfiles(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addMessage(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public addAlbumProfilesBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addBuilder(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/AbstractMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object v0
.end method

.method public addAlbumProfilesBuilder(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addBuilder(ILcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/AbstractMessage$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public addAllAlbumProfiles(Ljava/lang/Iterable;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;)",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite$Builder;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->addRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 2

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;-><init>(Lcom/google/protobuf/GeneratedMessageV3$Builder;Lcom/miui/gallery/backup/GalleryBackupProtos$1;)V

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3302(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {v1}, Lcom/google/protobuf/SingleFieldBuilderV3;->build()Lcom/google/protobuf/AbstractMessage;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3302(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v1, v1, -0x3

    iput v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3402(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Ljava/util/List;)Ljava/util/List;

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->build()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3402(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;Ljava/util/List;)Ljava/util/List;

    :goto_1
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3502(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;I)I

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onBuilt()V

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clear()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    goto :goto_0

    :cond_0
    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->clear()V

    :goto_1
    return-object p0
.end method

.method public clearAlbumProfiles()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->clear()V

    :goto_0
    return-object p0
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clearOneof(Lcom/google/protobuf/Descriptors$OneofDescriptor;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public clearSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->clone()Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->clone()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAlbumProfiles(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getMessage(I)Lcom/google/protobuf/AbstractMessage;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    return-object p1
.end method

.method public getAlbumProfilesBuilder(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getBuilder(I)Lcom/google/protobuf/AbstractMessage$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    return-object p1
.end method

.method public getAlbumProfilesBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getBuilderList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAlbumProfilesCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getCount()I

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

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getMessageList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAlbumProfilesOrBuilder(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getMessageOrBuilder(I)Lcom/google/protobuf/MessageOrBuilder;

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

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->getMessageOrBuilderList()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->access$000()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilderV3;->getMessage()Lcom/google/protobuf/AbstractMessage;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    return-object v0
.end method

.method public getSettingsBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getSettingsFieldBuilder()Lcom/google/protobuf/SingleFieldBuilderV3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilderV3;->getBuilder()Lcom/google/protobuf/AbstractMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    return-object v0
.end method

.method public getSettingsOrBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilderV3;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :goto_0
    return-object v0
.end method

.method public hasSettings()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3800()Lcom/google/protobuf/Parser;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

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

    check-cast p2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
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

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    :cond_1
    throw p1
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    return-object p0
.end method

.method public mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getDefaultInstance()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->hasSettings()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_1

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->dispose()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    and-int/lit8 v1, v1, -0x3

    iput v1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->bitField0_:I

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3600()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->getAlbumProfilesFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilderV3;

    move-result-object v0

    :cond_4
    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3400(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :cond_6
    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->access$3700(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)Lcom/google/protobuf/UnknownFieldSet;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    return-object p0
.end method

.method public mergeSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-static {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilder(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->mergeFrom(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->buildPartial()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilderV3;->mergeFrom(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/SingleFieldBuilderV3;

    :goto_1
    return-object p0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public removeAlbumProfiles(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->remove(I)V

    :goto_0
    return-object p0
.end method

.method public setAlbumProfiles(ILcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->setMessage(ILcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public setAlbumProfiles(ILcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->ensureAlbumProfilesIsMutable()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfiles_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->albumProfilesBuilder_:Lcom/google/protobuf/RepeatedFieldBuilderV3;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilderV3;->setMessage(ILcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/RepeatedFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setField(Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;ILjava/lang/Object;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method

.method public setSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilderV3;->setMessage(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/SingleFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public setSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settings_:Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->onChanged()V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->settingsBuilder_:Lcom/google/protobuf/SingleFieldBuilderV3;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilderV3;->setMessage(Lcom/google/protobuf/AbstractMessage;)Lcom/google/protobuf/SingleFieldBuilderV3;

    :goto_0
    return-object p0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;
    .locals 0

    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessageV3$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessageV3$Builder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    return-object p1
.end method
