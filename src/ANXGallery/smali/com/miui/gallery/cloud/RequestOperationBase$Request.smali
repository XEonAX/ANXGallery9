.class public final Lcom/miui/gallery/cloud/RequestOperationBase$Request;
.super Ljava/lang/Object;
.source "RequestOperationBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/RequestOperationBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;
    }
.end annotation


# instance fields
.field private final mMethod:I

.field private final mNeedReRequest:Z

.field private final mParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private final mPostData:Lorg/json/JSONObject;

.field private final mRetryTimes:I

.field private final mUrl:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$100(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mMethod:I

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$200(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mUrl:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$300(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mParams:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$400(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mPostData:Lorg/json/JSONObject;

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$500(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mRetryTimes:I

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->access$600(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mNeedReRequest:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;Lcom/miui/gallery/cloud/RequestOperationBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;-><init>(Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/RequestOperationBase$Request;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->isValid()Z

    move-result p0

    return p0
.end method

.method private isValid()Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mMethod:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mMethod:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public getMethod()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mMethod:I

    return v0
.end method

.method public getParams()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mParams:Ljava/util/List;

    return-object v0
.end method

.method public getPostData()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mPostData:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getRetryTimes()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mRetryTimes:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isNeedReRequest()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mNeedReRequest:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "mMethod %s, mUrl %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mMethod:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->mUrl:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
