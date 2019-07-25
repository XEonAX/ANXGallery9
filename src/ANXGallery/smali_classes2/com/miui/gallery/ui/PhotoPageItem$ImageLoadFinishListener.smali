.class Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageLoadFinishListener"
.end annotation


# instance fields
.field private mCallbackRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method protected onLoadFinish(ZLjava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;->onImageLoadFinish(ZLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    const/4 p2, 0x1

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->onLoadFinish(ZLjava/lang/String;)V

    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->onLoadFinish(ZLjava/lang/String;)V

    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 0

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;->onLoadFinish(ZLjava/lang/String;)V

    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method
