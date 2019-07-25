.class Lcom/miui/gallery/data/CityDatabaseHelper$1;
.super Ljava/lang/Object;
.source "CityDatabaseHelper.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/data/CityDatabaseHelper;->loadCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/data/CityDatabaseHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/data/CityDatabaseHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/CityDatabaseHelper$1;->this$0:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "CityDatabaseHelper"

    const-string v1, "loadCityBoundRects fails, the returned cursor is null"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    new-instance v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    invoke-direct {v1}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;-><init>()V

    const-string v2, "cityid"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    const-string v3, "rect"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/data/CityDatabaseUtils$PolygonHelper;->parseFromByteArray([B)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect$BoundRect;

    new-instance v6, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;

    invoke-direct {v6, v4, v5, v0}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;-><init>(Ljava/lang/String;[Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect$BoundRect;Lcom/miui/gallery/data/CityDatabaseHelper$1;)V

    invoke-virtual {v1, v4, v6}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/CityDatabaseHelper$1;->handle(Landroid/database/Cursor;)Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    move-result-object p1

    return-object p1
.end method
