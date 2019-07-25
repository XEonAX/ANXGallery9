.class Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;
.super Ljava/lang/Object;
.source "RecommendFaceGroupAdapter.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->confirmRecommends(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

.field final synthetic val$confirmToRight:Ljava/util/ArrayList;

.field final synthetic val$confirmToWrong:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->val$confirmToRight:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->val$confirmToWrong:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->val$confirmToRight:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$100(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/util/ArrayList;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;->val$confirmToWrong:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$100(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/util/ArrayList;Z)V

    const/4 p1, 0x0

    return-object p1
.end method
