.class public abstract Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;
.super Ljava/lang/Object;
.source "ScreenVirtualEditorView.java"


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    return-void
.end method

.method protected final getBitmapDisplayInitRect()Landroid/graphics/RectF;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    return-object v0
.end method

.method protected final getBounds()Landroid/graphics/RectF;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method protected final getImageBounds()Landroid/graphics/RectF;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method protected final getImageDisplayRect()Landroid/graphics/RectF;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method protected final getImageMatrix()Landroid/graphics/Matrix;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method protected final invalidate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    return-void
.end method

.method protected final performCanvasMatrixChange()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performCanvasMatrixChange()V

    return-void
.end method

.method public removeDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->removeDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    return-void
.end method

.method public setImageMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;->performCanvasMatrixChange()V

    return-void
.end method
