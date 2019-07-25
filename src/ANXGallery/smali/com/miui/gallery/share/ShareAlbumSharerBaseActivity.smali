.class public abstract Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;
.super Lcom/miui/gallery/share/ShareAlbumBaseActivity;
.source "ShareAlbumSharerBaseActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/miui/gallery/share/CloudShareAlbumMediator$OnShareAlbumExitedListener;


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mViewExitShare:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;-><init>()V

    return-void
.end method

.method public static exitShare(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;

    invoke-direct {v0, p0, p2, p3}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, p3, v1

    const p2, 0x7f10037e

    invoke-virtual {p0, p2, p3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-static {p0, p3, p2, v1}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object p2

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const p0, 0x7f100048

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$3;

    invoke-direct {v1, p1, v0, p2}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$3;-><init>(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    const p1, 0x7f10037a

    invoke-virtual {p0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    invoke-virtual {p0, p1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method protected doSyncFromServer(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/share/CloudUserCache;->syncFromServer(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method

.method protected getContentView()I
    .locals 1

    const v0, 0x7f0b0159

    return v0
.end method

.method protected getShareUsers()Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/share/CloudUserCache;->getCloudUserListByAlbumId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;

    invoke-direct {v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mCreatorId:Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v6, v5, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    invoke-static {v6, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    invoke-static {v6, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    move-object v3, v5

    goto :goto_0

    :cond_2
    const/4 v11, 0x0

    if-eqz v3, :cond_3

    invoke-interface {v0, v11, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_3
    new-instance v12, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mAlbumId:Ljava/lang/String;

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, v12

    invoke-direct/range {v2 .. v10}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v11, v12}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :goto_1
    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->getOwnerEntry(Ljava/lang/String;)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-object v0
.end method

.method protected getUserCache()Lcom/miui/gallery/share/CloudUserCache;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/share/CloudUserCache;->getSharerUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090107

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mAlbumName:Ljava/lang/String;

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$1;-><init>(Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;)V

    invoke-static {p0, p1, v0, v1}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->exitShare(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid view id, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->finish()V

    return-void

    :cond_1
    const p1, 0x7f090107

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mViewExitShare:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mViewExitShare:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->syncFromServer()V

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->mHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/miui/gallery/share/CloudShareAlbumMediator;->getInstance()Lcom/miui/gallery/share/CloudShareAlbumMediator;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/share/CloudShareAlbumMediator;->addListener(Lcom/miui/gallery/share/CloudShareAlbumMediator$OnShareAlbumExitedListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onDestroy()V

    invoke-static {}, Lcom/miui/gallery/share/CloudShareAlbumMediator;->getInstance()Lcom/miui/gallery/share/CloudShareAlbumMediator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/share/CloudShareAlbumMediator;->removeListener(Lcom/miui/gallery/share/CloudShareAlbumMediator$OnShareAlbumExitedListener;)V

    return-void
.end method
