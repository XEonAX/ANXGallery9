.class public Lcom/miui/gallery/assistant/library/LibraryUtils;
.super Ljava/lang/Object;
.source "LibraryUtils.java"


# direct methods
.method public static concat([Ljava/lang/Long;[Ljava/lang/Long;)[Ljava/lang/Long;
    .locals 3

    if-eqz p0, :cond_1

    array-length v0, p0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    array-length v0, p1

    if-eqz v0, :cond_0

    array-length v0, p0

    array-length v1, p1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Long;

    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p0, p0

    array-length v1, p1

    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0

    :cond_0
    return-object p0

    :cond_1
    return-object p1
.end method

.method static getAllLibraries()[Ljava/lang/Long;
    .locals 2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Long;

    invoke-static {}, Lcom/miui/gallery/util/PhotoMovieEntranceUtils;->isPhotoMovieAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sPhotoMovieLibraries:[Ljava/lang/Long;

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/library/LibraryUtils;->concat([Ljava/lang/Long;[Ljava/lang/Long;)[Ljava/lang/Long;

    move-result-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sSkyTransferLibraries:[Ljava/lang/Long;

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/library/LibraryUtils;->concat([Ljava/lang/Long;[Ljava/lang/Long;)[Ljava/lang/Long;

    move-result-object v0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isStoryGenerateEnable()Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sStoryLibraries:[Ljava/lang/Long;

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/library/LibraryUtils;->concat([Ljava/lang/Long;[Ljava/lang/Long;)[Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageFeatureSelectionLibraries:[Ljava/lang/Long;

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/library/LibraryUtils;->concat([Ljava/lang/Long;[Ljava/lang/Long;)[Ljava/lang/Long;

    move-result-object v0

    :cond_3
    :goto_0
    return-object v0
.end method

.method static getCurrentAbi()Ljava/lang/String;
    .locals 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    sget-object v0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->SUPPORTED_64_BIT_ABIS:[Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    array-length v3, v1

    if-lez v3, :cond_0

    aget-object v0, v1, v2

    return-object v0

    :cond_0
    aget-object v0, v0, v2

    return-object v0

    :cond_1
    sget-object v0, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    return-object v0
.end method

.method public static getLibraryDirPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-string v0, "libs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static isLibraryItemExist(Landroid/content/Context;Lcom/miui/gallery/assistant/library/LibraryItem;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/assistant/library/LibraryItem;->getTargetPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/net/download/Verifier$Sha1;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getSha1()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/Verifier$Sha1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getFileSha1(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/download/Verifier$Sha1;->verify([B)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method
