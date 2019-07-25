.class public Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "ServerReservedAlbumNamesStrategy.java"


# instance fields
.field private mReservedAlbumNames:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reserved-names"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    return-void
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;
    .locals 23

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;-><init>()V

    const-string v1, "\u6211\u7684\u7167\u7247"

    const-string v2, "\u622a\u5c4f"

    const-string v3, "\u622a\u56fe"

    const-string v4, "my photo"

    const-string v5, "my photos"

    const-string v6, "screenshot"

    const-string v7, "screenshots"

    const-string v8, "\u6211\u7684\u7167\u7247"

    const-string v9, "\u622a\u5716"

    const-string v10, "camera photos"

    const-string v11, "\u76f8\u673a"

    const-string v12, "\u76f8\u6a5f"

    const-string v13, "\u6240\u6709\u89c6\u9891"

    const-string v14, "\u6240\u6709\u5f71\u7247"

    const-string v15, "All videos"

    const-string v16, "\u5ba0\u7269\u76f8\u518c"

    const-string v17, "Pet Album"

    const-string v18, "\u89c6\u9891"

    const-string v19, "\u5168\u666f"

    const-string v20, "\u8996\u983b"

    const-string v21, "Videos"

    const-string v22, "Panoramas"

    filled-new-array/range {v1 .. v22}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->mReservedAlbumNames:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public containsName(Ljava/lang/String;)Z
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->mReservedAlbumNames:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    return v2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->mReservedAlbumNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v1

    :cond_3
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ServerReservedAlbumNamesStrategy{mReservedAlbumNames="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->mReservedAlbumNames:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
