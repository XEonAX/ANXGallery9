.class Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$1;
.super Ljava/lang/Object;
.source "FeedbackPolicyNoticeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$1;->this$0:Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$1;->this$0:Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method
