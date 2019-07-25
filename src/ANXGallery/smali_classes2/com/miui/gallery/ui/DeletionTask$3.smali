.class Lcom/miui/gallery/ui/DeletionTask$3;
.super Ljava/lang/Object;
.source "DeletionTask.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/DeletionTask;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener<",
        "[J>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/DeletionTask;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/DeletionTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DeletionTask$3;->this$0:Lcom/miui/gallery/ui/DeletionTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompleteProcess(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [J

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeletionTask$3;->onCompleteProcess([J)V

    return-void
.end method

.method public onCompleteProcess([J)V
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    array-length v1, p1

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/DeletionTask$3;->this$0:Lcom/miui/gallery/ui/DeletionTask;

    invoke-static {v2}, Lcom/miui/gallery/ui/DeletionTask;->access$000(Lcom/miui/gallery/ui/DeletionTask;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/DeletionTask$3;->this$0:Lcom/miui/gallery/ui/DeletionTask;

    invoke-static {v2}, Lcom/miui/gallery/ui/DeletionTask;->access$000(Lcom/miui/gallery/ui/DeletionTask;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    aget-wide v0, p1, v0

    const-wide/16 v3, -0x70

    cmp-long p1, v0, v3

    if-nez p1, :cond_2

    if-eqz v2, :cond_2

    invoke-static {v2}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    :cond_2
    return-void
.end method
