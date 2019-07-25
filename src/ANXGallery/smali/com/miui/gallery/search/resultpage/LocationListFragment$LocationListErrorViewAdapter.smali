.class Lcom/miui/gallery/search/resultpage/LocationListFragment$LocationListErrorViewAdapter;
.super Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;
.source "LocationListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/LocationListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LocationListErrorViewAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/LocationListFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/resultpage/LocationListFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/LocationListFragment$LocationListErrorViewAdapter;->this$0:Lcom/miui/gallery/search/resultpage/LocationListFragment;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected getIconResForStatus(ILcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)I
    .locals 0

    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FULL_SCREEN:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p2, p1, :cond_0

    const p1, 0x7f070107

    return p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;->FOOTER:Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;

    if-ne p2, p1, :cond_1

    const p1, 0x7f070245

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
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
    const v0, 0x7f1005a2

    if-eq p1, v1, :cond_6

    const/16 v1, 0xa

    if-eq p1, v1, :cond_5

    const/16 v1, 0xd

    if-eq p1, v1, :cond_4

    packed-switch p1, :pswitch_data_0

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const v0, 0x7f100613

    goto :goto_1

    :pswitch_0
    if-eqz p2, :cond_2

    goto :goto_1

    :cond_2
    const v0, 0x7f10060d

    goto :goto_1

    :pswitch_1
    if-eqz p2, :cond_3

    goto :goto_1

    :cond_3
    const v0, 0x7f100627

    goto :goto_1

    :cond_4
    const v0, 0x7f100026

    goto :goto_1

    :cond_5
    const v0, 0x7f100635

    goto :goto_1

    :cond_6
    if-eqz p2, :cond_7

    goto :goto_1

    :cond_7
    const v0, 0x7f100610

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/LocationListFragment$LocationListErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
