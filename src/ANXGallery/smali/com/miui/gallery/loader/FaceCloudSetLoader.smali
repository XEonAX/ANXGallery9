.class public Lcom/miui/gallery/loader/FaceCloudSetLoader;
.super Lcom/miui/gallery/loader/CloudSetLoader;
.source "FaceCloudSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;
    }
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    const-string v0, "photo_id"

    const-string v1, "microthumbfile"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    const-string v4, "mimeType"

    const-string v5, " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END "

    const-string v6, "location"

    const-string v7, "size"

    const-string v8, "exifImageWidth"

    const-string v9, "exifImageLength"

    const-string v10, "duration"

    const-string v11, "exifGPSLatitude"

    const-string v12, "exifGPSLatitudeRef"

    const-string v13, "exifGPSLongitude"

    const-string v14, "exifGPSLongitudeRef"

    const-string v15, "localGroupId"

    const-string v16, "secretKey"

    const-string v17, "sha1"

    const-string v18, "photo_server_id"

    const-string v19, "exifOrientation"

    const-string v20, "isFavorite"

    filled-new-array/range {v0 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/loader/CloudSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->mUnfoldBurst:Z

    return-void
.end method


# virtual methods
.method protected getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "FaceCloudSetLoader"

    return-object v0
.end method

.method protected wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;
    .locals 8

    new-instance v7, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;

    iget v2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->mInitPos:I

    invoke-virtual {p0}, Lcom/miui/gallery/loader/FaceCloudSetLoader;->getOperationDupType()I

    move-result v3

    iget-wide v4, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->mAlbumId:J

    iget-object v6, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader;->mAlbumName:Ljava/lang/String;

    move-object v0, v7

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    return-object v7
.end method
