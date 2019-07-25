.class public Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;
.super Landroid/app/ListFragment;
.source "CloudGuideAutoBackupFragment.java"

# interfaces
.implements Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

.field private mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/ListFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    return-object p0
.end method

.method private changeAutoUpload(JZ)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeAutoUpload(Landroid/content/Context;JZ)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/ListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;-><init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0, p1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0, p1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onAutoBackupStateChanged(IZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getItemId(I)J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p2}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->changeAutoUpload(JZ)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/app/ListFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "autobackup_album_id"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    const-string v0, "cloud_guide_source"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    cmp-long p1, v3, v1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, v3, v4, p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->changeAutoUpload(JZ)V

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0049

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900ff

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;-><init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3, p0}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Landroid/app/ListFragment;->onDestroy()V

    return-void
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isAutoUploadedAlbum(I)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->reverseAutoBackupUiState(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getAutoBackupUiState(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p0, p3, p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->onAutoBackupStateChanged(IZ)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isCameraAlbum(I)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f1000d4

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isBabyAlbum(I)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f10007b

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isOwnerShareAlbum(I)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f100671

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->reverseAutoBackupUiState(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->mAdapter:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getAutoBackupUiState(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p0, p3, p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->onAutoBackupStateChanged(IZ)V

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Landroid/app/ListFragment;->onPause()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "cloud_guide_autobackup"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroid/app/ListFragment;->onResume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "cloud_guide_autobackup"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
