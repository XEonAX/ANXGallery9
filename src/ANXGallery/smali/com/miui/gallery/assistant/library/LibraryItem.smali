.class public Lcom/miui/gallery/assistant/library/LibraryItem;
.super Ljava/lang/Object;
.source "LibraryItem.java"


# instance fields
.field private mExtraInfo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "extraInfo"
    .end annotation
.end field

.field private mId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field private transient mIsLoaded:Z

.field private transient mIsLocal:Z

.field private mName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "text"
    .end annotation
.end field

.field private mParentId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "parentId"
    .end annotation
.end field

.field private mSha1:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sha1Base16"
    .end annotation
.end field

.field private mType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mIsLocal:Z

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mIsLoaded:Z

    return-void
.end method


# virtual methods
.method public getExtraInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mExtraInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mId:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getParentId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mParentId:J

    return-wide v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/assistant/library/LibraryUtils;->getLibraryDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isExist()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/library/LibraryItem;->isLocal()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryUtils;->isLibraryItemExist(Landroid/content/Context;Lcom/miui/gallery/assistant/library/LibraryItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isLoaded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mIsLoaded:Z

    return v0
.end method

.method public isLocal()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mIsLocal:Z

    return v0
.end method

.method public isTypeSo()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mType:Ljava/lang/String;

    const-string v1, "so"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public setLoaded(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/library/LibraryItem;->mIsLoaded:Z

    return-void
.end method
