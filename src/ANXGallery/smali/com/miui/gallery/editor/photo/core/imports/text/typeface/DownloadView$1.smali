.class Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->endDownloading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)Landroid/widget/ImageView;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;)V

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method
