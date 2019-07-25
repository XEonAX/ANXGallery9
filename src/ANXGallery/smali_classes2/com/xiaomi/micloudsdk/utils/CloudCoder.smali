.class public Lcom/xiaomi/micloudsdk/utils/CloudCoder;
.super Ljava/lang/Object;
.source "CloudCoder.java"


# static fields
.field private static sServerDateOffset:J


# direct methods
.method public static generateNonce()Ljava/lang/String;
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/xiaomi/micloudsdk/utils/CloudCoder;->sServerDateOffset:J

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Lcom/xiaomi/micloudsdk/utils/CloudCoder;->generateNonce(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateNonce(J)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/utils/Coder;->generateNonce(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static generateSignature(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p0, p1, p2, p3}, Lcom/xiaomi/micloudsdk/utils/Coder;->generateSignature(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static setServerDateOffset(J)V
    .locals 0

    sput-wide p0, Lcom/xiaomi/micloudsdk/utils/CloudCoder;->sServerDateOffset:J

    return-void
.end method
