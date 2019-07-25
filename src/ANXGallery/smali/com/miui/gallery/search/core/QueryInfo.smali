.class public Lcom/miui/gallery/search/core/QueryInfo;
.super Ljava/lang/Object;
.source "QueryInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/QueryInfo$Builder;
    }
.end annotation


# instance fields
.field private mParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo$Builder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->access$200(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->access$300(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->access$300(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->access$400(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    const-string v0, "serialId"

    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->getCurrentSerial()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public getParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    return-object v0
.end method

.method public getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "search type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/QueryInfo;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", params = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/QueryInfo;->mParams:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
