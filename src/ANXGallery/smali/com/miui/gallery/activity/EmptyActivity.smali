.class public Lcom/miui/gallery/activity/EmptyActivity;
.super Lcom/miui/gallery/app/Activity;
.source "EmptyActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0073

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/EmptyActivity;->setContentView(I)V

    return-void
.end method
