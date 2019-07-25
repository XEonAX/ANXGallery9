.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$1;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->inflateTitle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$1;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$1;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    return-void
.end method
