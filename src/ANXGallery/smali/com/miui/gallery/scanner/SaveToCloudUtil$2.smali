.class final Lcom/miui/gallery/scanner/SaveToCloudUtil$2;
.super Ljava/lang/Object;
.source "SaveToCloudUtil.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/scanner/SaveToCloudUtil;->ensureLocation(Landroid/content/Context;Ljava/lang/String;ZLandroid/content/ContentValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Landroid/content/ContentValues;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;->val$values:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 8

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v1

    const/4 v3, 0x1

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v3

    const-wide/16 v5, 0x0

    invoke-static {v1, v2, v5, v6}, Lcom/miui/gallery/util/MiscUtil;->doubleEquals(DD)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;->val$values:Landroid/content/ContentValues;

    const-string v7, "exifGPSLatitude"

    invoke-virtual {p1, v7}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;->val$values:Landroid/content/ContentValues;

    const-string v7, "exifGPSLatitude"

    invoke-static {v1, v2}, Lcom/miui/gallery/data/LocationUtil;->convertDoubleToLaLon(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v7, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/MiscUtil;->doubleEquals(DD)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;->val$values:Landroid/content/ContentValues;

    const-string v1, "exifGPSLongitude"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;->val$values:Landroid/content/ContentValues;

    const-string v1, "exifGPSLongitude"

    invoke-static {v3, v4}, Lcom/miui/gallery/data/LocationUtil;->convertDoubleToLaLon(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-object v0
.end method
