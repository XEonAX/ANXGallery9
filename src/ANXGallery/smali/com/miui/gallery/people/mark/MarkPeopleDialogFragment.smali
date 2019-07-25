.class public Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "MarkPeopleDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;,
        Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;
    }
.end annotation


# instance fields
.field private mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field private mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCancelView:Landroid/view/View;

.field private mDataView:Landroid/support/v7/widget/RecyclerView;

.field private mDialog:Landroid/app/Dialog;

.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

.field private mItemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

.field private mLoadMoreButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field private mLoadMoreButtonText:Ljava/lang/String;

.field private mLoadMoreView:Landroid/widget/TextView;

.field private mPeopleList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;"
        }
    .end annotation
.end field

.field private mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

.field private mShowCancelButton:Z

.field private mSingleView:Landroid/view/View;

.field private mSingleViewStub:Landroid/view/ViewStub;

.field private mTitle:Ljava/lang/String;

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mShowCancelButton:Z

    new-instance v0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-static {}, Lcom/miui/gallery/people/PeopleDisplayHelper;->getDefaultPeopleDisplayOptionsBuilder()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->onClickPeople(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;Landroid/widget/ImageView;Lcom/miui/gallery/people/model/People;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->bindPeopleCover(Landroid/widget/ImageView;Lcom/miui/gallery/people/model/People;)V

    return-void
.end method

.method private bindPeopleCover(Landroid/widget/ImageView;Lcom/miui/gallery/people/model/People;)V
    .locals 6

    invoke-virtual {p2}, Lcom/miui/gallery/people/model/People;->getCoverPath()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-virtual {p2}, Lcom/miui/gallery/people/model/People;->getCoverImageId()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p2}, Lcom/miui/gallery/people/model/People;->getCoverFaceRect()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p2}, Lcom/miui/gallery/people/model/People;->getCoverType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/people/PeopleDisplayHelper;->bindImage(Landroid/widget/ImageView;Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method private configCancelButton()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mShowCancelButton:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private configDataView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    const/16 v1, 0x8

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleViewStub:Landroid/view/ViewStub;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleViewStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    const v2, 0x7f09016a

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/people/model/People;

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->bindPeopleCover(Landroid/widget/ImageView;Lcom/miui/gallery/people/model/People;)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    new-instance v2, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$2;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_6
    :goto_0
    return-void
.end method

.method private configLoadMoreButton()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/text/SpannableString;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v1, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$1;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)V

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x21

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private onClickPeople(I)V
    .locals 2

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/people/model/People;

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;->onPeopleSelected(ILcom/miui/gallery/people/model/People;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public configTitle()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitleView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090093

    if-eq p1, v0, :cond_1

    const v0, 0x7f0901b1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonListener:Landroid/content/DialogInterface$OnClickListener;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDialog:Landroid/app/Dialog;

    const/16 v1, -0xa

    invoke-interface {p1, v0, v1}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDialog:Landroid/app/Dialog;

    invoke-interface {p1, v0}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0014

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    const-string v0, "markItemDecorInsetsDirty"

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/MiscUtil;->invokeSafely(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 12

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const-string v1, "MarkPeopleDialogFragment_Title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitle:Ljava/lang/String;

    const-string v1, "MarkPeopleDialogFragment_LoadMoreButtonText"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    const-string v1, "MarkPeopleDialogFragment_ShowCancelButton"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mShowCancelButton:Z

    const-string v1, "MarkPeopleDialogFragment_PeopleList"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "MarkPeopleDialogFragment_PeopleList"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    :cond_0
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b00ab

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    const v0, 0x7f0900d3

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitleView:Landroid/widget/TextView;

    const v0, 0x7f090093

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelView:Landroid/view/View;

    const v0, 0x7f0901b1

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreView:Landroid/widget/TextView;

    const v0, 0x7f0900c1

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0a0014

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    invoke-direct {v0, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f06030e

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f06030d

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mGridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    move-object v3, v0

    move v4, v6

    invoke-direct/range {v3 .. v11}, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;-><init>(IIIIIIZLandroid/support/v7/widget/GridLayoutManager;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mItemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mItemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    const v0, 0x7f0902a9

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mSingleViewStub:Landroid/view/ViewStub;

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configTitle()V

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configCancelButton()V

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configLoadMoreButton()V

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configDataView()V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    :cond_1
    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "MarkPeopleDialogFragment_Title"

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MarkPeopleDialogFragment_LoadMoreButtonText"

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v0, "MarkPeopleDialogFragment_ShowCancelButton"

    iget-boolean v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mShowCancelButton:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    const-string v0, "MarkPeopleDialogFragment_PeopleList"

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_2
    return-void
.end method

.method public setCancelButton(ZLandroid/content/DialogInterface$OnCancelListener;)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mShowCancelButton:Z

    iput-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mCancelButtonListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configCancelButton()V

    return-void
.end method

.method public setLoadMoreButton(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonText:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mLoadMoreButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configLoadMoreButton()V

    return-void
.end method

.method public setPeopleList(Ljava/util/ArrayList;Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;",
            "Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleList:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

    invoke-direct {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configDataView()V

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->configTitle()V

    return-void
.end method
