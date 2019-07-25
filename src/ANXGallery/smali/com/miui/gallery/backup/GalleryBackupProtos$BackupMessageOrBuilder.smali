.class public interface abstract Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessageOrBuilder;
.super Ljava/lang/Object;
.source "GalleryBackupProtos.java"

# interfaces
.implements Lcom/google/protobuf/MessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/backup/GalleryBackupProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BackupMessageOrBuilder"
.end annotation


# virtual methods
.method public abstract getAlbumProfiles(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;
.end method

.method public abstract getAlbumProfilesCount()I
.end method

.method public abstract getAlbumProfilesList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAlbumProfilesOrBuilder(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;
.end method

.method public abstract getAlbumProfilesOrBuilderList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfileOrBuilder;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
.end method

.method public abstract getSettingsOrBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$SettingsOrBuilder;
.end method

.method public abstract hasSettings()Z
.end method
