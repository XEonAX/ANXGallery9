.class public interface abstract Lcom/miui/gallery/model/AlbumConstants;
.super Ljava/lang/Object;
.source "AlbumConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;

.field public static final SHARED_ALBUM_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "name"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "cover_id"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "cover_path"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "cover_sha1"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "cover_sync_state"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "media_count"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "face_people_id"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "baby_info"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "thumbnail_info"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "serverId"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string v1, "attributes"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "immutable"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string v1, "top_time"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string v1, "sortBy"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    const-string v1, "baby_sharer_info"

    const/16 v2, 0xf

    aput-object v1, v0, v2

    const-string v1, "local_path"

    const/16 v2, 0x10

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_ALBUM_CLASSIFICATION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "classification"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x11

    aput-object v1, v0, v2

    const-string v1, "cover_size"

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/model/AlbumConstants;->PROJECTION:[Ljava/lang/String;

    const-string v0, "_id"

    const-string v1, "creatorId"

    const-string v2, "count"

    const-string v3, "nickname"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/model/AlbumConstants;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    return-void
.end method
