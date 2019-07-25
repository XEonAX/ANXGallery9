.class public Lcom/miui/gallery/util/baby/FindFace2CreateBabyAlbum;
.super Ljava/lang/Object;
.source "FindFace2CreateBabyAlbum.java"


# direct methods
.method public static createBabyAlbumAndSaveBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 5

    invoke-virtual {p2, p0, p1, p3}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->createBabyAlbumAndAddItems(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p3

    new-instance v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    invoke-virtual {v0, p4}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->setFaceId(Ljava/lang/String;)Z

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getServerId()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p1, p4, p2, p3, v0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->saveInfo2Db(Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    invoke-static {p0}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->recordBabyAlbumHasShortcut(Ljava/lang/String;)V

    return-void
.end method

.method public static gotoBabyAlbumInfoPage(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Lcom/miui/gallery/cloud/baby/BabyInfo;JLandroid/graphics/Bitmap;Z)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    if-eqz p6, :cond_0

    const-class p6, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    goto :goto_0

    :cond_0
    const-class p6, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    :goto_0
    invoke-direct {v0, p0, p6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance p6, Landroid/os/Bundle;

    invoke-direct {p6}, Landroid/os/Bundle;-><init>()V

    const-string v1, "baby_info"

    invoke-virtual {p6, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p2, "babyAlbumLocalId"

    invoke-virtual {p6, p2, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    if-eqz p1, :cond_1

    const-string p2, "thumbnail_info_of_baby"

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_1
    if-eqz p5, :cond_2

    const-string p1, "face_bitmap"

    invoke-virtual {p6, p1, p5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_2
    invoke-virtual {v0, p6}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 p1, 0xc

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static gotoFillBabyAlbumInfo(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 5

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "faceAlbumLocalId"

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "faceAlbumCoverFaceServerId"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string p2, "faceAlbumServerId"

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getServerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "name"

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getCurrentYearMonthDay(J)[I

    move-result-object p1

    const/4 p2, 0x0

    aget p2, p1, p2

    const/4 v2, 0x1

    aget v2, p1, v2

    const/4 v3, 0x2

    aget p1, p1, v3

    invoke-static {p2, v2, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->combine2Birthday(III)Ljava/lang/String;

    move-result-object p1

    const-string p2, "birthday"

    invoke-virtual {v1, p2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 p1, 0xd

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
