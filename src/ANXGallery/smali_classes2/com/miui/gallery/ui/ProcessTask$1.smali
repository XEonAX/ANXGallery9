.class Lcom/miui/gallery/ui/ProcessTask$1;
.super Ljava/lang/Object;
.source "ProcessTask.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ProcessTask;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ProcessTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProcessTask$1;->this$0:Lcom/miui/gallery/ui/ProcessTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/ProcessTask$1;->this$0:Lcom/miui/gallery/ui/ProcessTask;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/ProcessTask;->cancel(Z)Z

    return-void
.end method
