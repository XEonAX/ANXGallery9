.class public abstract Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;
.super Lcom/miui/gallery/share/ShareAlbumBaseActivity;
.source "ShareAlbumOwnerBaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;
    }
.end annotation


# instance fields
.field protected mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private mFutureSms:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private mObserver:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;-><init>()V

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mObserver:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->tryToCreateCloudItem()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;ILcom/miui/gallery/share/CloudUserCacheEntry;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->addSharer(ILcom/miui/gallery/share/CloudUserCacheEntry;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->kickUser(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mObserver:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;

    return-object p0
.end method

.method private addSharer(ILcom/miui/gallery/share/CloudUserCacheEntry;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;I)V

    invoke-virtual {p0, p2, v0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->requestInvitation(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method

.method private kickUser(Ljava/lang/String;)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$5;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V

    const v1, 0x7f100441

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p0, v2, v1, v3}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object v1

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {p1, v2, v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->kickSharersAsync(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private tryToCreateCloudItem()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->tryToCreateCloudAlbumAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;

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

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/share/CloudUserCache;->syncFromServer(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    :cond_0
    return-void
.end method

.method protected getShareUsers()Ljava/util/List;
    .locals 3
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

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/share/CloudUserCache;->getCloudUserListByAlbumId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;

    invoke-direct {v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v0
.end method

.method protected getUserCache()Lcom/miui/gallery/share/CloudUserCache;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/share/CloudUserCache;->getOwnerUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const p1, 0x7f090269

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->tryToCreateCloudItem()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateStatus()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mObserver:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureSms:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureSms:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onDestroy()V

    return-void
.end method

.method public onItemClick(Lcom/miui/gallery/share/GridPreferenceBase;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    invoke-virtual {p1}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getCount()I

    move-result p1

    if-lt p2, p1, :cond_0

    goto :goto_2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getItem(I)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p2, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mServerStatus:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p2, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mServerStatus:Ljava/lang/String;

    const-string v0, "normal"

    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCreatorId:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    const p1, 0x7f1000d9

    invoke-static {p1}, Lcom/miui/gallery/share/UIHelper;->toast(I)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->showKickUserDialog(Lcom/miui/gallery/share/CloudUserCacheEntry;)V

    goto :goto_1

    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->showAddSharerDialog(Lcom/miui/gallery/share/CloudUserCacheEntry;)V

    :cond_4
    :goto_1
    return-void

    :cond_5
    :goto_2
    return-void
.end method

.method protected requestInvitation(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method protected requestInvitation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;)V"
        }
    .end annotation

    const v0, 0x7f1005f8

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f1005f7

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object v8

    iget-object v2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestInvitationForSmsAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureSms:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method protected showAddSharerDialog(Lcom/miui/gallery/share/CloudUserCacheEntry;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getInstance()Lcom/miui/gallery/share/PhoneShareAlbumProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getAddSharerDialogItemsLength()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->addSharer(ILcom/miui/gallery/share/CloudUserCacheEntry;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getInstance()Lcom/miui/gallery/share/PhoneShareAlbumProvider;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$2;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;Lcom/miui/gallery/share/CloudUserCacheEntry;)V

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->showAddSharerDialog(Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method protected showKickUserDialog(Lcom/miui/gallery/share/CloudUserCacheEntry;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getInstance()Lcom/miui/gallery/share/PhoneShareAlbumProvider;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$4;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;Lcom/miui/gallery/share/CloudUserCacheEntry;)V

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->showKickUserDialog(Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method protected updateSharers()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->updateSharers()V

    return-void
.end method

.method protected updateStatus()V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    const v1, 0x7f0902b9

    const v2, 0x102000a

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateSharers()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->syncFromServer()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;

    const v1, 0x7f090269

    const v2, 0x7f0901b4

    const v5, 0x7f0901b2

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mFutureCreateItem:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, v5}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f1006c0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v5}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f1003a2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method
