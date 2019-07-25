.class public Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
.super Ljava/lang/Object;
.source "AssetPackageReader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$b;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$d;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$e;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$g;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$LocalPathNotAvailableException;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptedException;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;
    }
.end annotation


# static fields
.field private static h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;",
            ">;>;"
        }
    .end annotation
.end field

.field private static i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

.field private final b:Lcom/google/gson_nex/Gson;

.field private final c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

.field private final d:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

.field private final e:Ljava/lang/String;

.field private final f:Z

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/f;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

.field private k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->h:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/gson_nex/Gson;

    invoke-direct {v0}, Lcom/google/gson_nex/Gson;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->g:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    const-string v1, "AssetPackageReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NEW APR Instance (Container:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ") baseId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " shared="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->e:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->f:Z

    invoke-direct {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->h()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

    move-result-object p2

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->d:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->d:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

    invoke-direct {p0, p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;)Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

    move-result-object p2

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->j:Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->j:Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

    if-eqz p2, :cond_0

    new-instance p2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$d;

    iget-object p3, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->j:Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

    invoke-direct {p2, p1, p3, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$d;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    :cond_0
    invoke-direct {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    return-void
.end method

.method static synthetic a(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;->a()V

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->h:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "assets:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    new-instance v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$b;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-direct {v4, p0, v0, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$b;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    invoke-direct {v2, v4, p2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    const-string p0, "file:"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    new-instance v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$e;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v4, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$e;-><init>(Ljava/io/File;Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    invoke-direct {v2, p0, p2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    const-string p0, "zipfile:"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    new-instance v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$g;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$g;-><init>(Ljava/io/File;)V

    invoke-direct {v2, p0, p2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    :goto_0
    sget-object p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->h:Ljava/util/Map;

    new-instance p2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;

    invoke-direct {p2, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$a;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;)V

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v2

    :cond_3
    new-instance p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    invoke-direct {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>()V

    throw p0
.end method

.method public static a(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$b;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$b;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    const/4 p0, 0x0

    invoke-direct {v0, v1, p2, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static a(Ljava/io/File;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$g;

    invoke-direct {v1, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$g;-><init>(Ljava/io/File;)V

    const/4 p0, 0x0

    invoke-direct {v0, v1, p1, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    return-object v0
.end method

.method private a(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;)Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;
        }
    .end annotation

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->provider:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->provider:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    iget-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->provider:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->psd:Ljava/lang/String;

    invoke-interface {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;->a(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    const-string v0, "invalid provider"

    invoke-direct {p1, p0, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method static synthetic a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;)V
    .locals 3

    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;->a()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_2

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "provider already registered"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "id already in use :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "id is null or empty"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a()[Ljava/lang/String;
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;->b()[Ljava/lang/String;

    move-result-object v2

    array-length v4, v2

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v2, v3

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v4, v3, 0x1

    aput-object v2, v1, v3

    move v3, v4

    goto :goto_1

    :cond_2
    return-object v1
.end method

.method public static b(Ljava/io/File;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$e;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$e;-><init>(Ljava/io/File;Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    const/4 p0, 0x0

    invoke-direct {v0, v1, p1, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;Ljava/lang/String;Z)V

    return-object v0
.end method

.method private static b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, ".."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/.."

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/SecurityException;

    const-string p1, "Parent Path References Not Allowed"

    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static b(Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;->a()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->i:Ljava/util/Map;

    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;->a()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
.end method

.method private e(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "/_info.json"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    add-int/lit8 v5, v4, 0x1

    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v6, -0x1

    if-eq v2, v6, :cond_d

    if-eq v4, v6, :cond_d

    if-eq v0, v6, :cond_1

    goto/16 :goto_3

    :cond_1
    const-string v0, "merge/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v1

    :cond_2
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->values()[Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v0

    array-length v6, v0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v6, :cond_4

    aget-object v9, v0, v8

    invoke-virtual {v9}, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v11, v2, :cond_3

    invoke-virtual {p1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    goto :goto_1

    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_4
    move-object v9, v1

    :goto_1
    if-nez v9, :cond_5

    const-string p1, "AssetPackageReader"

    const-string v0, "Unrecognized item category"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_5
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :try_start_0
    iget-object v3, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v3, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v4, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const-class v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;

    invoke-virtual {v4, v5, v6}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;

    if-eqz v4, :cond_7

    iget-object v5, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    if-eqz v5, :cond_7

    iget-object v5, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-lez v5, :cond_7

    iget-object v5, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    iget-object v10, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    iget-object v5, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    iget-object v5, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    invoke-interface {v5, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_7
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    iget-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->filename:Ljava/lang/String;

    if-eqz v3, :cond_c

    iget-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->icon:Ljava/lang/String;

    if-nez v3, :cond_8

    const-string v3, "_icon.svg"

    iput-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->icon:Ljava/lang/String;

    :cond_8
    iget-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->thumbnail:Ljava/lang/String;

    if-nez v3, :cond_9

    const-string v3, "_thumb.jpeg"

    iput-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->thumbnail:Ljava/lang/String;

    :cond_9
    iget-object v3, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->id:Ljava/lang/String;

    if-nez v3, :cond_a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->e:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".items."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->id:Ljava/lang/String;

    :cond_a
    iget-object v0, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->type:Ljava/lang/String;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->fromId(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v0

    if-eqz v0, :cond_b

    new-instance p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;

    invoke-direct {p1, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$1;)V

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->a:Ljava/lang/Class;

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->c()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->b:Ljava/lang/String;

    iget-object v1, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->filename:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->c:Ljava/lang/String;

    iget-object v1, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->icon:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->d:Ljava/lang/String;

    iget-object v1, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->thumbnail:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->e:Ljava/lang/String;

    iget-object v1, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->id:Ljava/lang/String;

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->f:Ljava/lang/String;

    iget-object v1, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->label:Ljava/util/Map;

    iput-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->h:Ljava/util/Map;

    iput-object v0, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->i:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    iput-object v9, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->j:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    iget-object v0, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->sampleText:Ljava/lang/String;

    iput-object v0, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->g:Ljava/lang/String;

    iget-boolean v0, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->hidden:Z

    iput-boolean v0, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$f;->k:Z

    return-object p1

    :cond_b
    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized item type \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\' for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw v0

    :cond_c
    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missing base file for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v0
    :try_end_3
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception p1

    const-string v0, "AssetPackageReader"

    const-string v2, "Item in index but missing in package"

    invoke-static {v0, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSON Syntax Error in: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_d
    :goto_3
    const-string p1, "AssetPackageReader"

    const-string v0, "Malformed path"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method

.method private h()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    const-string v2, "e.json"

    invoke-interface {v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const-class v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

    invoke-virtual {v2, v3, v4}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;

    const-string v3, "AssetPackageReader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Parse e.json file! : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->provider:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " / "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$EncryptionInfoJSON;->psd:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v0, v2

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v1

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    :goto_0
    invoke-static {v1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw v0

    :catch_0
    move-object v1, v0

    :catch_1
    invoke-static {v1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    :goto_1
    return-object v0
.end method

.method private i()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "AssetPackageReader"

    const-string v1, "readPackageInfo IN"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    const-string v1, "packageinfo.json"

    invoke-interface {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const-class v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    invoke-virtual {v1, v2, v3}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    const-string v2, "AssetPackageReader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "readPackageInfo(), asset name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    invoke-interface {v2, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_2 .. :try_end_2} :catch_0

    iget v0, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->minVersionCode:I

    const/4 v2, 0x6

    if-gt v0, v2, :cond_4

    iget-object v0, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->format:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->format:Ljava/lang/String;

    const-string v2, "com.kinemaster.assetpackage"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "AssetPackageReader"

    const-string v2, "readPackageInfo OUT"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported package format: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->format:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "AssetPackageReader"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported package format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->format:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw v0

    :cond_3
    const-string v0, "AssetPackageReader"

    const-string v1, "Missing package format"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    const-string v1, "Missing package format"

    invoke-direct {v0, p0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported package format version: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->minVersionCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AssetPackageReader"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    const-string v1, "Unsupported package format version"

    invoke-direct {v0, p0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "AssetPackageReader"

    const-string v2, "PackageInfoJSON file : packageinfo.json"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    const-string v2, "PackageInfoJSON file: packageinfo.json"

    invoke-direct {v1, p0, v2, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    const-string v1, "AssetPackageReader"

    const-string v2, "Package missing file: packageinfo.json"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;

    const-string v2, "Package missing file: packageinfo.json"

    invoke-direct {v1, p0, v2, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageReaderException;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private j()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->g:Ljava/util/List;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget-object v1, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->itemRoots:Ljava/util/List;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget-object v1, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->itemRoots:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    const-string v1, "AssetPackageReader"

    const-string v2, "makeItemList: using root index"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget-object v1, v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->itemRoots:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const-string v3, "_info.json"

    invoke-static {v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->e(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const-string v1, "AssetPackageReader"

    const-string v2, "makeItemList: no root index; scanning entire package"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_5

    goto :goto_1

    :cond_5
    invoke-direct {p0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->e(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_6
    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->g:Ljava/util/List;

    return-void
.end method

.method private k()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {p1, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/i;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move-object v3, v2

    :goto_0
    if-eqz v1, :cond_2

    const-string v4, "_info.json"

    invoke-static {v1, v4}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :try_start_1
    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v5, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const-class v7, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;

    invoke-virtual {v5, v6, v7}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v5, :cond_1

    invoke-static {v4}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v3, v5

    goto :goto_3

    :cond_1
    invoke-static {v4}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v3, v5

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v4, v2

    :goto_1
    invoke-static {v4}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw p1

    :catch_1
    move-object v4, v2

    :catch_2
    invoke-static {v4}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    :goto_2
    invoke-static {v1}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    :goto_3
    if-eqz v3, :cond_6

    iget-object v2, v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->mergePaths:Ljava/util/List;

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->mergePaths:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :catch_3
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_3

    const-string v4, "merge"

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/nexstreaming/app/common/util/i;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    invoke-static {v3, v1}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :try_start_3
    iget-object v4, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v4, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    if-nez v5, :cond_5

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    :cond_5
    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->k:Ljava/util/Map;

    invoke-interface {v5, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    return-object v4

    :cond_6
    throw v0
.end method

.method public b()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget v0, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->packageContentVersion:I

    return v0
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/nexstreaming/app/common/util/i;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    if-eqz v0, :cond_2

    const-string v3, "_info.json"

    invoke-static {v0, v3}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :try_start_0
    iget-object v4, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v4, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v4, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->b:Lcom/google/gson_nex/Gson;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const-class v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;

    invoke-virtual {v4, v5, v6}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_1

    invoke-static {v3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v2, v4

    goto :goto_3

    :cond_1
    invoke-static {v3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v2, v4

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v3, v1

    :goto_1
    invoke-static {v3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw p1

    :catch_0
    move-object v3, v1

    :catch_1
    invoke-static {v3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    :goto_2
    invoke-static {v0}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    :goto_3
    if-eqz v2, :cond_6

    iget-object v3, v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->mergePaths:Ljava/util/List;

    if-eqz v3, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v2, v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$ItemInfoJSON;->mergePaths:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_3

    const-string v4, "merge"

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/nexstreaming/app/common/util/i;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    invoke-static {v3, v0}, Lcom/nexstreaming/app/common/util/i;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    if-nez v1, :cond_5

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    :cond_5
    const-string v1, "AssetPackageReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getFilePath mergePath : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->l:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_6
    return-object v1
.end method

.method public c()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget v0, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->minVersionCode:I

    return v0
.end method

.method public c(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$LocalPathNotAvailableException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->b(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->f:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->b()V

    return-void
.end method

.method public d(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$LocalPathNotAvailableException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->c(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public d()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/f;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->j()V

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->g:Ljava/util/List;

    return-object v0
.end method

.method public e()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;

    iget-object v0, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$PackageInfoJSON;->assetName:Ljava/util/Map;

    return-object v0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public g()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader$c;->d()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
