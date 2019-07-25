.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->showNetworkMeteredDialog()V
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

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->finish()V

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    return-void
.end method
