.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;
.source "DoodleFragment.java"


# instance fields
.field private mCurrentColor:I

.field private mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

.field private mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

.field private mStats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;-><init>()V

    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mCurrentColor:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mStats:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mStats:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public canRevert()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->canRevert()Z

    move-result v0

    return v0
.end method

.method public canRevoke()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->canRevoke()Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->onClear()V

    return-void
.end method

.method public doRevert()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->doRevert()V

    return-void
.end method

.method public doRevoke()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->doRevoke()V

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0071

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mCurrentColor:I

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setColor(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setDoodleCallback(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    :cond_0
    return-object p1
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;)V

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

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mStats:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public setColor(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mCurrentColor:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setDoodleData(Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;->getDoodleItem()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setCurrentDoodleItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->clearActivation()V

    :cond_0
    return-void
.end method

.method public setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    :goto_0
    return-void
.end method

.method public setPaintSize(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;->mDoodleEditorView:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setPaintSize(F)V

    return-void
.end method
