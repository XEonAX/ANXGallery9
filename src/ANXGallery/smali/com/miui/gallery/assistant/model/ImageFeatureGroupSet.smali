.class public Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;
.super Ljava/util/HashSet;
.source "ImageFeatureGroupSet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/miui/gallery/assistant/model/ImageFeatureItem;",
        ">",
        "Ljava/util/HashSet<",
        "Lcom/miui/gallery/assistant/model/ImageFeatureGroup<",
        "TT;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/jni/cluster/Cluster;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/ImageFeatureItem;

    invoke-interface {v1}, Lcom/miui/gallery/assistant/model/ImageFeatureItem;->getMediaSha1()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/assistant/model/ImageFeatureItem;->getMediaId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_0

    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/assistant/jni/cluster/Cluster;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Lcom/miui/gallery/assistant/jni/cluster/Cluster;->getImageIds()[J

    move-result-object p2

    array-length v2, p2

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v2, :cond_4

    aget-wide v4, p2, v3

    invoke-virtual {v0, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/ImageFeatureItem;

    if-eqz v4, :cond_3

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_2

    new-instance p2, Lcom/miui/gallery/assistant/model/ImageFeatureGroup;

    invoke-direct {p2, v1}, Lcom/miui/gallery/assistant/model/ImageFeatureGroup;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    return-void
.end method


# virtual methods
.method public getSelectedImages()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/ImageFeatureGroup;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/ImageFeatureGroup;->getBestImage()Lcom/miui/gallery/assistant/model/ImageFeatureItem;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method
