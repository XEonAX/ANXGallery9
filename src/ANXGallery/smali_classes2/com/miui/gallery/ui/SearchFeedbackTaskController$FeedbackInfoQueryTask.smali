.class Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;
.super Landroid/os/AsyncTask;
.source "SearchFeedbackTaskController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SearchFeedbackTaskController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FeedbackInfoQueryTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/SearchFeedbackTaskController;Lcom/miui/gallery/ui/SearchFeedbackTaskController$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;-><init>(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/os/Bundle;
    .locals 4

    const/4 p1, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->getFeedbackTaskInfo()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "need_handle_image_num"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "finish_image_num"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-static {v3, v1, v2}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$100(Lcom/miui/gallery/ui/SearchFeedbackTaskController;II)I

    move-result v1

    const-string v2, "task_status"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :cond_1
    :goto_0
    return-object p1

    :catch_0
    const-string v0, "SearchFeedbackTaskController"

    const-string v1, "getFeedbackTaskInfo failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->doInBackground([Ljava/lang/Void;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/os/Bundle;)V
    .locals 5

    const-string v0, "SearchFeedbackTaskController"

    const-string v1, "On get bundle %s, resumed %s"

    iget-object v2, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-static {v2}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$200(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-static {v0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$200(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "need_handle_image_num"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "finish_image_num"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    const-string v3, "task_status"

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-static {v2, p1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$302(Lcom/miui/gallery/ui/SearchFeedbackTaskController;I)I

    iget-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$400(Lcom/miui/gallery/ui/SearchFeedbackTaskController;II)V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->this$0:Lcom/miui/gallery/ui/SearchFeedbackTaskController;

    invoke-static {p1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->access$500(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->onPostExecute(Landroid/os/Bundle;)V

    return-void
.end method
