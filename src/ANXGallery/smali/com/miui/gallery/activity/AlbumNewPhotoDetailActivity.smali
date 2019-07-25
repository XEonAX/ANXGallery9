.class public Lcom/miui/gallery/activity/AlbumNewPhotoDetailActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "AlbumNewPhotoDetailActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getContentId()I
    .locals 1

    const v0, 0x7f0b0011

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/AlbumNewPhotoDetailActivity;->getContentId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/AlbumNewPhotoDetailActivity;->setContentView(I)V

    return-void
.end method
