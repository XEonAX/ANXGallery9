.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/menu/ImmersionMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;
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

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const v0, 0x7f0901c2

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object v1, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    const v2, 0x7f1006b4

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->add(ILjava/lang/CharSequence;)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->isDeletable()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f0901c1

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object v1, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$5000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    const v2, 0x7f1006b3

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->add(ILjava/lang/CharSequence;)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    :cond_1
    return-void
.end method

.method public onImmersionMenuSelected(Lcom/miui/gallery/widget/menu/ImmersionMenu;Lcom/miui/gallery/widget/menu/ImmersionMenuItem;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$5100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getItemId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$5200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$5300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0901c1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
