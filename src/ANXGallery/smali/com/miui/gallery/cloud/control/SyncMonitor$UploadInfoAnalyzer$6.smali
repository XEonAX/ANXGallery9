.class Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;
.super Ljava/lang/Object;
.source "SyncMonitor.java"

# interfaces
.implements Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$Func;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;->clear()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$Func<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic doFunc()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->doFunc()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public doFunc()Ljava/lang/Void;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;

    iget-object v1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;

    iget-object v2, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;

    const-wide/16 v3, 0x0

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;->access$502(Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;J)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;->access$602(Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;J)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;->access$402(Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;J)J

    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer$6;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;

    invoke-static {v0}, Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;->access$700(Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    return-object v0
.end method
