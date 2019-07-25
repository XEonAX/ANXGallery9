.class Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;
.super Ljava/lang/Object;
.source "BackupTitle.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->onCustomClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;->this$1:Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;->this$1:Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;

    iget-object p1, p1, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener$1;->this$1:Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;

    invoke-static {p2}, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;->access$1700(Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/BackupTitle;->access$1800(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V

    return-void
.end method
