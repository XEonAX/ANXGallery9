.class Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;
.super Ljava/lang/Object;
.source "SearchFeedbackHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

.field final synthetic val$contribute:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->this$0:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

    iput-boolean p2, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->val$contribute:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doProcess([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->this$0:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

    iget-object p1, p1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$tagName:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->this$0:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

    iget-object v0, v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$imageServerIds:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->this$0:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

    iget-object v1, v1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;->val$feedbackType:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

    iget-boolean v2, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->val$contribute:Z

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->access$000(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic doProcess([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1$1;->doProcess([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
