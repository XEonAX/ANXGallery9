.class Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;
.super Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;
.source "BackupTitle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupTitle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResumeSyncListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BackupTitle;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V

    return-void
.end method


# virtual methods
.method public onCustomClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->resumeSync(Landroid/content/Context;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->onCustomClick(Landroid/view/View;)V

    return-void
.end method
