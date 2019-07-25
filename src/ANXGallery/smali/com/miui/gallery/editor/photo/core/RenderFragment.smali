.class public abstract Lcom/miui/gallery/editor/photo/core/RenderFragment;
.super Landroid/app/Fragment;
.source "RenderFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/RenderFragment$Callbacks;
    }
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field protected mEffect:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "*>;"
        }
    .end annotation
.end field

.field private mIsNear3V4:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public final export()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->onExport()Lcom/miui/gallery/editor/photo/core/RenderData;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getUnSupportStringRes()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract isEmpty()Z
.end method

.method public isNear3V4()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mIsNear3V4:Z

    return v0
.end method

.method public isSupportAnimation()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isSupportBitmap(Landroid/graphics/Bitmap;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object p1

    instance-of v0, p1, Lcom/miui/gallery/editor/photo/utils/Attachable;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/editor/photo/utils/Attachable;

    invoke-interface {p1, p0}, Lcom/miui/gallery/editor/photo/utils/Attachable;->attach(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "RenderFragment"

    const-string v0, "RenderFragment onCreate"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "RenderFragment:effect"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    aget-object p1, p1, v0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->clear()V

    return-void
.end method

.method protected abstract onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
.end method

.method protected abstract onSample()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const-string p1, "RenderFragment"

    const-string p2, "RenderFragment onViewCreated"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final sample()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->onSample()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setArguments(Landroid/os/Bundle;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :goto_1
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setBitmapRatio(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    const/high16 p1, 0x3f400000    # 0.75f

    sub-float p1, v0, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v1, 0x3f100000    # 0.5625f

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/RenderFragment;->mIsNear3V4:Z

    return-void
.end method
