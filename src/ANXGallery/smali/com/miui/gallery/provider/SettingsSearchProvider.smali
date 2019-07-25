.class public Lcom/miui/gallery/provider/SettingsSearchProvider;
.super Landroid/content/ContentProvider;
.source "SettingsSearchProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;,
        Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s?region=%s&lang=%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {}, Lcom/miui/settings/Settings;->getRegion()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x2

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public prepareData()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f10008d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v2

    const-string v4, ";"

    invoke-static {v4, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setKeywords(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->useNewAIAlbumSwitch()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f100029

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f100027

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setKeywords(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f10006f

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f10031c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f10031e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    new-instance v2, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f100320

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v2

    const-string v4, ";"

    invoke-static {v4, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setKeywords(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f10042a

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f100403

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f100053

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f100678

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f10067e

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isCloudTrashBinFeatureOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f1006f6

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f1006f7

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setKeywords(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setIntentAction(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/request/HostManager;->getTrashBinUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setUriString(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    new-instance v1, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f100706

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setIntentAction(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setIntentTargetPackage(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->URL_MIUI_PRIVACY_POLICY:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider;->getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->setUriString(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1

    new-instance p1, Landroid/database/MatrixCursor;

    sget-object p2, Lcom/miui/gallery/provider/SettingsSearchContract;->SEARCH_RESULT_COLUMNS:[Ljava/lang/String;

    invoke-direct {p1, p2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/SettingsSearchProvider;->prepareData()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    invoke-virtual {p1}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    const-string p5, "title"

    iget-object v0, p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->title:Ljava/lang/String;

    invoke-virtual {p4, p5, v0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    const-string p5, "keywords"

    iget-object v0, p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->keywords:Ljava/lang/String;

    invoke-virtual {p4, p5, v0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    const-string p5, "intentAction"

    iget-object v0, p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->intentAction:Ljava/lang/String;

    invoke-virtual {p4, p5, v0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    const-string p5, "intentTargetPackage"

    iget-object v0, p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->intentTargetPackage:Ljava/lang/String;

    invoke-virtual {p4, p5, v0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    const-string p5, "uriString"

    iget-object p3, p3, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->uriString:Ljava/lang/String;

    invoke-virtual {p4, p5, p3}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
