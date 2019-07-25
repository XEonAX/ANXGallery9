.class Lcom/miui/gallery/provider/GalleryDBHelper$3;
.super Ljava/lang/Object;
.source "GalleryDBHelper.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/GalleryDBHelper;->refillBabyAlbumDataTaken(Landroid/database/sqlite/SQLiteDatabase;)V
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
.field final synthetic this$0:Lcom/miui/gallery/provider/GalleryDBHelper;

.field final synthetic val$db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/GalleryDBHelper;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$3;->this$0:Lcom/miui/gallery/provider/GalleryDBHelper;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$3;->val$db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/GalleryDBHelper$3;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 8

    if-eqz p1, :cond_0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$3;->val$db:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "update %s set %s = %d where %s = %d"

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "cloud"

    aput-object v6, v5, v0

    const/4 v0, 0x1

    const-string v6, "dateTaken"

    aput-object v6, v5, v0

    const/4 v0, 0x2

    const-wide/16 v6, -0x3e4

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v0

    const/4 v0, 0x3

    const-string v6, "_id"

    aput-object v6, v5, v0

    const/4 v0, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
