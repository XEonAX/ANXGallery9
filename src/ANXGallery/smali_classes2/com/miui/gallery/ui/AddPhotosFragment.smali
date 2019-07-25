.class public Lcom/miui/gallery/ui/AddPhotosFragment;
.super Landroid/app/Fragment;
.source "AddPhotosFragment.java"


# instance fields
.field private mAlbumId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/AddPhotosFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/AddPhotosFragment;->mAlbumId:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AddPhotosFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->recordCopyMoveAction(Z)V

    return-void
.end method

.method public static addPhotos(Landroid/app/Fragment;J)V
    .locals 3

    invoke-virtual {p0}, Landroid/app/Fragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    new-instance v0, Lcom/miui/gallery/ui/AddPhotosFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddPhotosFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_album_id"

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const-string p1, "AddPhotosFragment"

    invoke-virtual {p0, v0, p1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method private doAddPhotos([J)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-direct {v1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;-><init>()V

    new-instance v2, Lcom/miui/gallery/ui/AddPhotosFragment$1;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/ui/AddPhotosFragment$1;-><init>(Lcom/miui/gallery/ui/AddPhotosFragment;[J)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->setOnOperationSelectedListener(Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;)V

    invoke-virtual {v0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "CopyOrMoveDialog"

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "AddPhotosFragment"

    const-string v0, "Add photo show CopyOrMoveDialog fail,Do copy operation for default!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->recordCopyMoveAction(Z)V

    :goto_0
    return-void
.end method

.method private pickPhotos()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "pick-upper-bound"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "pick-need-id"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/AddPhotosFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private recordCopyMoveAction(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "move"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "from"

    const-string v1, "AddPhotosFragment"

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "organize_photos"

    const-string v1, "move_or_copy"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private setResult(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x21

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v1, p1, v2}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_0

    const-string v2, "key_album_id"

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    goto :goto_0

    :cond_0
    move-wide v2, v0

    :goto_0
    iput-wide v2, p0, Lcom/miui/gallery/ui/AddPhotosFragment;->mAlbumId:J

    iget-wide v2, p0, Lcom/miui/gallery/ui/AddPhotosFragment;->mAlbumId:J

    cmp-long p1, v2, v0

    if-nez p1, :cond_1

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->setResult(I)V

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->pickPhotos()V

    :goto_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    const/4 p1, -0x1

    const/4 v0, 0x0

    if-ne p2, p1, :cond_3

    if-eqz p3, :cond_3

    const-string p2, "pick-result-data"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    new-array p3, p3, [J

    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    aput-wide v1, p3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddPhotosFragment;->doAddPhotos([J)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->setResult(I)V

    goto :goto_2

    :cond_2
    :goto_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AddPhotosFragment;->setResult(I)V

    return-void

    :cond_3
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AddPhotosFragment;->setResult(I)V

    :goto_2
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p1
.end method
