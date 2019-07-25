.class public Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;
.super Ljava/lang/Object;
.source "SendNotificationUtilForSharedBabyAlbum.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;,
        Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SingletonHolder;
    }
.end annotation


# instance fields
.field protected final SEND_NOTIFICATION_INTERVAL:I

.field protected mNotificationRunnableList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x927c0

    iput v0, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->SEND_NOTIFICATION_INTERVAL:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->mNotificationRunnableList:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;-><init>()V

    return-void
.end method

.method public static final getInstance()Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SingletonHolder;->access$100()Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;

    move-result-object v0

    return-object v0
.end method

.method private getUniformAlbumLocalId(JZ)J
    .locals 0

    if-eqz p3, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/ShareAlbumManager;->getUniformAlbumId(J)J

    move-result-wide p1

    :cond_0
    return-wide p1
.end method


# virtual methods
.method public sendNotification(Ljava/lang/String;JLjava/lang/String;ZJ)V
    .locals 7

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->mNotificationRunnableList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->mNotificationRunnableList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;

    invoke-static {v1}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->access$200(Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->mNotificationRunnableList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;-><init>(Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;)V

    move-object v1, v0

    move-object v2, p1

    move v3, p5

    move-wide v4, p2

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum$SendNotificationRunnable;->setPathAndName(Ljava/lang/String;ZJLjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->mNotificationRunnableList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    invoke-direct {p0, p2, p3, p5}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->getUniformAlbumLocalId(JZ)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getMinServerTagOfNewPhoto(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_3

    invoke-direct {p0, p2, p3, p5}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->getUniformAlbumLocalId(JZ)J

    move-result-wide p1

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->saveMinServerTagOfNewPhoto(JLjava/lang/Long;)V

    :cond_3
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    const-wide/32 p2, 0x927c0

    invoke-virtual {p1, v0, p2, p3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
