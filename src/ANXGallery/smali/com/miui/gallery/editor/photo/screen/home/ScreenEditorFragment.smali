.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;
.super Landroid/app/Fragment;
.source "ScreenEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;


# instance fields
.field private mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

.field private mIsLongCrop:Z

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public checkTextEditor(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->checkTextEditor(Z)V

    return-void
.end method

.method public doRevert()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->canRevert()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->doRevert()V

    :cond_0
    return-void
.end method

.method public doRevoke()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->canRevoke()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->doRevoke()V

    :cond_0
    return-void
.end method

.method public getCurrentScreenEditor()Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getCurrentScreenEditor()Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    move-result-object v0

    return-object v0
.end method

.method public isModified()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->isModified()Z

    move-result v0

    return v0
.end method

.method public isModifiedBaseLast()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->isModifiedBaseLast()Z

    move-result v0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b012e

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onExport()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->onExport()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;

    move-result-object v0

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090279

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mIsLongCrop:Z

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setLongCrop(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->init()V

    return-void
.end method

.method public setCurrentScreenEditor(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setCurrentScreenEditor(I)Z

    move-result p1

    return p1
.end method

.method public setLongCrop(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mIsLongCrop:Z

    return-void
.end method

.method public setLongCropEntry(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setLongCropEntry(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V

    return-void
.end method

.method public setOperationUpdateListener(Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

    return-void
.end method

.method public setPreviewBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setPreviewBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public startScreenThumbnailAnimate(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->startScreenThumbnailAnimate(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    :cond_0
    return-void
.end method
