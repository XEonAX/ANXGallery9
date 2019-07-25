.class Lcom/miui/gallery/card/CardManager$5;
.super Ljava/lang/Object;
.source "CardManager.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/CardManager;->updateCardCoversIfNecessary(Lcom/miui/gallery/card/Card;)Z
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
        "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/CardManager;

.field final synthetic val$card:Lcom/miui/gallery/card/Card;

.field final synthetic val$cardSha1s:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/CardManager;Ljava/util/List;Lcom/miui/gallery/card/Card;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardManager$5;->this$0:Lcom/miui/gallery/card/CardManager;

    iput-object p2, p0, Lcom/miui/gallery/card/CardManager$5;->val$cardSha1s:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/card/CardManager$5;->val$card:Lcom/miui/gallery/card/Card;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/CardManager$5;->handle(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$5;->this$0:Lcom/miui/gallery/card/CardManager;

    iget-object v1, p0, Lcom/miui/gallery/card/CardManager$5;->val$cardSha1s:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/CardManager;->access$400(Lcom/miui/gallery/card/CardManager;Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    if-eqz p1, :cond_3

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {v3, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getSha1()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getSha1()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v3, v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->setImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    :goto_1
    const/4 v3, 0x5

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ge v0, v3, :cond_1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$5;->val$card:Lcom/miui/gallery/card/Card;

    const-string v2, "updateCover"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/Card;->setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardUtil;->isCoverMediaPathEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/card/CardUtil;->downloadCoverThumb(Ljava/util/List;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$5;->val$card:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/Card;->setCoverMediaFeatureItems(Ljava/util/List;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :cond_3
    :goto_2
    const/4 p1, 0x0

    return-object p1
.end method
