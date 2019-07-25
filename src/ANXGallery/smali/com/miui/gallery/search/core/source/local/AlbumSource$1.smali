.class Lcom/miui/gallery/search/core/source/local/AlbumSource$1;
.super Ljava/lang/Object;
.source "AlbumSource.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/core/source/local/AlbumSource;->loadContent()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/util/List<",
        "Landroid/util/Pair<",
        "Ljava/lang/String;",
        "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/core/source/local/AlbumSource;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/core/source/local/AlbumSource;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/local/AlbumSource$1;->this$0:Lcom/miui/gallery/search/core/source/local/AlbumSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/local/AlbumSource$1;->handle(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            ">;>;"
        }
    .end annotation

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/local/AlbumSource$1;->this$0:Lcom/miui/gallery/search/core/source/local/AlbumSource;

    invoke-static {v0}, Lcom/miui/gallery/search/core/source/local/AlbumSource;->access$000(Lcom/miui/gallery/search/core/source/local/AlbumSource;)Landroid/util/LongSparseArray;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/search/core/source/local/AlbumSource$1;->this$0:Lcom/miui/gallery/search/core/source/local/AlbumSource;

    invoke-static {v2}, Lcom/miui/gallery/search/core/source/local/AlbumSource;->access$100(Lcom/miui/gallery/search/core/source/local/AlbumSource;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v5, 0x1

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v3, v4, v5, v6}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/search/core/source/local/AlbumSource$1;->this$0:Lcom/miui/gallery/search/core/source/local/AlbumSource;

    invoke-static {v3, v2, p1, v0}, Lcom/miui/gallery/search/core/source/local/AlbumSource;->access$200(Lcom/miui/gallery/search/core/source/local/AlbumSource;Ljava/lang/String;Landroid/database/Cursor;Landroid/util/LongSparseArray;)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v3

    if-eqz v3, :cond_1

    new-instance v4, Landroid/util/Pair;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
