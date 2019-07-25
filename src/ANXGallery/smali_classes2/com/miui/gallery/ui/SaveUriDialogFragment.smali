.class public Lcom/miui/gallery/ui/SaveUriDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "SaveUriDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

.field private mProgressDialog:Lmiui/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SaveUriDialogFragment;Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->saveInternal(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SaveUriDialogFragment;)Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mListener:Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    return-object p0
.end method

.method private static generateJPGFileForSaving(Ljava/lang/String;)Ljava/io/File;
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd_kkmmss"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "SAVE_%s"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v2, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%s/%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v0

    aput-object v2, v5, v4

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "jpg"

    if-lez v1, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception p0

    const-string v0, "SaveUriDialogFragment"

    const-string v1, "generateJPGFileForSaving() failed %s %s"

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method private save(Landroid/net/Uri;)V
    .locals 2

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mListener:Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mListener:Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;->onComplete(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/SaveUriDialogFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/SaveUriDialogFragment$1;-><init>(Lcom/miui/gallery/ui/SaveUriDialogFragment;Landroid/net/Uri;)V

    new-instance p1, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;-><init>(Lcom/miui/gallery/ui/SaveUriDialogFragment;)V

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    :cond_1
    :goto_0
    return-void
.end method

.method private saveInternal(Landroid/net/Uri;)Ljava/lang/String;
    .locals 8

    const-string v0, "DCIM/Camera"

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorageForUnadapted(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    return-object v3

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->generateJPGFileForSaving(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v3

    :cond_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v6, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->NONE_SAFE:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v5, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    invoke-virtual {v1, v4, v3, v5}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v0, "SaveUriDialogFragment"

    const-string v1, "fail to convert %s to bitmap"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v3

    :cond_2
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {v1, v5, v6, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v5, v2}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;I)V

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/io/File;

    aput-object v0, v7, v2

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    return-object v5

    :catch_0
    move-exception v0

    goto :goto_0

    :catchall_0
    move-exception p1

    move-object v4, v3

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v4, v3

    :goto_0
    :try_start_2
    const-string v2, "SaveUriDialogFragment"

    const-string v5, "fail to save %s %s"

    invoke-static {v2, v5, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    return-object v3

    :catchall_1
    move-exception p1

    :goto_1
    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    throw p1
.end method

.method public static show(Landroid/app/Activity;Landroid/net/Uri;Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/SaveUriDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_uri"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "SaveUriDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "key_uri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->save(Landroid/net/Uri;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f100019

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lmiui/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Lmiui/app/ProgressDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroy()V

    return-void
.end method

.method public setOnCompleteListener(Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment;->mListener:Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    return-void
.end method
