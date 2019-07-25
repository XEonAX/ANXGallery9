.class public Lcom/miui/gallery/provider/cache/CacheUtils;
.super Ljava/lang/Object;
.source "CacheUtils.java"


# direct methods
.method public static columnEquals(Lcom/miui/gallery/provider/cache/CacheItem;Lcom/miui/gallery/provider/cache/CacheItem;I)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_6

    if-nez p1, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-interface {p0, p2}, Lcom/miui/gallery/provider/cache/CacheItem;->getType(I)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    invoke-interface {p0, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Byte;

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Byte;

    invoke-static {p0, p1}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_1
    invoke-interface {p0, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0

    :pswitch_2
    invoke-interface {p0, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;Ljava/lang/Number;)Z

    move-result p0

    return p0

    :pswitch_3
    invoke-interface {p0, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p0, Ljava/lang/Long;

    if-eqz p2, :cond_3

    check-cast p0, Ljava/lang/Long;

    instance-of p2, p1, Ljava/lang/Long;

    if-eqz p2, :cond_2

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    goto :goto_0

    :cond_2
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long p1, p1

    :goto_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;J)Z

    move-result p0

    return p0

    :cond_3
    check-cast p0, Ljava/lang/Integer;

    instance-of p2, p1, Ljava/lang/Long;

    if-eqz p2, :cond_4

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    goto :goto_1

    :cond_4
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long p1, p1

    :goto_1
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;J)Z

    move-result p0

    return p0

    :pswitch_4
    invoke-interface {p1, p2}, Lcom/miui/gallery/provider/cache/CacheItem;->getType(I)I

    move-result p0

    if-nez p0, :cond_5

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :goto_2
    return v0

    :cond_6
    :goto_3
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
