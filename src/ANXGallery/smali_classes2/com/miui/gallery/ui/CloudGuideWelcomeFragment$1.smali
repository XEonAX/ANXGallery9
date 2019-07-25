.class Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;
.super Ljava/lang/Object;
.source "CloudGuideWelcomeFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/activity/CloudGuideAutoBackupActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "autobackup_album_id"

    iget-object v1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "autobackup_album_id"

    const-wide/16 v3, -0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v0, "cloud_guide_source"

    iget-object v1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->access$000(Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;)Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;

    const/16 v1, 0x20

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
