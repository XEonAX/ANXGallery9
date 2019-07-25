.class public Lcom/miui/gallery/util/NotificationHelper;
.super Ljava/lang/Object;
.source "NotificationHelper.java"


# direct methods
.method private static addNotificationChannel(Landroid/content/Context;I)V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    new-instance p1, Landroid/app/NotificationChannel;

    const-string v0, "com.miui.gallery.default"

    const v1, 0x7f1000f8

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-direct {p1, v0, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    goto :goto_0

    :pswitch_1
    new-instance p1, Landroid/app/NotificationChannel;

    const-string v0, "com.miui.gallery.low"

    const v1, 0x7f1000f9

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-direct {p1, v0, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    goto :goto_0

    :pswitch_2
    new-instance p1, Landroid/app/NotificationChannel;

    const-string v0, "com.miui.gallery.MIN"

    const v1, 0x7f1000fa

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p1, v0, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    :goto_0
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/NotificationManager;->getNotificationChannels()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getBabyAlbumNotificationId(ZI)I
    .locals 1

    const v0, 0x186a0

    if-eqz p0, :cond_0

    const p0, 0x30d40

    rem-int/2addr p1, v0

    add-int/2addr p1, p0

    return p1

    :cond_0
    rem-int/2addr p1, v0

    add-int/2addr p1, v0

    return p1
.end method

.method public static getEmptyNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 3

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/miui/gallery/util/NotificationHelper;->addNotificationChannel(Landroid/content/Context;I)V

    const-string p0, "com.miui.gallery.MIN"

    invoke-virtual {v0, p0}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    :cond_0
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method public static getPushNotificationId(I)I
    .locals 1

    const v0, 0x186a0

    rem-int/2addr p0, v0

    const v0, 0x493e0

    add-int/2addr p0, v0

    return p0
.end method

.method public static setDefaultChannel(Landroid/content/Context;Landroid/app/Notification$Builder;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    const/4 v0, 0x3

    invoke-static {p0, v0}, Lcom/miui/gallery/util/NotificationHelper;->addNotificationChannel(Landroid/content/Context;I)V

    const-string p0, "com.miui.gallery.default"

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    :cond_0
    return-void
.end method

.method public static setLowChannel(Landroid/content/Context;Landroid/app/Notification$Builder;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/miui/gallery/util/NotificationHelper;->addNotificationChannel(Landroid/content/Context;I)V

    const-string p0, "com.miui.gallery.low"

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    :cond_0
    return-void
.end method
