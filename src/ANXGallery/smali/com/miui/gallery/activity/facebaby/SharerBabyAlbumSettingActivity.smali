.class public Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;
.super Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;
.source "SharerBabyAlbumSettingActivity.java"


# instance fields
.field private mAccountName:Ljava/lang/String;

.field private mAlbumId:Ljava/lang/String;

.field private mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

.field private mSelfRelationText:Ljava/lang/String;

.field private mSyncFuture:Lcom/miui/gallery/threadpool/Future;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->getBabyInfoFromDB()Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->getSelfRelationText()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->syncShareInfoFromServer()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSelfRelationText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSelfRelationText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->refreshSelfRelationText(Z)V

    return-void
.end method

.method private getBabyInfoFromDB()Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 6

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const-string v1, "babyInfoJson"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-instance v5, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$6;

    invoke-direct {v5, p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$6;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/baby/BabyInfo;

    return-object v0
.end method

.method private getEntry(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    aget-object v1, p2, v0

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    aget-object p1, p3, v0

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getSelfRelationText()Ljava/lang/String;
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumByLocalId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAlbumId:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAccountName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAccountName:Ljava/lang/String;

    :cond_1
    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_USER_URI:Landroid/net/Uri;

    const-string v0, "relationText"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v2

    const-string v0, "%s=? AND %s=?"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "albumId"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string v5, "userId"

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-array v4, v3, [Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAlbumId:Ljava/lang/String;

    aput-object v3, v4, v6

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAccountName:Ljava/lang/String;

    aput-object v3, v4, v7

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$4;

    invoke-direct {v6, p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$4;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V

    move-object v3, v0

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private refreshSelfRelationText(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$2;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V

    new-instance v2, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private syncShareInfoFromServer()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x1

    new-instance v2, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$5;

    invoke-direct {v2, p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$5;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/share/AlbumShareUIManager;->syncUserListForAlbumAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSyncFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method


# virtual methods
.method protected getIntentToAutoUploadPage()Landroid/content/Intent;
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntentToAutoUploadPage()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "allow_to_reassociate"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method protected getPreferenceResourceId()I
    .locals 1

    const v0, 0x7f140008

    return v0
.end method

.method protected justSaveInfo2DbByJson()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mHaveSaveBabyInfo:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->saveBabyInfo()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    if-ne p2, p1, :cond_1

    if-eqz p3, :cond_1

    const-string p1, "baby-info"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-object p2, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    iget-boolean p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mIsAutoupdate:Ljava/lang/Boolean;

    const-string p1, "associate_people_face_local_id"

    const-wide/16 v0, -0x1

    invoke-virtual {p3, p1, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mFaceAlbumLocalId:Ljava/lang/Long;

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->refreshSelfRelationText(Z)V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRefreshFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSyncFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSyncFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSyncFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onPause()V

    const-string v0, "album_baby_share_setting"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->saveBabyInfo()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onResume()V

    const-string v0, "album_baby_share_setting"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method protected saveBabyInfo()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->babyInfoChanged()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;-><init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Lcom/miui/gallery/cloud/baby/BabyInfo;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "baby-info"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 v0, 0xc

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->setResult(ILandroid/content/Intent;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mHaveSaveBabyInfo:Z

    return-void
.end method

.method protected setPreferencesValue()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->setPreferencesValue()V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBabyNicknamePre:Landroid/preference/Preference;

    check-cast v0, Lmiui/preference/ValuePreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    check-cast v0, Lmiui/preference/ValuePreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSex:Ljava/lang/String;

    const v2, 0x7f020002

    const v3, 0x7f020001

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->getEntry(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast v0, Lmiui/preference/ValuePreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mSelfRelationText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mChooseDate:Landroid/preference/Preference;

    check-cast v0, Lmiui/preference/ValuePreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    return-void
.end method
