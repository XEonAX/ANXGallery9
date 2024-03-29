.class Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;
.super Ljava/lang/Object;
.source "SendNotificationUtilForSharedBabyAlbum.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SendNotificationRunnable"
.end annotation


# instance fields
.field private mAlbumId:Ljava/lang/String;

.field private mAlbumLocalId:J

.field private mIsOtherShared:Z

.field private mName:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->this$0:Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumId:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public run()V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f10007c

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mIsOtherShared:Z

    iget-wide v3, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumLocalId:J

    long-to-int v3, v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/NotificationHelper;->getBabyAlbumNotificationId(ZI)I

    move-result v2

    iget-boolean v3, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mIsOtherShared:Z

    if-eqz v3, :cond_0

    iget-wide v3, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumLocalId:J

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareAlbumManager;->getUniformAlbumId(J)J

    move-result-wide v3

    :goto_0
    move-wide v4, v3

    goto :goto_1

    :cond_0
    iget-wide v3, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumLocalId:J

    goto :goto_0

    :goto_1
    iget-object v6, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mName:Ljava/lang/String;

    iget-boolean v7, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mIsOtherShared:Z

    const/4 v3, 0x0

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/cloud/CloudUtils;->sendBabyAlbumNewPhotoNotification(Landroid/content/Context;Ljava/lang/String;ILandroid/net/Uri;JLjava/lang/String;Z)V

    return-void
.end method

.method public setPathAndName(Ljava/lang/String;ZJLjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumId:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mIsOtherShared:Z

    iput-wide p3, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mAlbumLocalId:J

    iput-object p5, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->mName:Ljava/lang/String;

    return-void
.end method
