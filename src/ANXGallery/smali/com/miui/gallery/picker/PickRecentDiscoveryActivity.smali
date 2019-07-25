.class public Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;
.super Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;
.source "PickRecentDiscoveryActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    if-nez p1, :cond_0

    return-void

    :cond_0
    const p1, 0x7f0b0116

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090042

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    iput-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "album_id"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    const-string v0, "album_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    cmp-long v0, v3, v1

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->finish()V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->setItemStateListener(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryActivity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method
