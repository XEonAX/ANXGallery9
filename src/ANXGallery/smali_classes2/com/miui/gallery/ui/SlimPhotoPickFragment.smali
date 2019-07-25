.class public Lcom/miui/gallery/ui/SlimPhotoPickFragment;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "SlimPhotoPickFragment.java"


# static fields
.field public static final SLIM_COUNT_STAGE:[I


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mIsFirstLoadFinish:Z

.field private mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

.field private mScanResultIds:[J

.field private mSelectButton:Landroid/widget/Button;

.field private mSelectListener:Landroid/view/View$OnClickListener;

.field private mSlimDescriptionDialog:Landroid/app/Dialog;

.field private mStartSlimButton:Landroid/widget/Button;

.field private mStartSlimListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->SLIM_COUNT_STAGE:[I

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

    iput-boolean v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mIsFirstLoadFinish:Z

    new-instance v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;-><init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment$2;-><init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment$3;-><init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    new-instance v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment$4;-><init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mIsFirstLoadFinish:Z

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/ui/SlimPhotoPickFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mIsFirstLoadFinish:Z

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->onItemSelectedChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Landroid/app/Dialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    return-object p0
.end method

.method private onItemSelectedChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :goto_1
    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b0160

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "cleaner_slim_photo_pick"

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 4

    const-string v0, "%s AND %s IN (%s)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SYNCED_SLIM_SCAN_SELECTION:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "_id"

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, ","

    iget-object v3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mScanResultIds:[J

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

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

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoSlim;->isFirstUsePhotoSlim()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b010d

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroid/app/Dialog;

    iget-object v1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const v0, 0x7f09006f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    new-instance v0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment$5;-><init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-virtual {p1, v0, v1}, Landroid/view/Window;->setLayout(II)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoSlim;->setIsFirstUsePhotoSlim(Ljava/lang/Boolean;)V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSlimDescriptionDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const v1, 0x7f10028b

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(I)V

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0902b7

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mStartSlimListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    invoke-virtual {p2}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0900e4

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-static {p2, p3, v0}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->setClickToPhotoPageEnable(Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    sget-object p3, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    sget-object p3, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mAdapter:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->disableScaleImageViewAniWhenInActionMode()V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->startChoiceMode()V

    invoke-static {}, Lcom/miui/gallery/cleaner/ScannerManager;->getInstance()Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanner(I)Lcom/miui/gallery/cleaner/BaseScanner;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/cleaner/slim/SlimScanner;

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->getScanResultIds()[J

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->mScanResultIds:[J

    return-object p1
.end method
