.class public Lcn/kuaipan/android/utils/ApiDataHelper;
.super Ljava/lang/Object;
.source "ApiDataHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/kuaipan/android/utils/ApiDataHelper$IKscData;
    }
.end annotation


# direct methods
.method public static asNumber(Ljava/lang/Object;Ljava/lang/Number;)Ljava/lang/Number;
    .locals 2

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_1

    check-cast p0, Ljava/lang/Number;

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p0, p1

    goto :goto_0

    :catch_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static asString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "DataMap can\'t be null when parse."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static contentToMap(Lcn/kuaipan/android/http/KscHttpResponse;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcn/kuaipan/android/http/KscHttpResponse;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const v0, 0x7a50b

    const v1, 0x7a509

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Landroid/util/MalformedJsonException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v3, :cond_1

    :try_start_1
    invoke-static {v3}, Lcn/kuaipan/android/utils/JsonUtils;->parser(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4
    :try_end_1
    .catch Landroid/util/MalformedJsonException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_0

    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    return-object v2

    :cond_0
    :try_start_3
    new-instance v2, Lcn/kuaipan/android/exception/KscException;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v0, v4}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw v2

    :cond_1
    new-instance v2, Lcn/kuaipan/android/exception/KscException;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v4}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw v2
    :try_end_3
    .catch Landroid/util/MalformedJsonException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p0

    move-object v2, v3

    goto :goto_4

    :catch_1
    move-exception v1

    move-object v2, v3

    goto :goto_0

    :catch_2
    move-exception v0

    move-object v2, v3

    goto :goto_1

    :catch_3
    move-exception v0

    move-object v2, v3

    goto :goto_2

    :catch_4
    move-exception v0

    move-object v2, v3

    goto :goto_3

    :catchall_1
    move-exception p0

    goto :goto_4

    :catch_5
    move-exception v1

    :goto_0
    :try_start_4
    new-instance v3, Lcn/kuaipan/android/exception/KscException;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, v0, p0, v1}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :catch_6
    move-exception v0

    :goto_1
    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p0

    throw p0

    :catch_7
    move-exception v0

    :goto_2
    new-instance v3, Lcn/kuaipan/android/exception/KscException;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, v1, p0, v0}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :catch_8
    move-exception v0

    :goto_3
    new-instance v3, Lcn/kuaipan/android/exception/KscException;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, v1, p0, v0}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_4
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_9

    :catch_9
    throw p0
.end method
