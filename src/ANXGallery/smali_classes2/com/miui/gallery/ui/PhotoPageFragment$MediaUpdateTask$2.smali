.class Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->execute(Ljava/lang/String;ZLcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->access$6500(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;)Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->access$6500(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;)Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;->val$path:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;->onInsertDone(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
