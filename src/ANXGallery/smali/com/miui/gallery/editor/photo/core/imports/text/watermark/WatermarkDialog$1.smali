.class Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;
.super Ljava/lang/Object;
.source "WatermarkDialog.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

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

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->access$002(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->access$102(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;Landroid/graphics/Paint;)Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)Landroid/graphics/Paint;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;->onCompleted()V

    :cond_0
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 0

    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method
