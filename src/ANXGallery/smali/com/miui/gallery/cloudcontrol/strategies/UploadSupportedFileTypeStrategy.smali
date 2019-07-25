.class public Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "UploadSupportedFileTypeStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;
    }
.end annotation


# instance fields
.field private mImageFileTypes:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "image"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoFileTypes:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "video"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;",
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

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;
    .locals 9

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;-><init>()V

    const/4 v1, 0x7

    new-array v1, v1, [Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v3, "JPG"

    const-string v4, "image/jpeg"

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v4, "JPEG"

    const-string v5, "image/jpeg"

    invoke-direct {v2, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v5, "GIF"

    const-string v6, "image/gif"

    invoke-direct {v2, v5, v6}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v5, 0x2

    aput-object v2, v1, v5

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v6, "PNG"

    const-string v7, "image/png"

    invoke-direct {v2, v6, v7}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x3

    aput-object v2, v1, v6

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v7, "BMP"

    const-string v8, "image/x-ms-bmp"

    invoke-direct {v2, v7, v8}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x4

    aput-object v2, v1, v7

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v7, "WEBP"

    const-string v8, "image/webp"

    invoke-direct {v2, v7, v8}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x5

    aput-object v2, v1, v7

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v7, "WBMP"

    const-string v8, "image/vnd.wap.wbmp"

    invoke-direct {v2, v7, v8}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x6

    aput-object v2, v1, v7

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mImageFileTypes:Ljava/util/List;

    new-array v1, v6, [Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v6, "MP4"

    const-string v7, "video/mp4"

    invoke-direct {v2, v6, v7}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v3, "MOV"

    const-string v6, "video/quicktime"

    invoke-direct {v2, v3, v6}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v1, v4

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    const-string v3, "3GP"

    const-string v4, "video/3gpp"

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v1, v5

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mVideoFileTypes:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getSupportedFileTypeMap()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mImageFileTypes:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mImageFileTypes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->extension:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->mimeType:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->extension:Ljava/lang/String;

    iget-object v2, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mVideoFileTypes:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->mVideoFileTypes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->extension:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->mimeType:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->extension:Ljava/lang/String;

    iget-object v2, v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    return-object v0
.end method
