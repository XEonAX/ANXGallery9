.class public Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;
.super Ljava/lang/Object;
.source "BabyAlbumRecommendationFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;,
        Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;
    }
.end annotation


# instance fields
.field private volatile mFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;",
            ">;"
        }
    .end annotation
.end field

.field private mPeopleId:Ljava/lang/String;

.field private volatile mRecommandationDatas:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

.field private volatile mRecommandationFoundListener:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mPeopleId:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mPeopleId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mRecommandationDatas:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mRecommandationDatas:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mRecommandationFoundListener:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p1
.end method


# virtual methods
.method public findRecommendation(Landroid/util/SparseArray;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;-><init>(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Landroid/util/SparseArray;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$2;-><init>(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)V

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public setRecommendationFoundListener(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->mRecommandationFoundListener:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationFoundListener;

    return-void
.end method
