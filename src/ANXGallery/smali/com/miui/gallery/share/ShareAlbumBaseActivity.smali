.class public abstract Lcom/miui/gallery/share/ShareAlbumBaseActivity;
.super Lmiui/preference/PreferenceActivity;
.source "ShareAlbumBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;
    }
.end annotation


# instance fields
.field protected mAlbumId:Ljava/lang/String;

.field protected mAlbumName:Ljava/lang/String;

.field private final mAlbumUserCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field protected mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

.field protected mCreatorId:Ljava/lang/String;

.field mPath:Ljava/lang/String;

.field protected mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

.field protected mSharerCount:I

.field protected mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

.field private final mUserInfoCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/UserInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lmiui/preference/PreferenceActivity;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerCount:I

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$1;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mUserInfoCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$2;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumUserCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    return-void
.end method

.method private handleOrientationConfiguration(Landroid/content/res/Configuration;)V
    .locals 3

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a005a

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060460

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/share/GridPreferenceBase;->setColumnCountAndWidth(II)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0059

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06045f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/share/GridPreferenceBase;->setColumnCountAndWidth(II)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected abstract createShareUserAdapter()Lcom/miui/gallery/share/ShareUserAdapterBase;
.end method

.method protected abstract doSyncFromServer(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method protected abstract getContentView()I
.end method

.method protected getOwnerEntry(Ljava/lang/String;)Lcom/miui/gallery/share/CloudUserCacheEntry;
    .locals 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getBabyInfo()Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v11, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v3, v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumId:Ljava/lang/String;

    const-wide/16 v5, 0x0

    iget-object v7, v1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelation:Ljava/lang/String;

    iget-object v8, v1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelationText:Ljava/lang/String;

    const-string v9, "normal"

    const/4 v10, 0x0

    move-object v2, v11

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v10}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v11

    :cond_0
    new-instance v1, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v13, v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumId:Ljava/lang/String;

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object v12, v1

    move-object/from16 v14, p1

    invoke-direct/range {v12 .. v20}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method protected abstract getPageName()Ljava/lang/String;
.end method

.method protected abstract getPreferencesResourceId()I
.end method

.method protected abstract getShareUsers()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract getUserCache()Lcom/miui/gallery/share/CloudUserCache;
.end method

.method protected initPreferences()V
    .locals 4

    const-string v0, "sharer_grid"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/share/GridPreferenceBase;

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0059

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06045f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/share/GridPreferenceBase;->setColumnCountAndWidth(II)V

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/share/GridPreferenceBase;->setOnItemClickListener(Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->createShareUserAdapter()Lcom/miui/gallery/share/ShareUserAdapterBase;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/GridPreferenceBase;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->handleOrientationConfiguration(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->handleOrientationConfiguration(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "share_path"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mPath:Ljava/lang/String;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "ShareAlbumBaseActivity"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "album path is invalid:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->finish()V

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getContentView()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->setContentView(I)V

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/share/Path;->fromString(Ljava/lang/String;)Lcom/miui/gallery/share/Path;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getDisplayName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumName:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumId:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->isSharerAlbum()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getCreatorId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCreatorId:Ljava/lang/String;

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mCreatorId:Ljava/lang/String;

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getPreferencesResourceId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->addPreferencesFromResource(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->initPreferences()V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerGridPreference:Lcom/miui/gallery/share/GridPreferenceBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/GridPreferenceBase;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_0
    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onDestroy()V

    return-void
.end method

.method public onItemClick(Lcom/miui/gallery/share/GridPreferenceBase;I)V
    .locals 0

    return-void
.end method

.method protected onPause()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumUserCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/CloudUserCache;->removeListener(Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;)V

    invoke-static {}, Lcom/miui/gallery/share/UserInfoCache;->getInstance()Lcom/miui/gallery/share/UserInfoCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mUserInfoCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/UserInfoCache;->removeListener(Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;)V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onPause()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getPageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getPageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getUserCache()Lcom/miui/gallery/share/CloudUserCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumUserCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/CloudUserCache;->addListener(Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;)V

    invoke-static {}, Lcom/miui/gallery/share/UserInfoCache;->getInstance()Lcom/miui/gallery/share/UserInfoCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mUserInfoCacheListener:Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/UserInfoCache;->addListener(Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->updateSharers()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "share_path"

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mPath:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onUpdateProgressChanged(I)V
    .locals 0

    return-void
.end method

.method protected final syncFromServer()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onUpdateProgressChanged(I)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->doSyncFromServer(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method

.method protected updateSharers()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getShareUsers()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mShareUserGridAdapter:Lcom/miui/gallery/share/ShareUserAdapterBase;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->setShareUsers(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->mSharerCount:I

    return-void
.end method
