.class public Lcom/miui/gallery/ui/VideoResultPickFragment;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "VideoResultPickFragment.java"


# static fields
.field public static final DELETE_COUNT_STAGE:[I


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

.field private mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mDeleteButton:Landroid/widget/Button;

.field private mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

.field private mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mIsFirstLoadFinish:Z

.field private mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

.field private mOnSortByClickListener:Landroid/view/View$OnClickListener;

.field private mScanResultIds:[J

.field private mScanner:Lcom/miui/gallery/cleaner/VideoScanner;

.field private mSelectButton:Landroid/widget/Button;

.field private mSelectListener:Landroid/view/View$OnClickListener;

.field private mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

.field private mSortOrder:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/ui/VideoResultPickFragment;->DELETE_COUNT_STAGE:[I

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

    iput-boolean v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mIsFirstLoadFinish:Z

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    const-string v0, " DESC "

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$1;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    new-instance v0, Lcom/miui/gallery/ui/VideoResultPickFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$2;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    new-instance v0, Lcom/miui/gallery/ui/VideoResultPickFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$3;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/VideoResultPickFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$4;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/VideoResultPickFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$5;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/VideoResultPickFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mIsFirstLoadFinish:Z

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/ui/VideoResultPickFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mIsFirstLoadFinish:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/VideoResultPickFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->onItemSelectedChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/cleaner/VideoScanner;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanner:Lcom/miui/gallery/cleaner/VideoScanner;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/VideoResultPickFragment;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanResultIds:[J

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/ui/VideoResultPickFragment;[J)[J
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanResultIds:[J

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/VideoResultPickFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/VideoResultPickFragment;->configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/VideoResultPickFragment;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getSortByIndicatorResource()I

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/SortByHeader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    return-object p0
.end method

.method private configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object v0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/VideoResultPickFragment;->configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-void
.end method

.method private configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

    const-string v1, " DESC "

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, " ASC "

    goto :goto_0

    :cond_0
    const-string p1, " DESC "

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

    goto :goto_1

    :cond_1
    const-string v1, " DESC "

    iput-object v1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->onSortByChanged()V

    return-object p1
.end method

.method private getSortByIndicatorResource()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortOrder:Ljava/lang/String;

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

    sget-object v0, Lcom/miui/gallery/ui/VideoResultPickFragment$6;->$SwitchMap$com$miui$gallery$widget$SortByHeader$SortBy:[I

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

.method private onItemSelectedChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method private onSortByChanged()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->clearChoices()V

    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b018c

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "cleaner_video_result_pick"

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 4

    const-string v0, "%s IN (%s) AND %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "_id"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, ","

    iget-object v3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanResultIds:[J

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Lcom/miui/gallery/cleaner/VideoScanner;->VALID_FILE:Ljava/lang/String;

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
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne p1, v1, :cond_0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "generate_headers"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    const p3, 0x7f100292

    invoke-virtual {p2, p3}, Lmiui/app/ActionBar;->setTitle(I)V

    new-instance p2, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object p3, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    sget-object p3, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mMultiChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->disableScaleImageViewAniWhenInActionMode()V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->startChoiceMode()V

    const p2, 0x7f0900c6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mDeleteButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    invoke-virtual {p2}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0900e4

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectButton:Landroid/widget/Button;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSelectListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/miui/gallery/cleaner/ScannerManager;->getInstance()Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p2

    const/4 p3, 0x2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanner(I)Lcom/miui/gallery/cleaner/BaseScanner;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/cleaner/VideoScanner;

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanner:Lcom/miui/gallery/cleaner/VideoScanner;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanner:Lcom/miui/gallery/cleaner/VideoScanner;

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/VideoScanner;->getScanResultIds()[J

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mScanResultIds:[J

    const p2, 0x7f0902af

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/SortByHeader;

    iput-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/SortByHeader;->setOnSortByClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p3, p0, Lcom/miui/gallery/ui/VideoResultPickFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-direct {p0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->getSortByIndicatorResource()I

    move-result v0

    invoke-virtual {p2, p3, v0}, Lcom/miui/gallery/widget/SortByHeader;->updateCurrentSortView(Lcom/miui/gallery/widget/SortByHeader$SortBy;I)V

    return-object p1
.end method
