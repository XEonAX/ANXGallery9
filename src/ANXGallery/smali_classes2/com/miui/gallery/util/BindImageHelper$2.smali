.class final Lcom/miui/gallery/util/BindImageHelper$2;
.super Ljava/lang/Object;
.source "BindImageHelper.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/BindImageHelper;->getLocalLoadingListener(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

.field final synthetic val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;


# direct methods
.method constructor <init>(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    iput-object p2, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    invoke-interface {p1}, Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;->onLoadingComplete()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    const p2, 0x7f090187

    invoke-static {}, Lcom/miui/gallery/util/BindImageHelper;->access$000()Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    instance-of p1, p1, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-interface {p1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    if-eqz p1, :cond_2

    new-instance p1, Lcom/miui/gallery/util/BindImageHelper$2$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/util/BindImageHelper$2$1;-><init>(Lcom/miui/gallery/util/BindImageHelper$2;)V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    if-ne p2, p3, :cond_1

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$2;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    invoke-interface {p1}, Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;->onLoadingFailed()V

    :cond_3
    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method
