.class public Lcom/miui/gallery/module/CacheRepository;
.super Lmiui/module/Repository;
.source "CacheRepository.java"


# instance fields
.field private mAppStoreRepo:Lmiui/module/appstore/AppStoreRepository;

.field private mFolder:Ljava/io/File;

.field private mLocalOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    invoke-direct {p0}, Lmiui/module/Repository;-><init>()V

    new-instance v0, Lmiui/module/appstore/AppStoreRepository;

    invoke-direct {v0}, Lmiui/module/appstore/AppStoreRepository;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/module/CacheRepository;->mAppStoreRepo:Lmiui/module/appstore/AppStoreRepository;

    iput-boolean p2, p0, Lcom/miui/gallery/module/CacheRepository;->mLocalOnly:Z

    new-instance p2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    const-string v0, "plugins/preloads/"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    return-void
.end method

.method public static clearCache(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    sget-boolean v0, Lcom/miui/os/Rom;->IS_MIUI:Z

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-eqz v0, :cond_1

    if-eqz p0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "plugins/preloads/"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    const-string v0, "CacheRepository"

    const-string v2, "delete %s"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "miuisdk/modules/"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".apk"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    const-string v1, "CacheRepository"

    const-string v2, "delete %s"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".lib"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    const-string p1, "CacheRepository"

    const-string v0, "delete %s"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method cache(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "create plugin cache folder failed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "CacheRepository"

    const-string v1, "%s loaded, skip cache"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/module/CacheRepository;->mAppStoreRepo:Lmiui/module/appstore/AppStoreRepository;

    iget-object v2, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-virtual {v1, v2, p1}, Lmiui/module/appstore/AppStoreRepository;->fetch(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_3

    const-string v0, "CacheRepository"

    const-string v1, "app store repo fetch %s failed"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    :cond_3
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string p1, "CacheRepository"

    const-string v1, "rename %s -> %s failed"

    invoke-static {p1, v1, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    :cond_4
    const-string v0, "CacheRepository"

    const-string v1, "cache success"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/module/CacheRepository;->mLocalOnly:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/module/CacheRepository;->mAppStoreRepo:Lmiui/module/appstore/AppStoreRepository;

    invoke-virtual {v0, p1}, Lmiui/module/appstore/AppStoreRepository;->contains(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public fetch(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "CacheRepository"

    const-string v1, "fetching %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/module/CacheRepository;->mFolder:Ljava/io/File;

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    const-string v1, "CacheRepository"

    const-string v3, "%s not in cache"

    invoke-static {v1, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v1, p0, Lcom/miui/gallery/module/CacheRepository;->mLocalOnly:Z

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    const-string v1, "CacheRepository"

    const-string v3, "start to cache %s"

    invoke-static {v1, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/module/CacheRepository;->cache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    return-object v2

    :cond_1
    const-string v1, "CacheRepository"

    const-string v3, "%s cached"

    invoke-static {v1, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "CacheRepository"

    const-string v0, "fetch %s success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    :cond_3
    return-object v2
.end method
