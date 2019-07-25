.class Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;
.super Ljava/lang/Object;
.source "BabyAlbumRecommendationFinder.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->findRecommendation(Landroid/util/SparseArray;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$102(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-static {v0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$200(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-static {v1}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$100(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;->onRecommendationFound(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-static {v0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$300(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$302(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;

    :cond_1
    return-void
.end method
