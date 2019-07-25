.class Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;
.super Lcom/miui/gallery/ui/BackupTitle$BaseClickListener;
.source "BackupTitle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupTitle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncImmediateListener"
.end annotation


# instance fields
.field private mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

.field final synthetic this$0:Lcom/miui/gallery/ui/BackupTitle;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BackupTitle$BaseClickListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method


# virtual methods
.method public onCustomClick(Landroid/view/View;)V
    .locals 8

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    const v0, 0x7f1000b9

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncState()Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getDirtySize()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p1, v0, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const v0, 0x7f1000ba

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f1000b8

    const v5, 0x7f1000d6

    new-instance v6, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;-><init>(Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;)V

    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/BackupTitle;->access$1800(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V

    return-void
.end method
