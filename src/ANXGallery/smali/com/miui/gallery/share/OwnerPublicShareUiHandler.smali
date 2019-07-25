.class public Lcom/miui/gallery/share/OwnerPublicShareUiHandler;
.super Lcom/miui/gallery/share/PublicShareUiHandler;
.source "OwnerPublicShareUiHandler.java"


# static fields
.field private static CLICK_PUBLIC_INTERNAL:J = 0xea60L

.field private static CLICK_PUBLIC_LIMIT:J = 0xaL

.field private static sClickTimes:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

.field private mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/share/PublicShareUiHandler;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Lcom/miui/gallery/share/PublishProgressPreference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    return-object p0
.end method

.method private canClickPublic()Z
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    const/4 v3, 0x1

    if-nez v2, :cond_0

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    sput-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return v3

    :cond_0
    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    int-to-long v4, v2

    sget-wide v6, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->CLICK_PUBLIC_LIMIT:J

    cmp-long v2, v4, v6

    if-gez v2, :cond_1

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return v3

    :cond_1
    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v4, v0, v4

    sget-wide v6, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->CLICK_PUBLIC_INTERNAL:J

    cmp-long v2, v4, v6

    if-lez v2, :cond_2

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return v3

    :cond_2
    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v4, v0, v4

    sget-wide v6, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->CLICK_PUBLIC_INTERNAL:J

    cmp-long v2, v4, v6

    if-gtz v2, :cond_3

    sget-object v2, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v0, v4

    if-ltz v2, :cond_3

    sget-object v0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    int-to-long v0, v0

    sget-wide v4, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->CLICK_PUBLIC_LIMIT:J

    cmp-long v2, v0, v4

    if-ltz v2, :cond_3

    const/4 v0, 0x0

    return v0

    :cond_3
    sget-object v0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->sClickTimes:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    return v3
.end method

.method private tryToChangePublicStatus()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->canClickPublic()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    const v0, 0x7f1004f3

    invoke-static {v0}, Lcom/miui/gallery/share/UIHelper;->toast(I)V

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    xor-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    if-nez v0, :cond_3

    new-instance v0, Lcom/miui/gallery/share/PublishProgressPreference;

    iget-object v2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    invoke-direct {v0, v2}, Lcom/miui/gallery/share/PublishProgressPreference;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object v2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mProgressPreference:Lcom/miui/gallery/share/PublishProgressPreference;

    iget-object v2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/share/PublishProgressPreference;->setProgress(ZZ)V

    new-instance v0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;-><init>(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)V

    iget-object v1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mAlbumId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->changePublicStatusAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method protected initPreferences()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/share/PublicShareUiHandler;->initPreferences()V

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const-string v1, "open_public_share"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    return-void
.end method

.method onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 0

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string p2, "open_public_share"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->tryToChangePublicStatus()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected final requestPublicUrl(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    invoke-static {p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestPublicUrlForOwnerAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    return-object p1
.end method

.method updateStatus()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mAlbumId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->isPublic()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getPublicUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    iget-object v1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->isPublic()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mOpenPublicPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :goto_0
    return-void
.end method
