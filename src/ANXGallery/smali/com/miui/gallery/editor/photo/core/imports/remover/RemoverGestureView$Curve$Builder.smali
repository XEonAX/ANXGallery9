.class abstract Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;
.super Ljava/lang/Object;
.source "RemoverGestureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mDraft:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method done()Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->mDraft:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->mDraft:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;

    return-object v0
.end method

.method draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->mDraft:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method final handleDown(FF)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->onDown(FF)V

    return-void
.end method

.method final handleMove(FF)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->onMove(FF)V

    return-void
.end method

.method final handleUp(FF)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->onUp(FF)V

    return-void
.end method

.method final initDraft(Landroid/graphics/Paint;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->onCreateDraft(Landroid/graphics/Paint;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve$Builder;->mDraft:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;

    return-void
.end method

.method abstract onCreateDraft(Landroid/graphics/Paint;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Paint;",
            ")TT;"
        }
    .end annotation
.end method

.method abstract onDown(FF)V
.end method

.method abstract onMove(FF)V
.end method

.method abstract onUp(FF)V
.end method
