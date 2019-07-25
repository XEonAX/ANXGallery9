.class public Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;
.super Ljava/lang/Object;
.source "SearchFeedbackHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;,
        Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;,
        Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;,
        Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;
    }
.end annotation


# static fields
.field private static CAN_USE_CACHE:Z = false

.field private static final LANGUAGE_CH:Ljava/lang/String; = "cn"

.field private static final LANGUAGE_EH:Ljava/lang/String; = "en"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportFalseImages(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;IZ)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->getFeedbackResultText(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;IZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static addFeedbackReportedTag(Ljava/lang/String;)V
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->getFeedbackReportedTags()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->setFeedbackReportedTags(Ljava/lang/String;)V

    return-void
.end method

.method private static getFeedbackDialogText(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$2;->$SwitchMap$com$miui$gallery$search$feedback$SearchFeedbackHelper$FeedbackType:[I

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid feedback type "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const p2, 0x7f100617

    goto :goto_0

    :pswitch_1
    const p2, 0x7f100619

    :goto_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getFeedbackResultText(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;IZ)Ljava/lang/String;
    .locals 2

    if-lez p3, :cond_2

    sget-object v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$2;->$SwitchMap$com$miui$gallery$search$feedback$SearchFeedbackHelper$FeedbackType:[I

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid feedback type "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    if-eqz p4, :cond_0

    const p2, 0x7f0e0042

    goto :goto_0

    :cond_0
    const p2, 0x7f0e0044

    goto :goto_0

    :pswitch_1
    if-eqz p4, :cond_1

    const p2, 0x7f0e0043

    goto :goto_0

    :cond_1
    const p2, 0x7f0e0045

    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/4 p4, 0x2

    new-array p4, p4, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p4, v0

    const/4 v0, 0x1

    aput-object p1, p4, v0

    invoke-virtual {p0, p2, p3, p4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_2
    sget-object p1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$2;->$SwitchMap$com$miui$gallery$search$feedback$SearchFeedbackHelper$FeedbackType:[I

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->ordinal()I

    move-result p3

    aget p1, p1, p3

    packed-switch p1, :pswitch_data_1

    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid feedback type "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_2
    const p1, 0x7f100614

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :pswitch_3
    const p1, 0x7f100615

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public static getFeedbackTaskInfo()Landroid/os/Bundle;
    .locals 6

    invoke-static {}, Lcom/miui/gallery/search/utils/SearchUtils;->getXiaomiId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "SearchFeedbackHelper"

    const-string v2, "Not logged in!"

    invoke-static {v0, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "SearchFeedbackHelper"

    const-string v2, "Cloud privacy agreement denied"

    invoke-static {v0, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    new-instance v2, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    invoke-direct {v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Search;->getSearchFeedbackUrlHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setQueryPathPrefix(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v2

    invoke-static {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getDefaultUserPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserId(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    const-string v2, "tag/feedback/task/num"

    invoke-virtual {v0, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setQueryAppendPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    const-class v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setResultDataType(Ljava/lang/reflect/Type;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    sget-boolean v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->CAN_USE_CACHE:Z

    invoke-virtual {v0, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUseCache(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    array-length v3, v2

    if-lez v3, :cond_3

    const/4 v3, 0x0

    aget-object v4, v2, v3

    instance-of v4, v4, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;

    if-eqz v4, :cond_3

    aget-object v2, v2, v3

    check-cast v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v4, "need_handle_image_num"

    iget v5, v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;->needHandleImageNum:I

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "finish_image_num"

    iget v5, v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;->finishImageNum:I

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v4, v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;->awardInfo:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "task_award_info"

    iget-object v2, v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackTaskResponseData;->awardInfo:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    const-wide/32 v4, 0x493e0

    invoke-virtual {v0, v4, v5}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->setCacheExpires(J)Lcom/miui/gallery/net/base/BaseRequest;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->CAN_USE_CACHE:Z
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    const-string v2, "SearchFeedbackHelper"

    const-string v3, "Querying feedback info failed, %s"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    const-string v0, "SearchFeedbackHelper"

    const-string v2, "Empty feedback task info"

    invoke-static {v0, v2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static goToFeedbackPolicyPage(Landroid/app/Activity;)V
    .locals 4

    const-string v0, "https://i.mi.com/static2?filename=MicloudWebBill/event/gallery/privacy/%s.html"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "zh"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->LANGUAGE_CH:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->LANGUAGE_EH:Ljava/lang/String;

    :goto_0
    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->goToHybridPage(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private static goToHybridPage(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Common;->URI_HYBRID_PAGE:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;)V

    return-void
.end method

.method private static hasReportedTag(Ljava/lang/String;)Z
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->getFeedbackReportedTags()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static needToQueryLikelyImagesForFeedbackTask(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->hasReportedTag(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static reportFalseImages(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;",
            "Z)I"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    if-eqz p1, :cond_4

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/search/utils/SearchUtils;->getXiaomiId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "SearchFeedbackHelper"

    const-string p1, "Not logged in!"

    invoke-static {p0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v5, v2, 0xa

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-interface {p1, v2, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p0, v2, p2, p3}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportFalseImagesBatch(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I

    move-result v2

    add-int/2addr v3, v2

    move v2, v4

    goto :goto_0

    :cond_2
    if-lez v3, :cond_3

    sput-boolean v1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->CAN_USE_CACHE:Z

    sget-object p1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->FALSE_NEGATIVE:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {p0}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->addFeedbackReportedTag(Ljava/lang/String;)V

    :cond_3
    return v3

    :cond_4
    :goto_1
    const-string p0, "SearchFeedbackHelper"

    const-string p1, "Invalid false image params!"

    invoke-static {p0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method

.method private static reportFalseImagesBatch(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Z)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;",
            "Z)I"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p0, "SearchFeedbackHelper"

    const-string p1, "Cloud privacy agreement denied"

    invoke-static {p0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const-string v2, ","

    invoke-static {v2, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "SearchFeedbackHelper"

    const-string v4, "Reporting false image info [%s: %s: %s]"

    invoke-static {v3, v4, p3, p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    invoke-direct {p2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Search;->getSearchFeedbackUrlHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setQueryPathPrefix(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p2

    const-string v3, "tag/feedback"

    invoke-virtual {p2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setQueryAppendPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p2

    invoke-static {p0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getDefaultUserPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p2

    const/16 v3, 0x3ea

    invoke-virtual {p2, v3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setMethod(I)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserId(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    const-class p2, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setResultDataType(Ljava/lang/reflect/Type;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    const-string p2, "feedbackType"

    invoke-virtual {p3}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->getValue()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    const-string p2, "tagName"

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    const-string p1, "imageIds"

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    const-string p1, "isDonate"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    move-result-object p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->executeSync()[Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    array-length p1, p0

    if-lez p1, :cond_1

    aget-object p1, p0, v1

    instance-of p1, p1, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;

    if-eqz p1, :cond_1

    aget-object p0, p0, v1

    check-cast p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;

    iget-object p1, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;->failureImageIds:Ljava/util/Set;

    if-eqz p1, :cond_1

    const-string p1, "SearchFeedbackHelper"

    const-string p2, "[%s] report failed!"

    iget-object p3, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;->failureImageIds:Ljava/util/Set;

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackReportResponseData;->failureImageIds:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    sub-int/2addr v0, p0

    return v0

    :cond_1
    const-string p0, "SearchFeedbackHelper"

    const-string p1, "Done report batch!"

    invoke-static {p0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception p0

    const-string p1, "SearchFeedbackHelper"

    const-string p2, "On report batch error! %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method

.method public static reportFalseNegativeImages(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;",
            ")V"
        }
    .end annotation

    sget-object v4, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->FALSE_NEGATIVE:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportInDialog(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V

    return-void
.end method

.method public static reportFalsePositiveImages(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;",
            ")V"
        }
    .end annotation

    sget-object v4, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;->FALSE_POSITIVE:Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportInDialog(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V

    return-void
.end method

.method private static reportInDialog(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;",
            "Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;",
            ")V"
        }
    .end annotation

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-nez p2, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->supportFeedbackTask()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const v1, 0x7f100616

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    :cond_1
    invoke-static {p0, p1, p4}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->getFeedbackDialogText(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p2

    const v1, 0x7f1004c3

    new-instance v8, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;

    move-object v2, v8

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p0

    move-object v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$1;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$FeedbackType;Landroid/app/Activity;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V

    invoke-virtual {p2, v1, v8}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x7f1000d6

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    :try_start_0
    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Lmiui/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "SearchFeedbackHelper"

    const-string p2, "Ignore exception: %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static supportFeedbackTask()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "search-feedback-task"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
