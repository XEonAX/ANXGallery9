.class public Lcom/miui/gallery/ui/DiscoveryBar;
.super Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;
.source "DiscoveryBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mDiscoveryMessageClicked:Z

.field private mDiscoveryMessageShown:Z

.field private mMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation
.end field

.field private mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;-><init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V

    return-void
.end method

.method private autoShowBar()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method private bindImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 2

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v1, p2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2, p1, p3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method private bindView(Ljava/lang/String;[Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/PanelItemLayout;->setTitle(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/PanelItemLayout;->clearDetails()V

    if-eqz p2, :cond_1

    array-length p1, p2

    if-lez p1, :cond_1

    const/4 p1, 0x0

    :goto_1
    array-length v0, p2

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    const v1, 0x7f0b00ad

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/PanelItemLayout;->addDetail(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {v1, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    aget-object v0, p2, p1

    invoke-direct {p0, v1, v0, p3}, Lcom/miui/gallery/ui/DiscoveryBar;->bindImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method private ensureView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/PanelItemLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/PanelItemLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method private formatMessageClickTime(J)Ljava/lang/String;
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p1

    const-wide/32 p1, 0xea60

    div-long/2addr v0, p1

    const-wide/16 p1, 0x1

    cmp-long v2, v0, p1

    if-gez v2, :cond_0

    const-string p1, "< 1 minute"

    return-object p1

    :cond_0
    const-wide/16 p1, 0x3

    cmp-long v2, v0, p1

    if-gtz v2, :cond_1

    const-string p1, "1-3 minutes"

    return-object p1

    :cond_1
    const-wide/16 p1, 0xa

    cmp-long v2, v0, p1

    if-gtz v2, :cond_2

    const-string p1, "4-10 minutes"

    return-object p1

    :cond_2
    const-string p1, "> 10 minutes"

    return-object p1
.end method

.method private getFirstMessage()Lcom/miui/gallery/model/DiscoveryMessage;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mMessages:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mMessages:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/model/DiscoveryMessage;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private recordMessageClickStatus()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mDiscoveryMessageShown:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "is_message_clicked"

    iget-boolean v2, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mDiscoveryMessageClicked:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "quickly_discovery"

    const-string v2, "quickly_discovery_message_click_status"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private recordMessageClickedTime(Lcom/miui/gallery/model/DiscoveryMessage;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "message_click_time"

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getUpdateTime()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/ui/DiscoveryBar;->formatMessageClickTime(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "quickly_discovery"

    const-string v1, "quickly_discovery_message_click_time"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public getView()Landroid/view/View;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PanelItemLayout;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->getFirstMessage()Lcom/miui/gallery/model/DiscoveryMessage;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getActionUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getType()I

    move-result v3

    if-ne v3, v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "source"

    const-string v4, "home_page"

    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    :cond_1
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "DiscoveryBar"

    const-string v3, "Wrong intent action uri: %s"

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getActionUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->markAsReadAsync(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DiscoveryBar;->recordMessageClickedTime(Lcom/miui/gallery/model/DiscoveryMessage;)V

    iput-boolean v0, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mDiscoveryMessageClicked:Z

    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->recordMessageClickStatus()V

    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public setMessage(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mMessages:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/DiscoveryMessage;

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessageDetail()Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    move-result-object p1

    instance-of v2, p1, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    invoke-virtual {p1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->getThumbUrls()[Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/ui/DiscoveryBar;->bindView(Ljava/lang/String;[Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelManager:Lcom/miui/gallery/widget/PanelManager;

    invoke-direct {p0}, Lcom/miui/gallery/ui/DiscoveryBar;->autoShowBar()Z

    move-result v0

    invoke-interface {p1, p0, v0}, Lcom/miui/gallery/widget/PanelManager;->addItem(Lcom/miui/gallery/widget/PanelItem;Z)Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mDiscoveryMessageShown:Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/DiscoveryBar;->mPanelManager:Lcom/miui/gallery/widget/PanelManager;

    invoke-interface {p1, p0, v1}, Lcom/miui/gallery/widget/PanelManager;->removeItem(Lcom/miui/gallery/widget/PanelItem;Z)Z

    :goto_0
    return-void
.end method
