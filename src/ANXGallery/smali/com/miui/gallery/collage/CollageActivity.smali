.class public Lcom/miui/gallery/collage/CollageActivity;
.super Landroid/app/Activity;
.source "CollageActivity.java"

# interfaces
.implements Lcom/miui/gallery/collage/core/ViewInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;
    }
.end annotation


# instance fields
.field private mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

.field private mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

.field private mCancel:Landroid/widget/TextView;

.field private mCancelListener:Landroid/view/View$OnClickListener;

.field private mCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mCurrentImageSize:I

.field private mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

.field private mLoadingProgressView:Landroid/view/View;

.field private mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

.field private mRadioGroup:Landroid/widget/RadioGroup;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mRenderContainer:Landroid/view/View;

.field private mReplaceBitmapFrom:Landroid/graphics/Bitmap;

.field private mRootView:Landroid/view/ViewGroup;

.field private mSave:Landroid/widget/TextView;

.field private mSaveListener:Landroid/view/View$OnClickListener;

.field private mSaveProgressDialog:Lmiui/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentImageSize:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRectTemp:Landroid/graphics/Rect;

    new-instance v0, Lcom/miui/gallery/collage/CollageActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/CollageActivity$1;-><init>(Lcom/miui/gallery/collage/CollageActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    new-instance v0, Lcom/miui/gallery/collage/CollageActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/CollageActivity$2;-><init>(Lcom/miui/gallery/collage/CollageActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCancelListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/collage/CollageActivity$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/CollageActivity$3;-><init>(Lcom/miui/gallery/collage/CollageActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/collage/CollageActivity$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/CollageActivity$4;-><init>(Lcom/miui/gallery/collage/CollageActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/collage/CollageActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->onSelectRadio(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/core/CollagePresenter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/BitmapManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/CollageActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->onBitmapDecodeFinishAfterChoose()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/CollageActivity;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/collage/CollageActivity;->notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private decodeBitmapAsync([Landroid/net/Uri;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/BitmapManager;->loadBitmapAsync([Landroid/net/Uri;)V

    return-void
.end method

.method private dismissLoading()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mLoadingProgressView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRootView:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mLoadingProgressView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mLoadingProgressView:Landroid/view/View;

    :cond_0
    return-void
.end method

.method private enableButton()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSave:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void
.end method

.method private findViews()V
    .locals 1

    const v0, 0x7f0900a5

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    const v0, 0x7f0900a4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSave:Landroid/widget/TextView;

    const v0, 0x7f090097

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCancel:Landroid/widget/TextView;

    const v0, 0x7f090263

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRenderContainer:Landroid/view/View;

    const v0, 0x7f090235

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mLoadingProgressView:Landroid/view/View;

    const v0, 0x7f0900a3

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRootView:Landroid/view/ViewGroup;

    return-void
.end method

.method private gotoPhotoPage(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/collage/BitmapManager;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/collage/BitmapManager;-><init>(Landroid/content/Context;Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    return-void
.end method

.method private initPresenter()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/collage/core/Effect;->values()[Lcom/miui/gallery/collage/core/Effect;

    move-result-object v0

    array-length v0, v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/collage/core/Effect;->values()[Lcom/miui/gallery/collage/core/Effect;

    move-result-object v3

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/miui/gallery/collage/core/Effect;->generatePresenter()Lcom/miui/gallery/collage/core/CollagePresenter;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentImageSize:I

    invoke-virtual {v3, v4}, Lcom/miui/gallery/collage/core/CollagePresenter;->supportImageSize(I)Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentImageSize:I

    invoke-virtual {v3, v4}, Lcom/miui/gallery/collage/core/CollagePresenter;->setImageSize(I)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/collage/core/CollagePresenter;

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-void
.end method

.method private initView()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f0b0057

    iget-object v7, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v5, v6, v7, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioButton;

    iget-object v6, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v6, v5}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v4}, Lcom/miui/gallery/collage/core/CollagePresenter;->getTitle()I

    move-result v4

    invoke-virtual {v5, v4}, Landroid/widget/RadioButton;->setText(I)V

    invoke-virtual {v5}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/RadioButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lcom/miui/gallery/collage/CollageActivity;->mCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v5, v4}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCancel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mCancelListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSave:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    invoke-virtual {v3, p1, p2}, Lcom/miui/gallery/collage/core/CollagePresenter;->notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private notifyBitmapsReceive()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/BitmapManager;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->dismissLoading()V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/collage/core/CollagePresenter;->notifyReceiveBitmaps()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->enableButton()V

    return-void
.end method

.method private onBitmapDecodeFinishAfterChoose()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/BitmapManager;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/BitmapManager;->size()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentImageSize:I

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->notifyBitmapsReceive()V

    :cond_0
    return-void
.end method

.method private onSelectPresenter(I)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    aget-object p1, v0, p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/collage/core/CollagePresenter;->attach(Lcom/miui/gallery/collage/core/ViewInterface;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-virtual {v2}, Lcom/miui/gallery/collage/core/CollagePresenter;->getMenuFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->hide(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    iget-object v2, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-virtual {v2}, Lcom/miui/gallery/collage/core/CollagePresenter;->getRenderFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->hide(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->getMenuFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->getRenderFragmentTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v4

    invoke-virtual {v0, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v5

    if-nez v5, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->getRenderFragment()Landroid/app/Fragment;

    move-result-object v5

    const v6, 0x7f090263

    invoke-virtual {v1, v6, v5, v3}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v5}, Landroid/app/FragmentTransaction;->show(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :goto_0
    if-nez v4, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->getMenuFragment()Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    move-result-object p1

    const v3, 0x7f0901c9

    invoke-virtual {v1, v3, p1, v2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v4}, Landroid/app/FragmentTransaction;->show(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :goto_1
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    return-void
.end method

.method private onSelectRadio(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v0, p1}, Landroid/widget/RadioGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->onSelectPresenter(I)V

    return-void
.end method

.method private receiveImages(Landroid/content/ClipData;)V
    .locals 4

    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    const/4 v1, 0x6

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    new-array v1, v0, [Landroid/net/Uri;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/collage/CollageActivity;->resolveUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentImageSize:I

    invoke-direct {p0, v1}, Lcom/miui/gallery/collage/CollageActivity;->decodeBitmapAsync([Landroid/net/Uri;)V

    return-void
.end method

.method private resolveIntent()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "collage"

    const-string v2, "collage_enter"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/CollageActivity;->receiveImages(Landroid/content/ClipData;)V

    :cond_0
    return-void
.end method

.method private resolveUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.miui.gallery.open"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p1
.end method

.method private showProgressDialog()V
    .locals 2

    new-instance v0, Lmiui/app/ProgressDialog;

    invoke-direct {v0, p0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    const v1, 0x7f100540

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/CollageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setCancelable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    return-void
.end method

.method private startPicker(II)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "pick-upper-bound"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/collage/CollageActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRenderContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRenderContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/collage/CollageActivity;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/core/CollagePresenter;->dismissControlWindow()V

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getBitmaps()[Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/BitmapManager;->data()[Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    return-object p0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const-string v0, "CollageActivity"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eq p2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->resolveUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    iget-object p3, p0, Lcom/miui/gallery/collage/CollageActivity;->mReplaceBitmapFrom:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3, p1}, Lcom/miui/gallery/collage/BitmapManager;->replaceBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    goto :goto_0

    :pswitch_1
    if-eq p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->finish()V

    goto :goto_0

    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->receiveImages(Landroid/content/ClipData;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onAttachFragment(Landroid/app/Fragment;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mCurrentPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->onAttachFragment(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    invoke-static {p0}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SystemUiUtil;->extendToStatusBar(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    const/4 p1, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->setCutoutModeShortEdges(Landroid/view/Window;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x400

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SystemUiUtil;->setDrawSystemBarBackground(Landroid/view/Window;)V

    const p1, 0x7f0b0053

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->init()V

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->findViews()V

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->resolveIntent()V

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->initPresenter()V

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->initView()V

    return-void
.end method

.method protected onDestroy()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mSaveProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mPresenters:[Lcom/miui/gallery/collage/core/CollagePresenter;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/collage/core/CollagePresenter;->detach()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity;->mBitmapManager:Lcom/miui/gallery/collage/BitmapManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/BitmapManager;->setBitmapLoaderListener(Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;)V

    :cond_2
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    return-void
.end method

.method public onReplaceBitmap(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "CollageActivity"

    const-string v1, "replace bitmap : %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/CollageActivity;->mReplaceBitmapFrom:Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p1}, Lcom/miui/gallery/collage/CollageActivity;->startPicker(II)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    return-void
.end method

.method public onSaveFinish(Ljava/lang/String;Z)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->gotoPhotoPage(Ljava/lang/String;)V

    :cond_0
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/CollageActivity;->setResult(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/CollageActivity;->finish()V

    return-void
.end method

.method public onSaving()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/CollageActivity;->showProgressDialog()V

    return-void
.end method
