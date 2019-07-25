.class Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;
.super Landroid/content/AsyncTaskLoader;
.source "PhotoDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DetailLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Lcom/miui/gallery/model/PhotoDetailInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataItem:Lcom/miui/gallery/model/BaseDataItem;

.field private mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    return-void
.end method


# virtual methods
.method public loadInBackground()Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/StorageUtils;->getPathForDisplay(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v3, 0xc9

    invoke-virtual {v2, v3, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v2, 0x6d

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/miui/gallery/util/StorageUtils;->isInExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->loadInBackground()Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object v0

    return-object v0
.end method

.method protected final onReset()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->onStopLoading()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    :cond_0
    return-void
.end method

.method protected final onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->forceLoad()V

    :cond_2
    return-void
.end method

.method protected final onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;->cancelLoad()Z

    return-void
.end method
