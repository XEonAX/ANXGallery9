.class final Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;
.super Landroid/os/AsyncTask;
.source "nexAssetService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Landroid/graphics/Bitmap;

.field private d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

.field private e:Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

.field private f:J

.field private g:Lcom/nexstreaming/app/common/util/l;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V
    .locals 3

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->f:J

    new-instance v0, Lcom/nexstreaming/app/common/util/l;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/util/l;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->g:Lcom/nexstreaming/app/common/util/l;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->g:Lcom/nexstreaming/app/common/util/l;

    invoke-virtual {v0}, Lcom/nexstreaming/app/common/util/l;->c()V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->g:Lcom/nexstreaming/app/common/util/l;

    invoke-virtual {v0}, Lcom/nexstreaming/app/common/util/l;->a()V

    const-string v0, "nexAssetService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "InstallTask() called with: context = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "], assetPath = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "], bitmap = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "], assetInfo = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "], callback = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->c:Landroid/graphics/Bitmap;

    iput-object p4, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iput-object p5, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->e:Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

    return-void
.end method

.method private a(Ljava/io/File;Ljava/io/File;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string p3, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unzipping \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\' to \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result p3

    if-nez p3, :cond_1

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Failed to create directory: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    new-instance p3, Ljava/util/zip/ZipInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p3, v4}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    :cond_2
    :goto_1
    :try_start_0
    invoke-virtual {p3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".."

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_6

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Failed to create directory: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p3, v5}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v5}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v6, 0x0

    add-long/2addr v2, v4

    long-to-double v4, v2

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    long-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    double-to-int v4, v4

    const/16 v5, 0x64

    if-lt v4, v5, :cond_5

    const/16 v4, 0x63

    :cond_5
    const/4 v5, 0x0

    :try_start_3
    invoke-direct {p0, v5, v4}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(ZI)V

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-static {v5}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Relative paths not allowed: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_7
    invoke-static {p3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    const-string p3, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unzipping DONE for: \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\' to \'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_1
    move-exception p1

    invoke-static {p3}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw p1
.end method

.method private a(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->e:Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-interface {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;->onInstallFailed(ILjava/lang/String;)V

    const-string v0, "nexAssetService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendCompleted install asset("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v2, v2, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->e:Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v0, v0, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;->onInstallCompleted(I)V

    const-string p1, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendCompleted install asset("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") installed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    :goto_1
    return-void
.end method

.method private a(ZI)V
    .locals 5

    if-nez p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->f:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 p1, 0x1

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->f:J

    const-string p1, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendProgress() asset("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") progress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->e:Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v0, v0, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    const/16 v1, 0x64

    invoke-interface {p1, v0, p2, v1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;->onProgressInstall(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 7

    const-string p1, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installAsset() assetPath = ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(ZI)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v2, v2, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->b(I)Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v2, "nexAssetService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "already installed Asset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v4, v4, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getInstallSourceType()Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;->STORE:Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;

    if-ne v1, v2, :cond_1

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstance(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v2, v2, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v1, v2}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->uninstallPackage(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uninstall fail asset="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->b:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_1
    const-string p1, "nexAssetService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "installed Asset is not store type. idx="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v2, v2, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/io/File;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->b:Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installed Asset is not store type. idx="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    :try_start_1
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->b:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstance(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    move-result-object v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v3, v3, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getUnzipFolder(I)Ljava/io/File;

    move-result-object v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v3, v3, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-direct {p0, v1, v2, v3}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/io/File;Ljava/io/File;I)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->c:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstance(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    move-result-object v1

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->c:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v5, v5, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v1, v4, v5}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->makeThumbnail(Landroid/graphics/Bitmap;I)Ljava/io/File;

    move-result-object v1

    goto :goto_1

    :cond_3
    move-object v1, v3

    :goto_1
    const-string v4, "nexAssetService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "installed Asset idx="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v6, v6, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", sdklevel="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v6, v6, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->asset_sversion:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", version="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v6, v6, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->asset_version:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-static {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v4

    new-instance v5, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$internalStoreAssetInfo;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    invoke-direct {v5, v6}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$internalStoreAssetInfo;-><init>(Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;)V

    invoke-virtual {v4, v2, v1, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/io/File;Ljava/io/File;Lcom/nexstreaming/app/common/nexasset/store/StoreAssetInfo;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    invoke-direct {p0, v3}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unzip or db update fail! asset="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_4
    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected a(Ljava/lang/Boolean;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.nexstreaming.nexeditorsdk.asset.install.completed"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "index"

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "category.alias"

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget-object v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->category_aliasName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->g:Lcom/nexstreaming/app/common/util/l;

    invoke-virtual {p1}, Lcom/nexstreaming/app/common/util/l;->b()V

    const-string p1, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "install asset("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->d:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iget v1, v1, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") time elapsed = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->g:Lcom/nexstreaming/app/common/util/l;

    invoke-virtual {v1}, Lcom/nexstreaming/app/common/util/l;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->a(Ljava/lang/Boolean;)V

    return-void
.end method
