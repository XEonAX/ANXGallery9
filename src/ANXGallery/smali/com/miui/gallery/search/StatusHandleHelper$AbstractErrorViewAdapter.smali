.class public abstract Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;
.super Ljava/lang/Object;
.source "StatusHandleHelper.java"

# interfaces
.implements Lcom/miui/gallery/search/StatusHandleHelper$ErrorViewAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/StatusHandleHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AbstractErrorViewAdapter"
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final mInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method private getInfoSubTitleForStatus(I)Ljava/lang/String;
    .locals 1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    const p1, 0x7f10060c

    goto :goto_0

    :pswitch_1
    const p1, 0x7f100626

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected bindFixActionForStatus(ILandroid/view/View;Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)V
    .locals 0

    const/4 p3, 0x1

    if-eq p1, p3, :cond_1

    const/16 p3, 0xa

    if-eq p1, p3, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    new-instance p1, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$3;-><init>(Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_0
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_1
    new-instance p1, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;-><init>(Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2
    const-string p1, "android.settings.WIFI_SETTINGS"

    goto :goto_0

    :pswitch_3
    const-string p1, "com.miui.gallery.cloud.provider.SYNC_SETTINGS"

    goto :goto_0

    :pswitch_4
    new-instance p1, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$2;-><init>(Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_0
    const/4 p1, 0x4

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1
    const-string p1, "android.settings.SETTINGS"

    :goto_0
    new-instance p3, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$4;

    invoke-direct {p3, p0, p1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$4;-><init>(Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bindInfoView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    const v0, 0x7f0902fa

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getInfoTitleForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setTextIfExist(Landroid/view/View;ILjava/lang/String;)V

    const v0, 0x7f0902c1

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getInfoSubTitleForStatus(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setTextIfExist(Landroid/view/View;ILjava/lang/String;)V

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->shouldShowFixButtonForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Z

    move-result v0

    const v1, 0x7f090134

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setVisibilityIfExist(Landroid/view/View;II)V

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getFixButtonTextForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setTextIfExist(Landroid/view/View;ILjava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    invoke-virtual {p0, p1, v1, v0}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setVisibilityIfExist(Landroid/view/View;II)V

    :goto_0
    const v0, 0x7f09016a

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getIconResForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)I

    move-result v2

    invoke-virtual {p0, p1, v0, v2}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setIconIfExist(Landroid/view/View;II)V

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p2, p1, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->bindFixActionForStatus(ILandroid/view/View;Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)V

    :cond_2
    return-void
.end method

.method public bindLoadingView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Landroid/view/View;
    .locals 5

    invoke-static {p2}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    const v3, 0x7f090232

    const v4, 0x7f09016a

    if-eqz v0, :cond_1

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getIconResForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)I

    move-result p2

    invoke-virtual {p0, p1, v4, p2}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->setIconIfExist(Landroid/view/View;II)V

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_0
    return-object p1
.end method

.method protected getFixButtonTextForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Ljava/lang/String;
    .locals 0

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const/16 p2, 0xc

    if-eq p1, p2, :cond_0

    packed-switch p1, :pswitch_data_0

    const p1, 0x7f100630

    goto :goto_0

    :pswitch_0
    const p1, 0x7f100631

    goto :goto_0

    :pswitch_1
    const p1, 0x7f10060b

    goto :goto_0

    :pswitch_2
    const p1, 0x7f100625

    goto :goto_0

    :cond_0
    const p1, 0x7f100025

    goto :goto_0

    :cond_1
    const p1, 0x7f100632

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getIconResForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FULL_SCREEN:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p2, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const p1, 0x7f070247

    return p1

    :pswitch_0
    const p1, 0x7f070246

    return p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FOOTER:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p2, p1, :cond_1

    const p1, 0x7f070245

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected getInfoItemView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    packed-switch p2, :pswitch_data_0

    iget-object p2, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    const p3, 0x7f0b0143

    invoke-virtual {p2, p3, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :pswitch_0
    iget-object p2, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    const p3, 0x7f0b014b

    invoke-virtual {p2, p3, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected getInfoTitleForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FULL_SCREEN:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    const/4 v1, 0x1

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eq p1, v1, :cond_5

    const/16 v0, 0xa

    if-eq p1, v0, :cond_4

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    if-eqz p2, :cond_1

    const p1, 0x7f100612

    goto :goto_1

    :cond_1
    const p1, 0x7f100613

    goto :goto_1

    :pswitch_0
    const p1, 0x7f100026

    goto :goto_1

    :pswitch_1
    const p1, 0x7f100611

    goto :goto_1

    :pswitch_2
    const p1, 0x7f10062b

    goto :goto_1

    :pswitch_3
    if-eqz p2, :cond_2

    const p1, 0x7f10060a

    goto :goto_1

    :cond_2
    const p1, 0x7f10060d

    goto :goto_1

    :pswitch_4
    if-eqz p2, :cond_3

    const p1, 0x7f100628

    goto :goto_1

    :cond_3
    const p1, 0x7f100627

    goto :goto_1

    :cond_4
    const p1, 0x7f100635

    goto :goto_1

    :cond_5
    if-eqz p2, :cond_6

    const p1, 0x7f10060f

    goto :goto_1

    :cond_6
    const p1, 0x7f100610

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getInfoView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Landroid/view/View;
    .locals 1

    invoke-static {p2}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FULL_SCREEN:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p3, v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getInfoItemView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Landroid/view/View;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method protected getLoadingItemView(Landroid/view/View;)Landroid/view/View;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0b0145

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getLoadingView(Landroid/view/View;ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Landroid/view/View;
    .locals 0

    sget-object p2, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FULL_SCREEN:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p3, p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->getLoadingItemView(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public positionForBaseStatus(I)Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->NONE:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    return-object p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->HEADER:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    return-object p1
.end method

.method public positionForResultStatus(I)Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->NONE:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    return-object p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FOOTER:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    return-object p1
.end method

.method protected setIconIfExist(Landroid/view/View;II)V
    .locals 0

    if-lez p3, :cond_0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    instance-of p2, p1, Landroid/widget/ImageView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_0
    return-void
.end method

.method protected setTextIfExist(Landroid/view/View;ILjava/lang/String;)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    instance-of p2, p1, Landroid/widget/Button;

    if-eqz p2, :cond_1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected setVisibilityIfExist(Landroid/view/View;II)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method protected shouldShowFixButtonForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x1

    return p1

    :pswitch_0
    const/4 p1, 0x0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
