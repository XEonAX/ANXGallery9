.class public abstract Lcom/miui/gallery/share/PublicShareUiHandler;
.super Ljava/lang/Object;
.source "PublicShareUiHandler.java"


# instance fields
.field protected mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

.field protected mAlbumId:Ljava/lang/String;

.field private mAlbumName:Ljava/lang/String;

.field protected mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

.field protected mFuturePublic:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field protected mPublicPreference:Landroid/preference/PreferenceCategory;

.field private mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

.field private mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

.field protected mSharersPreference:Landroid/preference/PreferenceCategory;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/share/PublicShareUiHandler$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/PublicShareUiHandler$1;-><init>(Lcom/miui/gallery/share/PublicShareUiHandler;)V

    iput-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    iput-object p2, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mAlbumName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/share/PublicShareUiHandler;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/PublicShareUiHandler;->updateProgressBarDirectly(I)V

    return-void
.end method

.method private sendPublicPreference(Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    invoke-static {}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getInstance()Lcom/miui/gallery/share/PhoneShareAlbumProvider;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    iget-object v3, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mAlbumName:Ljava/lang/String;

    const-string v4, ""

    const/4 v6, 0x1

    move-object v5, p1

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getShareUrlIntent(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->setIntent(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method private updateProgressBarDirectly(I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    const v0, 0x7f100456

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->setSummary(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->setSummary(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method


# virtual methods
.method initPreferences()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const-string v1, "sharers"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, ""

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const v3, 0x7f100036

    invoke-virtual {v1, v3, v2}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const-string v1, "public_share"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const-string v1, "send_public_url"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_0
    return-void
.end method

.method protected abstract requestPublicUrl(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
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
.end method

.method updateProgressBar(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    if-eq p1, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/share/PublicShareUiHandler;->updateProgressBarDirectly(I)V

    :goto_0
    return-void
.end method

.method protected updatePublicPreference(ZLjava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    if-eqz p1, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/share/PublicShareUiHandler;->sendPublicPreference(Ljava/lang/String;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/share/DescriptPreference;

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/share/DescriptPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    const-string v0, "public_url_descript"

    invoke-virtual {p1, v0}, Lcom/miui/gallery/share/DescriptPreference;->setKey(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    const v0, 0x7f1005b8

    invoke-virtual {p1, v0}, Lcom/miui/gallery/share/DescriptPreference;->setDescriptTitle(I)V

    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/share/DescriptPreference;->setDescriptDetail(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/share/DescriptPreference;->setDescriptDetailVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    new-instance v0, Lcom/miui/gallery/share/PublicShareUiHandler$2;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/share/PublicShareUiHandler$2;-><init>(Lcom/miui/gallery/share/PublicShareUiHandler;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/share/DescriptPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    const-string p2, "public_url_descript"

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object p2, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object p2, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSendPublicUrlPreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object p2, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mPublicUrlDescriptPreference:Lcom/miui/gallery/share/DescriptPreference;

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    :cond_5
    :goto_0
    return-void
.end method

.method updateSharers(I)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x1

    const v2, 0x7f100036

    if-lez p1, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    new-array v1, v1, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v0

    invoke-virtual {v4, v2, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mSharersPreference:Landroid/preference/PreferenceCategory;

    iget-object v3, p0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    new-array v1, v1, [Ljava/lang/Object;

    const-string v4, ""

    aput-object v4, v1, v0

    invoke-virtual {v3, v2, v1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method
