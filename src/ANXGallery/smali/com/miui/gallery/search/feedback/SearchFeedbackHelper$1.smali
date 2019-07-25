.class final Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;
.super Ljava/lang/Object;
.source "SearchFeedbackHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportInDialog(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$completeListener:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;

.field final synthetic val$feedbackType:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

.field final synthetic val$imageServerIds:Ljava/util/ArrayList;

.field final synthetic val$tagName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Landroid/app/Activity;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$tagName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$imageServerIds:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$feedbackType:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

    iput-object p4, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$activity:Landroid/app/Activity;

    iput-object p5, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$completeListener:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    check-cast p1, Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result p1

    new-instance p2, Lcom/miui/gallery/ui/ProcessTask;

    new-instance v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;-><init>(Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;Z)V

    invoke-direct {p2, v0}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V

    new-instance v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$2;-><init>(Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;Z)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/ProcessTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$activity:Landroid/app/Activity;

    const v1, 0x7f1004de

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/ui/ProcessTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
