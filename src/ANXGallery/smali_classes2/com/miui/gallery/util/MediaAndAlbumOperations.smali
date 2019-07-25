.class public Lcom/miui/gallery/util/MediaAndAlbumOperations;
.super Ljava/lang/Object;
.source "MediaAndAlbumOperations.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;,
        Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;
    }
.end annotation


# direct methods
.method private static addRemoveFavorite(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask;->setOperationCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static varargs addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZZ[J)V
    .locals 10

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "show_copy_or_move"

    invoke-static/range {p7 .. p7}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->hasOtherShareMedia([J)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    if-eqz p3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "show_share_album"

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "show_add_secret"

    move v3, p5

    invoke-virtual {v1, v2, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setArguments(Landroid/os/Bundle;)V

    new-instance v1, Lcom/miui/gallery/util/MediaAndAlbumOperations$6;

    move-object v3, v1

    move-object v4, p0

    move-object v5, p1

    move/from16 v6, p6

    move-object/from16 v7, p7

    move v8, p2

    move v9, p4

    invoke-direct/range {v3 .. v9}, Lcom/miui/gallery/util/MediaAndAlbumOperations$6;-><init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Z[JIZ)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setOnAlbumSelectedListener(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "AddToAlbumDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZ[J)V
    .locals 8

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZZ[J)V

    return-void
.end method

.method public static addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;ZZZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;ZZZ)V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "show_copy_or_move"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p3, "show_share_album"

    const/4 v2, 0x1

    invoke-virtual {v1, p3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p3, "show_add_secret"

    invoke-virtual {v1, p3, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setArguments(Landroid/os/Bundle;)V

    new-instance p3, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;

    invoke-direct {p3, p0, p1, p2, p5}, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;-><init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;Z)V

    invoke-virtual {v0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setOnAlbumSelectedListener(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "AddToAlbumDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs addToFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;

    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1, p2}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;-><init>(II[J)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addRemoveFavorite(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static varargs addToFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;

    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1, p2}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;-><init>(II[Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addRemoveFavorite(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static addToSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/ArrayList;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;Z)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const v2, 0x7f100005

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const/high16 v2, 0x7f0e0000

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const v2, 0x7f1000d6

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const v2, 0x7f1004c3

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/MediaAndAlbumOperations$3;

    invoke-direct {v2, p0, p1, p3, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations$3;-><init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;ZLjava/util/ArrayList;)V

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p2, "ensureSecret"

    invoke-virtual {p1, p0, p2}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs addToSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V
    .locals 4

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const v2, 0x7f100005

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const/high16 v2, 0x7f0e0000

    array-length v3, p3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const v2, 0x7f1000d6

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    const v2, 0x7f1004c3

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;-><init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p2, "ensureSecret"

    invoke-virtual {p1, p0, p2}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;IIZ[J)V
    .locals 10

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/ui/DeletionTask$Param;

    move-object v2, v1

    move-object/from16 v3, p9

    move/from16 v4, p6

    move-wide v5, p3

    move-object v7, p5

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/ui/DeletionTask$Param;-><init>([JIJLjava/lang/String;IZ)V

    invoke-static {v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->newInstance(Lcom/miui/gallery/ui/DeletionTask$Param;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    move-result-object v1

    move-object v2, p2

    invoke-virtual {v1, p2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    move-object v2, p1

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V
    .locals 10

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v9, p8

    invoke-static/range {v0 .. v9}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;IIZ[J)V

    return-void
.end method

.method public static varargs deleteInService(Landroid/content/Context;II[Ljava/lang/String;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/provider/MediaOperationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Lcom/miui/gallery/provider/MediaOperationService;->EXTRA_METHOD:Ljava/lang/String;

    const-string v2, "delete"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "delete_by"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "extra_paths"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string p3, "extra_delete_options"

    invoke-virtual {v1, p3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "extra_delete_reason"

    invoke-virtual {v1, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    sget-object p1, Lcom/miui/gallery/provider/MediaOperationService;->EXTRA_BUNDLE:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static doChangeAutoUpload(Landroid/content/Context;JZ)V
    .locals 8

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-wide/16 v4, 0x1

    const/4 v7, 0x1

    move-object v0, p0

    move-wide v2, p1

    move v6, p3

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/CloudUtils;->updateAlbumAttributes(Landroid/content/Context;Landroid/net/Uri;JJZZ)V

    return-void
.end method

.method public static doChangeShowInOtherAlbums(Landroid/content/Context;JZ)V
    .locals 8

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-wide/16 v4, 0x40

    const/4 v7, 0x1

    move-object v0, p0

    move-wide v2, p1

    move v6, p3

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/CloudUtils;->updateAlbumAttributes(Landroid/content/Context;Landroid/net/Uri;JJZZ)V

    return-void
.end method

.method public static doChangeShowInPhotosTab(Landroid/content/Context;JZ)V
    .locals 8

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-wide/16 v4, 0x4

    const/4 v7, 0x1

    move-object v0, p0

    move-wide v2, p1

    move v6, p3

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/CloudUtils;->updateAlbumAttributes(Landroid/content/Context;Landroid/net/Uri;JJZZ)V

    return-void
.end method

.method public static doForceTop(Landroid/content/Context;JZ)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    if-eqz p3, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/provider/CloudUtils;->forceTop(Landroid/content/Context;Landroid/net/Uri;[J)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/provider/CloudUtils;->unforceTop(Landroid/content/Context;Landroid/net/Uri;[J)V

    :goto_0
    return-void
.end method

.method public static doHideOrUnhide(Landroid/content/Context;JZ)V
    .locals 8

    const/4 v0, 0x1

    new-array v3, v0, [J

    const/4 v0, 0x0

    aput-wide p1, v3, v0

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-wide/16 v4, 0x10

    const/4 v7, 0x1

    move-object v1, p0

    move v6, p3

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/provider/CloudUtils;->updateAlbumAttributes(Landroid/content/Context;Landroid/net/Uri;[JJZZ)V

    return-void
.end method

.method public static doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;-><init>()V

    new-instance v1, Lcom/miui/gallery/util/MediaAndAlbumOperations$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations$2;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->setOnOperationSelectedListener(Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "ProduceCreationDialog"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private static hasOtherShareMedia([J)Z
    .locals 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static varargs removeFromFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;

    const/4 v0, 0x2

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1, p2}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;-><init>(II[J)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addRemoveFavorite(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static varargs removeFromFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;

    const/4 v0, 0x2

    invoke-direct {p0, v0, v0, p2}, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;-><init>(II[Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addRemoveFavorite(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static varargs removeFromSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "show_copy_or_move"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "show_share_album"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "show_add_secret"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setArguments(Landroid/os/Bundle;)V

    new-instance v1, Lcom/miui/gallery/util/MediaAndAlbumOperations$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations$4;-><init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->setOnAlbumSelectedListener(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "AddToAlbumDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
