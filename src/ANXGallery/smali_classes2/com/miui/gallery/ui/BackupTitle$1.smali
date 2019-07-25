.class Lcom/miui/gallery/ui/BackupTitle$1;
.super Ljava/lang/Object;
.source "BackupTitle.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupTitle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BackupTitle;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BackupTitle;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$1;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle$1;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/BackupTitle;->access$100(Lcom/miui/gallery/ui/BackupTitle;I)Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$200(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I

    move-result v1

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$1;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$200(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    mul-int/lit8 v0, v0, 0x3c

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    const-string v2, "BackupTitle"

    const-string v3, "pause %d hours"

    invoke-static {p1}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$200(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$1;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/SyncUtil;->pauseSync(Landroid/content/Context;J)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method
