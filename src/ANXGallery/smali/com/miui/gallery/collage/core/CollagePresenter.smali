.class public abstract Lcom/miui/gallery/collage/core/CollagePresenter;
.super Ljava/lang/Object;
.source "CollagePresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;,
        Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;,
        Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;
    }
.end annotation


# instance fields
.field private mDataLoader:Lcom/miui/gallery/collage/app/common/IDataLoader;

.field protected mImageCount:I

.field private mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

.field private mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

.field private mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

.field private mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

.field protected mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mImageCount:I

    new-instance v0, Lcom/miui/gallery/collage/core/CollagePresenter$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/core/CollagePresenter$2;-><init>(Lcom/miui/gallery/collage/core/CollagePresenter;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    return-void
.end method

.method private static getCreativePath()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCreativeDirectory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public attach(Lcom/miui/gallery/collage/core/ViewInterface;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    return-void
.end method

.method protected abstract createEngine(Landroid/content/Context;Lcom/miui/gallery/collage/BitmapManager;)Lcom/miui/gallery/collage/core/RenderEngine;
.end method

.method public final detach()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    invoke-static {v1, v0}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->access$002(Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;)Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mDataLoader:Lcom/miui/gallery/collage/app/common/IDataLoader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mDataLoader:Lcom/miui/gallery/collage/app/common/IDataLoader;

    invoke-interface {v0}, Lcom/miui/gallery/collage/app/common/IDataLoader;->cancel()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/CollagePresenter;->onDetach()V

    return-void
.end method

.method public dismissControlWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->dismissControlWindow()V

    :cond_0
    return-void
.end method

.method public doSave(Lcom/miui/gallery/collage/BitmapManager;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->export()Lcom/miui/gallery/collage/core/RenderData;

    move-result-object v3

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->onSimple()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "collage"

    const-string v2, "collage_save"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    invoke-interface {v0}, Lcom/miui/gallery/collage/core/ViewInterface;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->createEngine(Landroid/content/Context;Lcom/miui/gallery/collage/BitmapManager;)Lcom/miui/gallery/collage/core/RenderEngine;

    move-result-object v2

    const/4 p1, 0x0

    if-eqz v3, :cond_2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    invoke-interface {v0}, Lcom/miui/gallery/collage/core/ViewInterface;->onSaving()V

    const-string v0, "yyyyMMdd_HHmmss"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v0, v4, v5}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "IMG_%s.jpg"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, p1

    invoke-static {v1, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/collage/core/CollagePresenter;->getCreativePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    invoke-interface {v1}, Lcom/miui/gallery/collage/core/ViewInterface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;-><init>(Lcom/miui/gallery/collage/core/RenderEngine;Lcom/miui/gallery/collage/core/RenderData;Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/collage/core/CollagePresenter$1;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    new-instance v1, Lcom/miui/gallery/collage/core/CollagePresenter$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/collage/core/CollagePresenter$1;-><init>(Lcom/miui/gallery/collage/core/CollagePresenter;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->access$002(Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;)Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mSaveTask:Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/collage/core/ViewInterface;->onSaveFinish(Ljava/lang/String;Z)V

    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public getImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mImageCount:I

    return v0
.end method

.method public getMenuFragment()Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/CollagePresenter;->onCreateMenuFragment()Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    return-object v0
.end method

.method public abstract getMenuFragmentTag()Ljava/lang/String;
.end method

.method public getRenderFragment()Landroid/app/Fragment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/CollagePresenter;->onCreateRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    return-object v0
.end method

.method public abstract getRenderFragmentTag()Ljava/lang/String;
.end method

.method public abstract getTitle()I
.end method

.method protected abstract hasResourceData()Z
.end method

.method public isActivating()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->isActivating()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final loadDataFromResourceAsync(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/CollagePresenter;->hasResourceData()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;->onDataLoad()V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->onCreateDataLoader(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)Lcom/miui/gallery/collage/app/common/IDataLoader;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mDataLoader:Lcom/miui/gallery/collage/app/common/IDataLoader;

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mDataLoader:Lcom/miui/gallery/collage/app/common/IDataLoader;

    invoke-interface {p1}, Lcom/miui/gallery/collage/app/common/IDataLoader;->loadData()V

    return-void
.end method

.method public notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->onBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public notifyReceiveBitmaps()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    invoke-interface {v1}, Lcom/miui/gallery/collage/core/ViewInterface;->getBitmaps()[Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->setBitmap([Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mViewInterface:Lcom/miui/gallery/collage/core/ViewInterface;

    invoke-interface {p1}, Lcom/miui/gallery/collage/core/ViewInterface;->getBitmaps()[Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->setBitmap([Landroid/graphics/Bitmap;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->setReplaceImageListener(Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;)V

    goto :goto_0

    :cond_1
    instance-of p1, p1, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->setPresenter(Lcom/miui/gallery/collage/core/CollagePresenter;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mMenuFragment:Lcom/miui/gallery/collage/app/common/CollageMenuFragment;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->setRenderFragment(Lcom/miui/gallery/collage/app/common/CollageRenderFragment;)V

    :cond_2
    :goto_0
    return-void
.end method

.method protected abstract onCreateDataLoader(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)Lcom/miui/gallery/collage/app/common/IDataLoader;
.end method

.method protected abstract onCreateMenuFragment()Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
.end method

.method protected abstract onCreateRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;
.end method

.method protected abstract onDetach()V
.end method

.method public setImageSize(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter;->mImageCount:I

    return-void
.end method

.method public supportImageSize(I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
