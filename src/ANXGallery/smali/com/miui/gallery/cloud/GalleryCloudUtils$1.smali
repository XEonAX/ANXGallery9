.class final Lcom/miui/gallery/cloud/GalleryCloudUtils$1;
.super Ljava/lang/Object;
.source "GalleryCloudUtils.java"

# interfaces
.implements Lcom/miui/gallery/util/GalleryUtils$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/GalleryCloudUtils;->ensureDateTakenAndLocation(Ljava/lang/String;ZLandroid/content/ContentValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/GalleryUtils$QueryHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Landroid/content/ContentValues;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 9

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v3

    const/4 v5, 0x2

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long p1, v1, v7

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    const-string v7, "dateTaken"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v7, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_1
    const-wide/16 v1, 0x0

    cmpl-double p1, v3, v1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    const-string v7, "exifGPSLatitude"

    invoke-virtual {p1, v7}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    const-string v7, "exifGPSLatitude"

    invoke-static {v3, v4}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->convertDoubleToLaLon(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v7, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    cmpl-double p1, v5, v1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    const-string v1, "exifGPSLongitude"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/cloud/GalleryCloudUtils$1;->val$values:Landroid/content/ContentValues;

    const-string v1, "exifGPSLongitude"

    invoke-static {v5, v6}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->convertDoubleToLaLon(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-object v0
.end method
