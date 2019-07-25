.class Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;
.super Ljava/lang/Object;
.source "CheckoutRecommendPeople.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->getRecommendPeopleFromNet(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

.field final synthetic val$peopleId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;->this$0:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    iput-object p2, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;->val$peopleId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "syncface"

    const-string v1, "getRecommendPeopleFromNet  cta not allowed"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p1, "syncface"

    const-string v1, "getRecommendPeopleFromNet  account is null"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    invoke-static {p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getExtToken(Landroid/content/Context;Landroid/accounts/Account;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    move-result-object v2

    if-nez v2, :cond_2

    const-string p1, "syncface"

    const-string v1, "getRecommendPeopleFromNet  token is null"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_2
    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;->this$0:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    iget-object v4, p0, Lcom/miui/gallery/util/face/CheckoutRecommendPeople$1;->val$peopleId:Ljava/lang/String;

    invoke-static {v3, p1, v1, v2, v4}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->access$000(Lcom/miui/gallery/util/face/CheckoutRecommendPeople;Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-object v0
.end method
