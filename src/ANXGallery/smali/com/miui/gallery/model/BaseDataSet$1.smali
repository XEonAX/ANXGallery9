.class Lcom/miui/gallery/model/BaseDataSet$1;
.super Ljava/lang/Object;
.source "BaseDataSet.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/model/BaseDataSet;->delete(Landroid/app/Activity;ILcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/model/BaseDataSet;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$item:Lcom/miui/gallery/model/BaseDataItem;

.field final synthetic val$listener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/model/BaseDataSet;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataSet$1;->this$0:Lcom/miui/gallery/model/BaseDataSet;

    iput-object p2, p0, Lcom/miui/gallery/model/BaseDataSet$1;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    iput-object p3, p0, Lcom/miui/gallery/model/BaseDataSet$1;->val$listener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    iput-object p4, p0, Lcom/miui/gallery/model/BaseDataSet$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    new-instance p1, Lcom/miui/gallery/ui/ProcessTask;

    new-instance p2, Lcom/miui/gallery/model/BaseDataSet$1$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/model/BaseDataSet$1$1;-><init>(Lcom/miui/gallery/model/BaseDataSet$1;)V

    invoke-direct {p1, p2}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V

    new-instance p2, Lcom/miui/gallery/model/BaseDataSet$1$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/model/BaseDataSet$1$2;-><init>(Lcom/miui/gallery/model/BaseDataSet$1;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/ProcessTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    iget-object p2, p0, Lcom/miui/gallery/model/BaseDataSet$1;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataSet$1;->val$activity:Landroid/app/Activity;

    const v1, 0x7f100300

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    sget-object p2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/ProcessTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
