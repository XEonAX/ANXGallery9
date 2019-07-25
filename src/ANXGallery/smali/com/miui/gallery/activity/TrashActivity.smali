.class public Lcom/miui/gallery/activity/TrashActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "TrashActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0176

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/TrashActivity;->setContentView(I)V

    return-void
.end method
