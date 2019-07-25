.class public Lcom/miui/gallery/ui/DeleteMediaDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "DeleteMediaDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;,
        Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;,
        Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;
    }
.end annotation


# static fields
.field private static final TYPE_BURST_RESOURCE_MATRIX:[I

.field private static final TYPE_RESOURCE_MATRIX:[[I


# instance fields
.field private mDeletionFinishListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

.field private mExistXiaomiAccount:Z

.field private mIsFirstDelete:Z

.field private mParam:Lcom/miui/gallery/ui/DeletionTask$Param;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x3

    new-array v1, v0, [[I

    new-array v2, v0, [I

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v2, v0, [I

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-array v2, v0, [I

    fill-array-data v2, :array_2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    sput-object v1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->TYPE_RESOURCE_MATRIX:[[I

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->TYPE_BURST_RESOURCE_MATRIX:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f0e0021
        0x7f0e0025
        0x7f0e001e
    .end array-data

    :array_1
    .array-data 4
        0x7f0e0022
        0x7f0e0026
        0x7f0e001f
    .end array-data

    :array_2
    .array-data 4
        0x7f0e0020
        0x7f0e0024
        0x7f0e001d
    .end array-data

    :array_3
    .array-data 4
        0x7f0e001b
        0x7f0e001c
        0x7f0e001a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->doDelete()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)Lcom/miui/gallery/ui/DeletionTask$Param;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    return-object p0
.end method

.method private doDelete()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/ui/DeletionTask;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DeletionTask;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mDeletionFinishListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/DeletionTask;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/DeletionTask;->showProgress(Landroid/app/Activity;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/miui/gallery/ui/DeletionTask$Param;

    iget-object v3, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/DeletionTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private genDialogInfo()Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;
    .locals 7

    new-instance v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Lcom/miui/gallery/ui/DeleteMediaDialogFragment$1;)V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mExistXiaomiAccount:Z

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isOperateHomePage(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isOperateAlbum(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    iget-wide v5, v1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    invoke-static {v5, v6}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isLocalMode(J)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    invoke-direct {v1, p0, v4}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;I)V

    iput-object v1, v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isAlbumSyncable(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    iget v1, v1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const/4 v5, 0x3

    if-ne v1, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x1

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v2, 0x0

    :cond_4
    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->queryType(Lcom/miui/gallery/ui/DeletionTask$Param;)I

    move-result v1

    iget-object v5, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    iget-boolean v5, v5, Lcom/miui/gallery/ui/DeletionTask$Param;->mIsBurstItems:Z

    if-eqz v5, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getBurstMessageRes(I)I

    move-result v2

    iget-object v5, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/DeletionTask$Param;->getItemsCount()I

    move-result v5

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {v6}, Lcom/miui/gallery/ui/DeletionTask$Param;->getItemsCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v3

    invoke-virtual {v1, v2, v5, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->message:Ljava/lang/String;

    goto :goto_2

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getMessageRes(II)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/DeletionTask$Param;->getItemsCount()I

    move-result v2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {v6}, Lcom/miui/gallery/ui/DeletionTask$Param;->getItemsCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v3

    invoke-virtual {v5, v1, v2, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->message:Ljava/lang/String;

    :goto_2
    return-object v0
.end method

.method private getBurstMessageRes(I)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->TYPE_BURST_RESOURCE_MATRIX:[I

    aget p1, v0, p1

    return p1
.end method

.method private getCloudVideoCount(Lcom/miui/gallery/ui/DeletionTask$Param;)I
    .locals 13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    array-length v4, p1

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_1

    aget-wide v7, p1, v6

    invoke-static {v7, v8}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v4, 0x2

    const/4 v6, 0x1

    if-lez p1, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    const-string p1, "1073741823+_id"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v9

    const-string p1, "serverType=? AND 1073741823+_id IN (%s)"

    new-array v10, v6, [Ljava/lang/Object;

    const-string v11, ","

    invoke-static {v11, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v10, v5

    invoke-static {p1, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    new-array v11, v6, [Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v11, v5

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_3

    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v2, v5

    goto :goto_2

    :catchall_0
    move-exception v0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0

    :cond_3
    const/4 v2, 0x0

    :goto_2
    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_3

    :cond_4
    const/4 v2, 0x0

    :cond_5
    :goto_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    const-string p1, "_id"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v9

    const-string p1, "serverType=? AND _id IN (%s)"

    new-array v10, v6, [Ljava/lang/Object;

    const-string v11, ","

    invoke-static {v11, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v10, v5

    invoke-static {p1, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    new-array v11, v6, [Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v11, v5

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_7

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    add-int/2addr v2, v3

    goto :goto_4

    :catchall_1
    move-exception v0

    if-eqz p1, :cond_6

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v0

    :cond_7
    :goto_4
    if-eqz p1, :cond_8

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_8
    const-string p1, "DeleteMediaDialogFragment"

    const-string v3, "query video count cost %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v2
.end method

.method private getMessageRes(II)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->TYPE_RESOURCE_MATRIX:[[I

    aget-object p1, v0, p1

    aget p1, p1, p2

    return p1
.end method

.method private isAlbumSyncable(Lcom/miui/gallery/ui/DeletionTask$Param;)Z
    .locals 14

    iget-wide v0, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-wide v2, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/AlbumManager;->isVirtualAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    iget-wide v2, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    const/4 v2, 0x0

    if-lez v0, :cond_4

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v3, "attributes"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v8

    const-string v9, "_id=?"

    new-array v10, v1, [Ljava/lang/String;

    iget-wide v11, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v10, v2

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_3

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-long v6, v0

    const-wide/16 v8, 0x1

    and-long/2addr v6, v8

    cmp-long v0, v6, v4

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v1

    :catchall_0
    move-exception v0

    move-object v13, v0

    move-object v0, p1

    move-object p1, v13

    goto :goto_1

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_1
    move-exception p1

    :goto_1
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_4
    :goto_2
    return v2
.end method

.method private static isLocalMode(J)Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x3e8

    cmp-long v2, p0, v0

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isOperateAlbum(Lcom/miui/gallery/ui/DeletionTask$Param;)Z
    .locals 5

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isOperateHomePage(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-wide v0, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    iget-wide v0, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    const-wide/16 v2, -0x3e8

    cmp-long p1, v0, v2

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isOperateHomePage(Lcom/miui/gallery/ui/DeletionTask$Param;)Z
    .locals 1

    iget p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static newInstance(Lcom/miui/gallery/ui/DeletionTask$Param;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "delete_params"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private queryType(Lcom/miui/gallery/ui/DeletionTask$Param;)I
    .locals 8

    invoke-virtual {p1}, Lcom/miui/gallery/ui/DeletionTask$Param;->getItemsCount()I

    move-result v0

    const/4 v1, 0x2

    const/16 v2, 0xc8

    if-le v0, v2, :cond_0

    return v1

    :cond_0
    iget v2, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getCloudVideoCount(Lcom/miui/gallery/ui/DeletionTask$Param;)I

    move-result p1

    add-int/2addr p1, v3

    goto :goto_1

    :cond_1
    iget v2, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    if-ne v2, v4, :cond_4

    iget-object p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mPaths:[Ljava/lang/String;

    array-length v2, p1

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v5, v2, :cond_3

    aget-object v7, p1, v5

    invoke-static {v7}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    add-int/lit8 v6, v6, 0x1

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    move p1, v6

    goto :goto_1

    :cond_4
    const/4 p1, 0x0

    :goto_1
    if-ne p1, v0, :cond_5

    return v4

    :cond_5
    if-nez p1, :cond_6

    return v3

    :cond_6
    return v1
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mIsFirstDelete:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->changeOrientation(I)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "delete_params"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/DeletionTask$Param;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mExistXiaomiAccount:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mExistXiaomiAccount:Z

    const/4 v0, 0x0

    const/high16 v1, 0x1040000

    const v2, 0x7f1002f2

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isOperateHomePage(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result p1

    const/4 v3, 0x1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Delete;->isFirstDeleteFromHomePage()Z

    move-result p1

    if-eqz p1, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mIsFirstDelete:Z

    new-instance p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {p1, p0, v3}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Landroid/content/Context;)V

    new-instance v3, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$1;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$1;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)V

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setPositiveButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setNegativeButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    const v0, 0x7f1002ff

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setSubTitle(I)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->changeOrientation(I)V

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isOperateAlbum(Lcom/miui/gallery/ui/DeletionTask$Param;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    iget-wide v4, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    invoke-static {v4, v5}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->isLocalMode(J)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Delete;->isFirstDeleteFromAlbum()Z

    move-result p1

    if-eqz p1, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mIsFirstDelete:Z

    new-instance p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {p1, p0, v3}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Landroid/content/Context;)V

    new-instance v3, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$2;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)V

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setPositiveButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setNegativeButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    const v0, 0x7f1002fe

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setSubTitle(I)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setTipVisibility(IZ)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mParam:Lcom/miui/gallery/ui/DeletionTask$Param;

    iget-object v0, v0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f1002fa

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setTipText(ILjava/lang/String;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->changeOrientation(I)V

    return-object p1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->genDialogInfo()Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;

    move-result-object p1

    new-instance v3, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v4, p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    if-eqz v4, :cond_3

    iget-object v4, p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    iget-boolean v4, v4, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->defaultValue:Z

    iget-object v5, p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    iget-object v5, v5, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    :cond_3
    new-instance v4, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;

    invoke-direct {v4, p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;-><init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;)V

    invoke-virtual {v3, v2, v4}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->message:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->mDeletionFinishListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    return-void
.end method
