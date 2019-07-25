.class Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;
.super Lcom/miui/gallery/ui/BackupTitle$BaseClickListener;
.source "BackupTitle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupTitle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PauseSyncListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BackupTitle;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/BackupTitle;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BackupTitle$BaseClickListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;)V

    return-void
.end method


# virtual methods
.method public onCustomClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupTitle;->showContextMenu()Z

    return-void
.end method
