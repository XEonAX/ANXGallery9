.class public Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;
.source "FrameFragment.java"


# instance fields
.field private mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

.field private mSimpleString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public getUnSupportStringRes()I
    .locals 1

    const v0, 0x7f1003fe

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isSupportBitmap(Landroid/graphics/Bitmap;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    cmpg-float v1, v0, p1

    if-gez v1, :cond_0

    div-float v0, p1, v0

    :cond_0
    const/high16 p1, 0x40400000    # 3.0f

    cmpg-float p1, v0, p1

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0072

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    const p2, 0x7f090140

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    return-object p1
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mSimpleString:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public setRatio(FLjava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mSimpleString:Ljava/lang/String;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->setRatio(F)V

    :cond_0
    return-void
.end method

.method public setScaleProgress(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;->mFrameEditorView:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->setScaleProgress(F)V

    :cond_0
    return-void
.end method
