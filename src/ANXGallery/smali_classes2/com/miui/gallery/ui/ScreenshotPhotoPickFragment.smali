.class public Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "ScreenshotPhotoPickFragment.java"


# static fields
.field public static final DELETE_COUNT_STAGE:[I


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mDeleteButton:Landroid/widget/Button;

.field private mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

.field private mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mIsFirstLoadFinish:Z

.field private mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

.field private mScanResultIds:[J

.field private mScanner:Lcom/miui/gallery/cleaner/ScreenshotScanner;

.field private mSelectButton:Landroid/widget/Button;

.field private mSelectListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->DELETE_COUNT_STAGE:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x14
        0x32
        0x64
        0xc8
        0x1f4
        0x3e8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mIsFirstLoadFinish:Z

    new-instance v0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$1;-><init>(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$2;-><init>(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$3;-><init>(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    new-instance v0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment$4;-><init>(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)Lcom/miui/gallery/cleaner/ScreenshotScanner;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanner:Lcom/miui/gallery/cleaner/ScreenshotScanner;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanResultIds:[J

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;[J)[J
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanResultIds:[J

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mIsFirstLoadFinish:Z

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mIsFirstLoadFinish:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->onItemSelectedChanged()V

    return-void
.end method

.method private onItemSelectedChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :goto_1
    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b0137

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "cleaner_screenshot_photo_pick"

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 4

    const-string v0, "%s IN (%s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "_id"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, ","

    iget-object v3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanResultIds:[J

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "generate_headers"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsLand:I

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsPortrait:I

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setNumColumns(I)V

    :goto_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    const p3, 0x7f100284

    invoke-virtual {p2, p3}, Lmiui/app/ActionBar;->setTitle(I)V

    new-instance p2, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    sget-object p3, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    sget-object p3, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mEmptyView:Landroid/view/View;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setEmptyView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->disableScaleImageViewAniWhenInActionMode()V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->startChoiceMode()V

    const p2, 0x7f0900c6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    invoke-virtual {p2}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0900e4

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-static {p2, p3, v0}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/miui/gallery/cleaner/ScannerManager;->getInstance()Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanner(I)Lcom/miui/gallery/cleaner/BaseScanner;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/cleaner/ScreenshotScanner;

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanner:Lcom/miui/gallery/cleaner/ScreenshotScanner;

    iget-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanner:Lcom/miui/gallery/cleaner/ScreenshotScanner;

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->getScanResultIds()[J

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;->mScanResultIds:[J

    return-object p1
.end method
