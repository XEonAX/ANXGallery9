.class public Lcom/miui/gallery/activity/GallerySettingsActivity;
.super Landroid/app/Activity;
.source "GallerySettingsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b008b

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/GallerySettingsActivity;->setContentView(I)V

    return-void
.end method
