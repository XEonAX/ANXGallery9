.class public abstract Lcom/miui/gallery/model/BaseDataSet;
.super Ljava/lang/Object;
.source "BaseDataSet.java"


# instance fields
.field private mBaseDataCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/model/BaseDataItem;",
            ">;"
        }
    .end annotation
.end field

.field protected mInitPosition:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataSet;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/model/BaseDataSet;->mBaseDataCache:Landroid/util/SparseArray;

    iput p1, p0, Lcom/miui/gallery/model/BaseDataSet;->mInitPosition:I

    return-void
.end method

.method private getIndexOfItem(JII)I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x0

    invoke-static {p3, v2, v1}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p3

    invoke-static {p4, v2, v0}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p4

    :goto_0
    if-ge p3, p4, :cond_1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/model/BaseDataSet;->getItemKey(I)J

    move-result-wide v0

    cmp-long v2, v0, p1

    if-nez v2, :cond_0

    return p3

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x0

    invoke-static {p2, v2, v1}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p2

    invoke-static {p3, v2, v0}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p3

    :goto_0
    if-ge p2, p3, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/model/BaseDataSet;->getItemKey(I)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private getIndexOfItem(Ljava/lang/String;II)I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x0

    invoke-static {p2, v2, v1}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p2

    invoke-static {p3, v2, v0}, Lcom/miui/gallery/util/MiscUtil;->clamp(III)I

    move-result p3

    :goto_0
    if-ge p2, p3, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/model/BaseDataSet;->getItemPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method


# virtual methods
.method public addNewFile(Ljava/lang/String;I)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/model/BaseDataSet;->mBaseDataCache:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V

    const/4 p1, 0x0

    return p1
.end method

.method public abstract addToAlbum(Landroid/app/Activity;IZZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)Z
.end method

.method public addToFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected abstract bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V
.end method

.method protected abstract createItem(I)Lcom/miui/gallery/model/BaseDataItem;
.end method

.method public delete(Landroid/app/Activity;ILcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
    .locals 9

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1002f2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/model/BaseDataSet;->getDeleteDialogMessage(Lcom/miui/gallery/model/BaseDataItem;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const v5, 0x104000a

    const/high16 v6, 0x1040000

    new-instance v7, Lcom/miui/gallery/model/BaseDataSet$1;

    invoke-direct {v7, p0, p2, p3, p1}, Lcom/miui/gallery/model/BaseDataSet$1;-><init>(Lcom/miui/gallery/model/BaseDataSet;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;Landroid/app/Activity;)V

    new-instance v8, Lcom/miui/gallery/model/BaseDataSet$2;

    invoke-direct {v8, p0}, Lcom/miui/gallery/model/BaseDataSet$2;-><init>(Lcom/miui/gallery/model/BaseDataSet;)V

    move-object v2, p1

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method protected abstract doDelete(Lcom/miui/gallery/model/BaseDataItem;)I
.end method

.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract getCount()I
.end method

.method protected getDeleteDialogMessage(Lcom/miui/gallery/model/BaseDataItem;Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0e0023

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, v0, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_2

    const p1, 0x7f100305

    goto :goto_1

    :cond_2
    const p1, 0x7f100304

    :goto_1
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getIndexOfItem(JI)I
    .locals 4

    const/4 v0, 0x0

    if-ltz p3, :cond_3

    add-int/lit8 v1, p3, -0x14

    invoke-direct {p0, p1, p2, v1, p3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JII)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, p3, 0x14

    invoke-direct {p0, p1, p2, p3, v2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JII)I

    move-result p3

    if-eq p3, v3, :cond_1

    return p3

    :cond_1
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JII)I

    move-result p3

    if-eq p3, v3, :cond_2

    return p3

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result p3

    invoke-direct {p0, p1, p2, v2, p3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JII)I

    move-result p1

    return p1

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result p3

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JII)I

    move-result p1

    return p1
.end method

.method public getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I
    .locals 5

    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v1

    const/4 v2, 0x0

    if-ltz p2, :cond_4

    add-int/lit8 v3, p2, 0x14

    invoke-direct {p0, p1, p2, v3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I

    move-result v4

    if-eq v4, v0, :cond_1

    return v4

    :cond_1
    add-int/lit8 v4, p2, -0x14

    invoke-direct {p0, p1, v4, p2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I

    move-result p2

    if-eq p2, v0, :cond_2

    return p2

    :cond_2
    invoke-direct {p0, p1, v2, v4}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I

    move-result p2

    if-eq p2, v0, :cond_3

    return p2

    :cond_3
    invoke-direct {p0, p1, v3, v1}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I

    move-result p1

    return p1

    :cond_4
    invoke-direct {p0, p1, v2, v1}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;II)I

    move-result p1

    return p1
.end method

.method public getIndexOfItem(Ljava/lang/String;I)I
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_4

    const/4 v0, 0x0

    if-ltz p2, :cond_3

    add-int/lit8 v2, p2, -0x14

    invoke-direct {p0, p1, v2, p2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;II)I

    move-result v3

    if-eq v3, v1, :cond_0

    return v3

    :cond_0
    add-int/lit8 v3, p2, 0x14

    invoke-direct {p0, p1, p2, v3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;II)I

    move-result p2

    if-eq p2, v1, :cond_1

    return p2

    :cond_1
    invoke-direct {p0, p1, v0, v2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;II)I

    move-result p2

    if-eq p2, v1, :cond_2

    return p2

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result p2

    invoke-direct {p0, p1, v3, p2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;II)I

    move-result p1

    return p1

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result p2

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;II)I

    move-result p1

    return p1

    :cond_4
    return v1
.end method

.method public getInitPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/BaseDataSet;->mInitPosition:I

    return v0
.end method

.method public getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/model/BaseDataSet;->mBaseDataCache:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/BaseDataItem;

    if-nez p1, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/model/BaseDataSet;->createItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataSet;->mBaseDataCache:Landroid/util/SparseArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/BaseDataSet;->bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method public abstract getItemKey(I)J
.end method

.method protected abstract getItemPath(I)Ljava/lang/String;
.end method

.method public abstract onRelease()V
.end method

.method public final release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataSet;->mBaseDataCache:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataSet;->onRelease()V

    return-void
.end method

.method public removeFromFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public removeFromSecret(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public setInitPosition(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataSet;->mInitPosition:I

    return-void
.end method
