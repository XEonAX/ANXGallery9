.class Lcom/miui/gallery/data/LocationGenerator$1$2;
.super Ljava/lang/Object;
.source "LocationGenerator.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/data/LocationGenerator$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/data/LocationGenerator$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/data/LocationGenerator$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/LocationGenerator$1$2;->this$1:Lcom/miui/gallery/data/LocationGenerator$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/LocationGenerator$1$2;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 10

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x1

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x5

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/miui/gallery/data/LocationGenerator$1$2;->this$1:Lcom/miui/gallery/data/LocationGenerator$1;

    iget-object v9, v9, Lcom/miui/gallery/data/LocationGenerator$1;->val$context:Landroid/content/Context;

    invoke-static {v9, v8}, Lcom/miui/gallery/util/FileUtils;->getPackageNameFromScreenshotFileName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    move-object v4, v8

    goto :goto_1

    :cond_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    invoke-static {}, Lcom/miui/gallery/data/CitySearcher;->getInstance()Lcom/miui/gallery/data/CitySearcher;

    move-result-object v8

    new-instance v9, Lcom/miui/gallery/data/Coordinate;

    invoke-direct {v9, v4, v5, v6, v7}, Lcom/miui/gallery/data/Coordinate;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Lcom/miui/gallery/data/CitySearcher;->decode(Lcom/miui/gallery/data/Coordinate;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/data/LocationUtil;->isLocationValidate(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/data/LocationGenerator$1$2;->this$1:Lcom/miui/gallery/data/LocationGenerator$1;

    iget-object v5, v5, Lcom/miui/gallery/data/LocationGenerator$1;->val$context:Landroid/content/Context;

    invoke-static {v5, v4}, Lcom/miui/gallery/data/LocationUtil;->getCityNameFromRes(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_1
    move-object v4, v0

    :goto_1
    const-string v5, "_id=?"

    iget-object v6, p0, Lcom/miui/gallery/data/LocationGenerator$1$2;->this$1:Lcom/miui/gallery/data/LocationGenerator$1;

    iget-object v6, v6, Lcom/miui/gallery/data/LocationGenerator$1;->val$context:Landroid/content/Context;

    sget-object v7, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    iget-object v8, p0, Lcom/miui/gallery/data/LocationGenerator$1$2;->this$1:Lcom/miui/gallery/data/LocationGenerator$1;

    iget-object v8, v8, Lcom/miui/gallery/data/LocationGenerator$1;->this$0:Lcom/miui/gallery/data/LocationGenerator;

    invoke-static {v8, v4}, Lcom/miui/gallery/data/LocationGenerator;->access$100(Lcom/miui/gallery/data/LocationGenerator;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v6, v7, v4, v5, v3}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    return-object v0
.end method
