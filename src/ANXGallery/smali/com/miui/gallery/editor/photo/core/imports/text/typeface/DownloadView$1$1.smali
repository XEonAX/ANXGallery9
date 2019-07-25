.class Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)Landroid/widget/TextView;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)Landroid/widget/ImageView;

    move-result-object p1

    const v0, 0x7f0700fb

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
