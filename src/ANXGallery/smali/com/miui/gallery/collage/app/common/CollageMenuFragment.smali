.class public abstract Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
.super Landroid/app/Fragment;
.source "CollageMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Lcom/miui/gallery/collage/core/CollagePresenter;",
        "R:",
        "Lcom/miui/gallery/collage/app/common/CollageRenderFragment;",
        ">",
        "Landroid/app/Fragment;"
    }
.end annotation


# instance fields
.field protected mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field private mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public setPresenter(Lcom/miui/gallery/collage/core/CollagePresenter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    return-void
.end method

.method public setRenderFragment(Lcom/miui/gallery/collage/app/common/CollageRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->mRenderFragment:Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    return-void
.end method
