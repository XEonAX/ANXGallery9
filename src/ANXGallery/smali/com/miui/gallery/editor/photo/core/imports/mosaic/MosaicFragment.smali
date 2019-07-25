.class public Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;
.source "MosaicFragment.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/miui/gallery/editor/photo/core/GLFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;
    }
.end annotation


# instance fields
.field private mMosaicContext:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

.field private mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

.field private mNextEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

.field private mNextPaintSize:I

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextPaintSize:I

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicContext:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicContext:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

    return-object p0
.end method


# virtual methods
.method public canRevert()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->canRevert()Z

    move-result v0

    return v0
.end method

.method public canRevoke()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->canRevoke()Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->onClear()V

    return-void
.end method

.method public doRevert()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->doRevert()V

    return-void
.end method

.method public doRevoke()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->doRevoke()V

    return-void
.end method

.method public getGLContext()Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicContext:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const p3, 0x7f0b0071

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    const/4 p3, 0x0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setCurrentEntity(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    :cond_0
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextPaintSize:I

    const/4 v0, 0x1

    const/4 v1, -0x1

    if-eq p2, v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextPaintSize:I

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setMosaicPaintSize(I)V

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextPaintSize:I

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {p2, p3, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {p1, p2, v1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    return-object p1
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->export()Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->generateSample()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setMosaicData(Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;)V
    .locals 1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setCurrentEntity(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    :goto_0
    return-void
.end method

.method public setMosaicPaintSize(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setMosaicPaintSize(I)V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mNextPaintSize:I

    :goto_0
    return-void
.end method

.method public setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicView:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    :goto_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment;->mMosaicContext:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicFragment$MosaicContext;->surfaceDestroyed()V

    return-void
.end method
