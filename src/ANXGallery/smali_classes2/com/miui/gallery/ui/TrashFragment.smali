.class public Lcom/miui/gallery/ui/TrashFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "TrashFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mGridView:Lcom/miui/gallery/widget/HeaderGridView;

.field private mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

.field private mTrashedPhotoLoaderCallback:Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/TrashFragment;)Lcom/miui/gallery/adapter/TrashAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

    return-object p0
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "trash"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/TrashFragment;Lcom/miui/gallery/ui/TrashFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashedPhotoLoaderCallback:Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TrashFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashedPhotoLoaderCallback:Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/TrashAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0175

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09030b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/HeaderGridView;

    iput-object p2, p0, Lcom/miui/gallery/ui/TrashFragment;->mGridView:Lcom/miui/gallery/widget/HeaderGridView;

    new-instance p2, Lcom/miui/gallery/adapter/TrashAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/TrashFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/adapter/TrashAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/TrashFragment;->mGridView:Lcom/miui/gallery/widget/HeaderGridView;

    iget-object p3, p0, Lcom/miui/gallery/ui/TrashFragment;->mTrashAdapter:Lcom/miui/gallery/adapter/TrashAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/HeaderGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-object p1
.end method
