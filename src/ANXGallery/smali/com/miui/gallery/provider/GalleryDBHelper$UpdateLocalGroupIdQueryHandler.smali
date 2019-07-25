.class Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;
.super Ljava/lang/Object;
.source "GalleryDBHelper.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/GalleryDBHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdateLocalGroupIdQueryHandler"
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
.field private final mAlbumIdColumnName:Ljava/lang/String;

.field private final mDB:Landroid/database/sqlite/SQLiteDatabase;

.field private final mTable:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mDB:Landroid/database/sqlite/SQLiteDatabase;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mTable:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mAlbumIdColumnName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 10

    if-eqz p1, :cond_1

    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "localGroupId"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v4, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mDB:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v5, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mTable:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%s=?"

    new-array v8, v2, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/miui/gallery/provider/GalleryDBHelper$UpdateLocalGroupIdQueryHandler;->mAlbumIdColumnName:Ljava/lang/String;

    aput-object v9, v8, v0

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    new-array v2, v2, [Ljava/lang/String;

    aput-object v3, v2, v0

    invoke-virtual {v1, v5, v4, v6, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
