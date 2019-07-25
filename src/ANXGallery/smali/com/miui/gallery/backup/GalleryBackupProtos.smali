.class public final Lcom/miui/gallery/backup/GalleryBackupProtos;
.super Ljava/lang/Object;
.source "GalleryBackupProtos.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;,
        Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessageOrBuilder;
    }
.end annotation


# static fields
.field private static descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "\n+com.miui.gallery.backup/GalleryBackup.proto\u0012\u0017com.miui.gallery.backup\"\u00e6\u0002\n\rBackupMessage\u0012A\n\u0008settings\u0018\u0001 \u0001(\u000b2/.com.miui.gallery.backup.BackupMessage.Settings\u0012J\n\ralbumProfiles\u0018\u0002 \u0003(\u000b23.com.miui.gallery.backup.BackupMessage.AlbumProfile\u001a\u0085\u0001\n\u0008Settings\u0012\u001a\n\u0012onlyShowLocalPhoto\u0018\u0001 \u0001(\u0008\u0012\u0017\n\u000fshowHiddenAlbum\u0018\u0002 \u0001(\u0008\u0012\u0019\n\u0011slideshowInterval\u0018\u0003 \u0001(\u0005\u0012)\n\u001dremindConnectNetworkEveryTime\u0018\u0004 \u0001(\u0008B\u0002\u0018\u0001\u001a>\n\u000cAlbumProfile\u0012\u000c\n\u0004path\u0018\u0001 \u0001(\t\u0012\u000c\n\u0004name\u0018\u0002 \u0001(\t\u0012\u0012\n\nattributes\u0018\u0003 \u0001(\u0003B.\n\u0017com.miui.gallery.backupB\u0013GalleryBackupProtosb\u0006proto3"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/backup/GalleryBackupProtos$1;

    invoke-direct {v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$1;-><init>()V

    const/4 v2, 0x0

    new-array v3, v2, [Lcom/google/protobuf/Descriptors$FileDescriptor;

    invoke-static {v0, v3, v1}, Lcom/google/protobuf/Descriptors$FileDescriptor;->internalBuildGeneratedFileFrom([Ljava/lang/String;[Lcom/google/protobuf/Descriptors$FileDescriptor;Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;)V

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-instance v0, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    sget-object v1, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    const-string v3, "Settings"

    const-string v4, "AlbumProfiles"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$Descriptor;->getNestedTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-instance v0, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    sget-object v1, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    const-string v2, "OnlyShowLocalPhoto"

    const-string v3, "ShowHiddenAlbum"

    const-string v4, "SlideshowInterval"

    const-string v5, "RemindConnectNetworkEveryTime"

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$Descriptor;->getNestedTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-instance v0, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    sget-object v1, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    const-string v2, "Path"

    const-string v3, "Name"

    const-string v4, "Attributes"

    filled-new-array {v2, v3, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$100()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static synthetic access$1500()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$1600()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_AlbumProfile_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static synthetic access$200()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_Settings_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$300()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->internal_static_com_miui_gallery_backup_BackupMessage_Settings_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static synthetic access$4002(Lcom/google/protobuf/Descriptors$FileDescriptor;)Lcom/google/protobuf/Descriptors$FileDescriptor;
    .locals 0

    sput-object p0, Lcom/miui/gallery/backup/GalleryBackupProtos;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-object p0
.end method

.method public static getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;
    .locals 1

    sget-object v0, Lcom/miui/gallery/backup/GalleryBackupProtos;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-object v0
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistry;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos;->registerAllExtensions(Lcom/google/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 0

    return-void
.end method
