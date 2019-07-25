.class public Lcom/miui/gallery/activity/CloudSpaceStatusActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "CloudSpaceStatusActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected allowUseOnOffline()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b004e

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/CloudSpaceStatusActivity;->setContentView(I)V

    return-void
.end method
