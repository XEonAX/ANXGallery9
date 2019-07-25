.class Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;
.super Ljava/lang/ref/WeakReference;
.source "AssetPackageReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference<",
        "Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;",
        ">;"
    }
.end annotation


# static fields
.field private static a:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private b:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->a:Ljava/lang/ref/ReferenceQueue;

    return-void
.end method

.method public constructor <init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;)V
    .locals 1

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->a:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p0, p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-static {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->b:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    return-void
.end method

.method static synthetic a()V
    .locals 0

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->b()V

    return-void
.end method

.method private static b()V
    .locals 4

    :cond_0
    :goto_0
    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->a:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;

    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->b:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->b:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->b()V

    const-string v1, "AssetPackageReader"

    const-string v2, "Closed cached container reader"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v2, "AssetPackageReader"

    const-string v3, "Error closing container reader"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->b:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    goto :goto_0

    :cond_1
    return-void
.end method
