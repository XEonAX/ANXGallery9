.class public Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;
.super Landroid/app/Fragment;
.source "ScreenLongCropFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/longcrop/ILongCropEditorController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;
    }
.end annotation


# instance fields
.field private mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

.field private mLastCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

.field private mOrigin:Landroid/graphics/Bitmap;

.field private mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

.field private mScreenLongCropCallback:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method private startEnterAnimation([I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->startEnterAnimator([I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenLongCropCallback:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;->startAnimator()V

    return-void
.end method


# virtual methods
.method public isModifiedBaseLast()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->export()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mLastCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mLastCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mLastCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->isModified()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b012f

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    return-void
.end method

.method public onExport()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->export()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    move-result-object v0

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0900f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenLongCropCallback:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f050125

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setPaintColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setShowShadow(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setScreenDrawEntry(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setOriginalBitmap(Landroid/graphics/Bitmap;FF)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenLongCropCallback:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;->getScreenRect()[I

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->startEnterAnimation([I)V

    return-void
.end method

.method public setOriginBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setOriginalBitmap(Landroid/graphics/Bitmap;FF)V

    :cond_0
    return-void
.end method

.method public setScreenDrawEntry(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->setScreenDrawEntry(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setScreenLongCropCallback(Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->mScreenLongCropCallback:Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;

    return-void
.end method
