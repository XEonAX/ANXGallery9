.class public Lcom/miui/gallery/search/GallerySearchSettingsActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "GallerySearchSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mRequestView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private configByStatus(I)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    const v0, 0x7f10062e

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    const v0, 0x7f10062c

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    const v0, 0x7f10062d

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090266

    if-ne p1, v0, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "cloud_guide_source"

    sget-object v1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SEARCH:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setLocalSearchStatus(Landroid/content/Context;Z)V

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->configByStatus(I)V

    const-string p1, "search"

    const-string v0, "search_open_switch"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b014c

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->setContentView(I)V

    const p1, 0x7f090266

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->mRequestView:Landroid/widget/TextView;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->getOpenApiSearchStatus()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/GallerySearchSettingsActivity;->configByStatus(I)V

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const-string p1, "GallerySearchSettingsActivity"

    invoke-static {p1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->requestOpenCloudControlSearch(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onPause()V

    const-string v0, "search_settings"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    const-string v0, "search_settings"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
