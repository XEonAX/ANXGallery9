.class public Lcom/miui/gallery/net/library/LibraryRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "LibraryRequest.java"


# instance fields
.field private final mLibraryId:J


# direct methods
.method public constructor <init>(J)V
    .locals 4

    const-string v0, "https://i.mi.com/gallery/public/resource/info/v2"

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    iput-wide p1, p0, Lcom/miui/gallery/net/library/LibraryRequest;->mLibraryId:J

    const-string p1, "nameSpace"

    const-string p2, "miui_assistant"

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/net/library/LibraryRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    const-string p1, "group"

    iget-wide v2, p0, Lcom/miui/gallery/net/library/LibraryRequest;->mLibraryId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/net/library/LibraryRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    const-string p1, "key"

    sget-object p2, Lcom/miui/gallery/assistant/library/LibraryConstants;->CURRENT_ABI:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/net/library/LibraryRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/net/library/LibraryRequest;->setUseCache(Z)Lcom/miui/gallery/net/base/BaseRequest;

    return-void
.end method


# virtual methods
.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/net/library/LibraryRequest$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/net/library/LibraryRequest$1;-><init>(Lcom/miui/gallery/net/library/LibraryRequest;)V

    invoke-virtual {v1}, Lcom/miui/gallery/net/library/LibraryRequest$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/net/library/LibraryRequest;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/Library;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/Library;->getLibraryItems()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/miui/gallery/net/library/LibraryRequest;->mLibraryId:J

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryId(J)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/net/library/LibraryRequest;->deliverResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/gson/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->HANDLE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/miui/gallery/net/library/LibraryRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->printStackTrace()V

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->PARSE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/miui/gallery/net/library/LibraryRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method
