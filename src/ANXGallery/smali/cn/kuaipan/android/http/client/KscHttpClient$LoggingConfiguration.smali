.class Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;
.super Ljava/lang/Object;
.source "KscHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/http/client/KscHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoggingConfiguration"
.end annotation


# instance fields
.field private final level:I

.field private final tag:Ljava/lang/String;


# direct methods
.method static synthetic access$500(Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;)Z
    .locals 0

    invoke-direct {p0}, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->isLoggable()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->println(Ljava/lang/String;)V

    return-void
.end method

.method private isLoggable()Z
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->tag:Ljava/lang/String;

    iget v1, p0, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->level:I

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private println(Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->level:I

    iget-object v1, p0, Lcn/kuaipan/android/http/client/KscHttpClient$LoggingConfiguration;->tag:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    return-void
.end method
