.class Lcom/miui/gallery/ui/CleanerFragment$4;
.super Ljava/lang/Object;
.source "CleanerFragment.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CleanerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CleanerFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CleanerFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScanCanceled()V
    .locals 0

    return-void
.end method

.method public onScanFinish(J)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$800(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanResultEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showEmptyAnim()V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->access$300(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$900(Lcom/miui/gallery/ui/CleanerFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object v0

    const/4 v1, 0x1

    new-instance v2, Lcom/miui/gallery/ui/CleanerFragment$4$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/CleanerFragment$4$1;-><init>(Lcom/miui/gallery/ui/CleanerFragment$4;)V

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public onScanProgress(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZ)V

    return-void
.end method

.method public onScanResultUpdate(J)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$800(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanFinish()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$800(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanResultEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showEmptyAnim()V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$500(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->expand(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->show(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->access$300(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$900(Lcom/miui/gallery/ui/CleanerFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->isRotating()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->hideRingCircle(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/CleanerFragment;->access$800(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanSize()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(J)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onScanStart()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->show(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$500(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->expand(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showRingCircle(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$4;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    move-result-object v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZ)V

    return-void
.end method
