.class public Lcom/miui/gallery/ui/AlbumDetailFragment;
.super Lcom/miui/gallery/ui/AlbumDetailFragmentBase;
.source "AlbumDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;,
        Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;
    }
.end annotation


# instance fields
.field private mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

.field private mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

.field private mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

.field private mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

.field private mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

.field private mNeedConfirmPassWord:Z

.field private mOnAlbumRenamedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

.field private mOnSortByClickListener:Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;

.field private mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

.field private mSortByHeaderPaddingTop:I

.field private mSortOrder:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;-><init>()V

    const-string v0, " DESC "

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NONE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    new-instance v0, Lcom/miui/gallery/ui/AlbumDetailFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AlbumDetailFragment$2;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mOnAlbumRenamedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/AlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AlbumDetailFragment;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getSortByIndicatorResource()I

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/AlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/AlbumDetailFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->updateActionBarTitle()V

    return-void
.end method

.method private configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object v0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-void
.end method

.method private configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    const-string v1, " DESC "

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, " ASC "

    goto :goto_0

    :cond_0
    const-string p1, " DESC "

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    goto :goto_2

    :cond_1
    sget-object v1, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne p1, v1, :cond_2

    const-string v1, " DESC "

    iput-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    goto :goto_1

    :cond_2
    const-string v1, " ASC "

    iput-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    :goto_1
    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onSortByChanged()V

    return-object p1
.end method

.method private doChangeShowInPhotosTab(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumId:J

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeShowInPhotosTab(Landroid/content/Context;JZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/MenuStatusManager;->onShowInPhotosTabStatusChanged(Z)V

    return-void
.end method

.method private doRename()V
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumId:J

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mOnAlbumRenamedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->newInstance(JLjava/lang/String;Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)Lcom/miui/gallery/ui/AlbumRenameDialogFragment;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "AlbumRenameDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private getSortByIndicatorResource()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    const-string v1, " ASC "

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f07026b

    goto :goto_0

    :cond_0
    const v0, 0x7f070268

    :goto_0
    return v0
.end method

.method private getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/AlbumDetailFragment$3;->$SwitchMap$com$miui$gallery$widget$SortByHeader$SortBy:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SortByHeader$SortBy;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const-string p1, "alias_sort_time"

    return-object p1

    :pswitch_0
    const-string p1, "size"

    return-object p1

    :pswitch_1
    const-string p1, "title"

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isCameraAlbum()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "album_server_id"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isNeedConfirmPassWord()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mNeedConfirmPassWord:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isInPhotoPage()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onSortByChanged()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    sget-object v1, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeaderPaddingTop:I

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->setViewPaddingTop(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->setViewPaddingTop(Landroid/view/View;I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0602a8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeaderPaddingTop:I

    sub-int/2addr v2, v0

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->setViewPaddingTop(Landroid/view/View;I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->setViewPaddingTop(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method private setViewPaddingTop(Landroid/view/View;I)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method private showOptionsMenu()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isVirtualAlbum()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isUnWriteable()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private sortByChangeable()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isDailyAlbum()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private updateActionBarTitle()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected doChangeAutoUpload(Z)Z
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doChangeAutoUpload(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/MenuStatusManager;->onAutoUploadStatusChanged(Z)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected doChangeShowInOtherAlbums(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doChangeShowInOtherAlbums(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/MenuStatusManager;->onShowInOtherAlbumsStatusChanged(Z)V

    return-void
.end method

.method public finish()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_0
    return-void
.end method

.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    sget-object v1, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v0, v1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isDailyAlbum()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    if-nez v0, :cond_4

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mIsScreenshotAlbum:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isPanoAlbum()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->FAVORITES:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    return-object v0

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    if-nez v0, :cond_a

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_1

    :cond_6
    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mIsScreenshotAlbum:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_1

    :cond_7
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_1

    :cond_8
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isPanoAlbum()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    goto :goto_1

    :cond_9
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->FAVORITES:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    :cond_a
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    return-object v0
.end method

.method protected getCreatorIdByPosition(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCreatorId(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getCurrentSortOrder()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b0008

    return v0
.end method

.method protected getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;Lcom/miui/gallery/ui/AlbumDetailFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "album_secret"

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "album_favorites"

    return-object v0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isCameraAlbum()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "album_camera"

    return-object v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isVideoAlbum()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "album_video"

    return-object v0

    :cond_3
    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mIsScreenshotAlbum:Z

    if-eqz v0, :cond_4

    const-string v0, "album_screenshot"

    return-object v0

    :cond_4
    const-string v0, "album_detail"

    return-object v0
.end method

.method protected getViewAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getViewAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected needEnableAutoUpload()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canEnableAutoUpload()Z

    move-result v0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->showOptionsMenu()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->setImmersionMenuEnabled(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "album_detail_sort_by"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->sortByChangeable()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "album_detail_drawer_state"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->openDrawer()V

    :cond_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x1b

    if-ne p1, v0, :cond_1

    const/4 p1, -0x1

    if-eq p2, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->finish()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mNeedConfirmPassWord:Z

    :goto_0
    return-void

    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isSecretAlbum()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->isFirstAddSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setIsFirstAddSecret(Z)V

    new-instance v0, Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/AlbumDetailFragment$1;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "SecretTip"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    const/high16 v0, 0x7f0c0000

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailTimelineAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onDestroy()V

    return-void
.end method

.method protected onEnterActionMode()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canShowInPhotosTab()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->showImageSelectionTipDialogIfNecessary(Landroid/app/Activity;)V

    :cond_0
    const-string v0, "best_image"

    const-string v1, "best_image_count"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getBestImageCount(Z)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/MenuStatusManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v0, "album_server_id"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "attributes"

    const-wide/16 v3, 0x0

    invoke-virtual {p2, v0, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    const-string v0, "album_unwriteable"

    const/4 v8, 0x0

    invoke-virtual {p2, v0, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isOthersShareAlbum()Z

    move-result v6

    const-string v0, "album_local_path"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v0, p3

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/ui/MenuStatusManager;-><init>(Landroid/content/Context;Ljava/lang/String;JZZLjava/lang/String;)V

    iput-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    new-instance p2, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;Lcom/miui/gallery/ui/AlbumDetailFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mOnSortByClickListener:Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->updateActionBarTitle()V

    :cond_0
    const p2, 0x7f0900ec

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/ScrollableViewDrawer;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    const p2, 0x7f0902af

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/SortByHeader;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/SortByHeader;->getPaddingTop()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeaderPaddingTop:I

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mOnSortByClickListener:Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/SortByHeader;->setOnSortByClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->sortByChangeable()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-virtual {p2, v8}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->setDragEnabled(Z)V

    :cond_1
    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :sswitch_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->doChangeShowInPhotosTab(Z)V

    const-string p1, "album_detail"

    const-string v0, "show_in_home_enable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->doRename()V

    const-string p1, "album"

    const-string v0, "rename_album"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->removeFromOtherAlbums()V

    const-string p1, "album_detail"

    const-string v0, "show_in_others_disable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_3
    const-string p1, "album_detail"

    const-string v0, "show_in_home_disable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->doChangeShowInPhotosTab(Z)V

    return v1

    :sswitch_4
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->moveToOtherAlbums()V

    const-string p1, "album_detail"

    const-string v0, "show_in_others_enable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_5
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->enableAutoUpload()V

    const-string p1, "album_detail"

    const-string v0, "auto_upload_enable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_6
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->disableAutoUpload()V

    const-string p1, "album_detail"

    const-string v0, "auto_upload_disable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :sswitch_7
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onBackPressed()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->finish()V

    :cond_0
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_7
        0x7f0901c5 -> :sswitch_6
        0x7f0901c8 -> :sswitch_5
        0x7f0901cb -> :sswitch_4
        0x7f0901cc -> :sswitch_3
        0x7f0901d2 -> :sswitch_2
        0x7f0901d3 -> :sswitch_1
        0x7f0901d7 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onPhotoPageDestroy(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onPhotoPageDestroy(Landroid/content/Intent;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mNeedConfirmPassWord:Z

    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 9

    const v0, 0x7f0901be

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f0901d2

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    const v2, 0x7f0901cb

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    const v3, 0x7f0901c8

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f0901c5

    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    const v5, 0x7f0901d7

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    const v6, 0x7f0901cc

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x7f0901d6

    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    const v8, 0x7f0901d3

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v8}, Lcom/miui/gallery/ui/MenuStatusManager;->canEnableAutoUpload()Z

    move-result v8

    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/MenuStatusManager;->canDisableAutoUpload()Z

    move-result v3

    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {v4, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/MenuStatusManager;->canDisableShowInOtherAlbums()Z

    move-result v3

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/MenuStatusManager;->canEnableShowInOtherAlbums()Z

    move-result v1

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/MenuStatusManager;->canAddPhotos()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canEnableShowInPhotosTab()Z

    move-result v0

    invoke-interface {v5, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canDisableShowInPhotosTab()Z

    move-result v0

    invoke-interface {v6, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canShare()Z

    move-result v0

    invoke-interface {v7, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mMenuStatusManager:Lcom/miui/gallery/ui/MenuStatusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/MenuStatusManager;->canRename()Z

    move-result v0

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isNeedConfirmPassWord()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mNeedConfirmPassWord:Z

    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "album_detail_sort_by"

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v0, "album_detail_drawer_state"

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mDrawer:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->isDrawerOpen()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment;->mNeedConfirmPassWord:Z

    return-void
.end method
