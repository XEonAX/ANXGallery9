.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$6;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->deleteCard()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$6;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$6;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/CardManager;->delete(Lcom/miui/gallery/card/Card;Z)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    const-string v0, "userDelete"

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method
