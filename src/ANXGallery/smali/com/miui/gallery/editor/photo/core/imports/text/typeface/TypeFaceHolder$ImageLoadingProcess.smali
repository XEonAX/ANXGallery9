.class Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;
.super Ljava/lang/Object;
.source "TypeFaceHolder.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageLoadingProcess"
.end annotation


# instance fields
.field private mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

.field private mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isLocal()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isExtra()Z

    move-result p1

    if-eqz p1, :cond_1

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getState()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setStateImage(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getFontSize()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method
