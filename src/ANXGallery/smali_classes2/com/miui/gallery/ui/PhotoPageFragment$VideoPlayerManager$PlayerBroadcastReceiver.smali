.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlayerBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.miui.gallery.action.VIDEO_PLAYER_STARTED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const-string p1, "VideoPlayerManager"

    const-string p2, "onReceive VideoPlayer started"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-static {p1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$8100(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)V

    goto/16 :goto_1

    :cond_1
    const-string v1, "com.miui.gallery.action.VIDEO_PLAYER_RETURN"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "VideoPlayerManager"

    const-string v1, "onReceive VideoPlayer return"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "action_bar_visible"

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-static {v3, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$8200(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$8100(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)V

    const-string v0, "seek_time"

    const-wide/16 v3, -0x1

    invoke-virtual {p2, v0, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    const-string v0, "relative_index"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    if-eqz p2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v3

    add-int/2addr v3, p2

    invoke-virtual {v0, v3, v2}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->prepareFinish(Landroid/content/Context;)V

    goto :goto_0

    :cond_3
    const-wide/16 v5, 0x0

    cmp-long p2, v3, v5

    if-ltz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object p2

    if-eqz p2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object p1

    invoke-virtual {p1, v3, v4, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->seekTo(JZ)V

    goto :goto_0

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->prepareFinish(Landroid/content/Context;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$8302(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)Z

    :cond_5
    :goto_1
    return-void
.end method
