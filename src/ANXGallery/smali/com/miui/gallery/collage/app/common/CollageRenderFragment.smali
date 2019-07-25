.class public abstract Lcom/miui/gallery/collage/app/common/CollageRenderFragment;
.super Landroid/app/Fragment;
.source "CollageRenderFragment.java"


# instance fields
.field protected mBitmapReady:Z

.field protected mBitmaps:[Landroid/graphics/Bitmap;

.field protected mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract dismissControlWindow()V
.end method

.method public abstract export()Lcom/miui/gallery/collage/core/RenderData;
.end method

.method public isActivating()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract onBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
.end method

.method protected abstract onBitmapsReceive()V
.end method

.method public abstract onSimple()Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public final setBitmap([Landroid/graphics/Bitmap;)V
    .locals 1

    if-eqz p1, :cond_1

    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->mBitmapReady:Z

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->onBitmapsReceive()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public setReplaceImageListener(Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/app/common/CollageRenderFragment;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    return-void
.end method
