.class public abstract Lcom/miui/gallery/picker/PickerCompatFragment;
.super Lmiui/app/Fragment;
.source "PickerCompatFragment.java"


# static fields
.field private static IMAGE_LOADER_USED_COUNT:I


# instance fields
.field protected mActivity:Landroid/app/Activity;

.field protected mUserFirstVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lmiui/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mUserFirstVisible:Z

    return-void
.end method


# virtual methods
.method protected abstract getPageName()Ljava/lang/String;
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f11009f

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/app/Fragment;->onAttach(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->getThemeRes()I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerCompatFragment;->setThemeRes(I)V

    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lmiui/app/Fragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lmiui/app/Fragment;->onPause()V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->useImageLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    sget v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    if-gtz v0, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    const/4 v0, 0x0

    sput v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->recordPageByDefault()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lmiui/app/Fragment;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->useImageLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/miui/gallery/picker/PickerCompatFragment;->IMAGE_LOADER_USED_COUNT:I

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->recordPageByDefault()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method protected onUserFirstVisible()V
    .locals 0

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/app/Fragment;->setUserVisibleHint(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mUserFirstVisible:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerCompatFragment;->onUserFirstVisible()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickerCompatFragment;->mUserFirstVisible:Z

    :cond_0
    return-void
.end method

.method protected useImageLoader()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
