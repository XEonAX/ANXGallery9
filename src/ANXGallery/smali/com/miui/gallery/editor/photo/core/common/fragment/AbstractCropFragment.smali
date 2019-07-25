.class public abstract Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;
.super Lcom/miui/gallery/editor/photo/core/RenderFragment;
.source "AbstractCropFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;
    }
.end annotation


# instance fields
.field private mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

.field private mHasChanged:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public autoCrop(F)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onAutoCrop(F)V

    return-void
.end method

.method public changeRotationState(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;->changeRotationState(Z)V

    :cond_0
    return-void
.end method

.method public doMirror()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onDoMirror()V

    return-void
.end method

.method public doRotate()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onDoRotate()V

    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public abstract finishTuning()V
.end method

.method protected final notifyCropped()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;->onCropped()V

    :cond_0
    return-void
.end method

.method protected final notifyRestored()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;->onRestored()V

    :cond_0
    return-void
.end method

.method protected abstract onAutoCrop(F)V
.end method

.method public onChanged()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->notifyCropped()V

    :cond_0
    return-void
.end method

.method protected abstract onDoMirror()V
.end method

.method protected abstract onDoRotate()V
.end method

.method protected abstract onSetAspectRatio(Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;)V
.end method

.method protected abstract onTurning(F)V
.end method

.method public abstract prepareTuning()V
.end method

.method public restore()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mHasChanged:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->notifyRestored()V

    :cond_0
    return-void
.end method

.method public setAspectRatio(Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onChanged()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onSetAspectRatio(Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;)V

    return-void
.end method

.method public setOnCropChangedListener(Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->mCropChangedListener:Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;

    return-void
.end method

.method public tuning(F)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onChanged()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onTurning(F)V

    return-void
.end method
