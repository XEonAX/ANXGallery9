.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$8100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const p2, 0x7f100598

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    return-void
.end method
