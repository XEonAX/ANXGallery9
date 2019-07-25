.class public Lcom/miui/gallery/util/face/CheckoutRecommendPeople;
.super Ljava/lang/Object;
.source "CheckoutRecommendPeople.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;
    }
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->doGetRecommendPeopleFromNet(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;)Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;

    return-object p0
.end method

.method private doGetRecommendPeopleFromNet(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p4}, Lcom/miui/gallery/cloud/HostManager$PeopleFace;->getPeopleRecommendUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/cloud/CloudUtils;->getFromXiaomi(Ljava/lang/String;Ljava/util/List;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "syncface"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "doGetRecommendPeopleFromNet peopleId is:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  json is:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string v0, "error"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/cloud/CheckResult;->parseErrorCode(Lorg/json/JSONObject;)I

    move-result p2

    if-eqz p2, :cond_1

    return-void

    :cond_1
    const-string p2, "data"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "recommendPeoples"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_2

    return-void

    :cond_2
    const-string p3, "recommendPeoples"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-lez p3, :cond_5

    new-instance p3, Landroid/content/ContentValues;

    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "peopleServerId"

    invoke-virtual {p3, v0, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "recommendPeoplesJson"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "peopleServerId = ?"

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p4, v0, v1

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object p4

    invoke-static {p4, p1, v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeQueryPeopleRecommend([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p4

    if-eqz p4, :cond_3

    invoke-interface {p4}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_3

    invoke-static {p3, p1, v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeUpdatePeopleRecommend(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)J

    goto :goto_1

    :cond_3
    invoke-static {p3}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeInsertPeopleRecommend(Landroid/content/ContentValues;)Landroid/net/Uri;

    :goto_1
    if-eqz p4, :cond_4

    invoke-interface {p4}, Landroid/database/Cursor;->close()V

    :cond_4
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->notifyStatus(I)V

    :cond_5
    return-void
.end method

.method private notifyStatus(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$2;-><init>(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;->onFinishCheckoutPeopleFace(I)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public clearListener()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->mListener:Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;

    return-void
.end method

.method public getRecommendPeopleFromNet(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;-><init>(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
