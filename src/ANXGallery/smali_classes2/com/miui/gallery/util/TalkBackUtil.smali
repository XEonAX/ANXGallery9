.class public Lcom/miui/gallery/util/TalkBackUtil;
.super Ljava/lang/Object;
.source "TalkBackUtil.java"


# direct methods
.method public static getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_1

    if-nez p4, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p4}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p4

    invoke-static {p0, p1, p2, p3, p4}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Z)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/miui/gallery/data/LocationManager;->generateTitleLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/16 v0, 0x3ae

    invoke-static {p1, p2, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_2

    if-eqz p4, :cond_1

    const p2, 0x7f10077c

    goto :goto_0

    :cond_1
    const p2, 0x7f10042c

    :goto_0
    const/4 p4, 0x2

    new-array p4, p4, [Ljava/lang/Object;

    aput-object p1, p4, v1

    aput-object p3, p4, v0

    invoke-virtual {p0, p2, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    if-eqz p4, :cond_3

    const p2, 0x7f10077b

    goto :goto_1

    :cond_3
    const p2, 0x7f10042b

    :goto_1
    new-array p3, v0, [Ljava/lang/Object;

    aput-object p1, p3, v1

    invoke-virtual {p0, p2, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method
