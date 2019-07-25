.class Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;
.super Ljava/lang/Object;
.source "BurstPhotoFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->saveBurstItems(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

.field final synthetic val$saveAll:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->val$saveAll:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doProcess([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 17

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v0

    iget-object v2, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v2, v2, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    sub-int v3, v0, v3

    new-array v5, v3, [J

    const/4 v3, 0x0

    const/4 v4, 0x1

    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const-string v8, "external"

    invoke-static {v8}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    sub-int/2addr v0, v4

    const/4 v9, 0x0

    :goto_0
    if-ltz v0, :cond_9

    iget-object v10, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v10, v10, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v10, v10, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v10, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v10

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    const/4 v12, 0x0

    if-nez v11, :cond_0

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v11

    const-string v13, "localFile"

    goto :goto_1

    :cond_0
    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v11

    const-string v13, "thumbnailFile"

    goto :goto_1

    :cond_1
    move-object v11, v12

    move-object v13, v11

    :goto_1
    iget-boolean v14, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->val$saveAll:Z

    if-nez v14, :cond_4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v2, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    goto :goto_2

    :cond_2
    invoke-static {v11}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v12

    const-string v13, "_data=?"

    new-array v14, v4, [Ljava/lang/String;

    aput-object v11, v14, v3

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v10

    aput-wide v10, v5, v9

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_3

    :cond_4
    :goto_2
    if-eqz v11, :cond_5

    const-string v14, "_BURST"

    invoke-virtual {v11, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_5

    const-string v12, "_BURST"

    const-string v14, "_"

    invoke-virtual {v11, v12, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    :cond_5
    invoke-static {v11}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_6

    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v14, v15}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v14

    if-eqz v14, :cond_8

    invoke-static {v11}, Lcom/miui/gallery/util/MediaStoreUtils;->getFileMediaUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-static {v11, v12}, Lcom/miui/gallery/util/MediaStoreUtils;->update(Landroid/net/Uri;Ljava/lang/String;)V

    :cond_6
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    if-eqz v12, :cond_7

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    const-string v12, "title"

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getTitle()Ljava/lang/String;

    move-result-object v13

    const-string v14, "_BURST"

    const-string v15, "_"

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v12, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v12}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v12

    invoke-virtual {v12, v11}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v11

    const-string v12, "_id=?"

    new-array v13, v4, [Ljava/lang/String;

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v3

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v11, 0x7

    invoke-static {v11}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "update %s set %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\'), %s = replace(%s,\'%s\', \'_\') where %s=%s"

    const/16 v14, 0xb

    new-array v14, v14, [Ljava/lang/Object;

    const-string v15, "cloud"

    aput-object v15, v14, v3

    const-string v15, "editedColumns"

    aput-object v15, v14, v4

    const/4 v15, 0x2

    const-string v16, "editedColumns"

    aput-object v16, v14, v15

    const/4 v15, 0x3

    aput-object v12, v14, v15

    const/4 v15, 0x4

    aput-object v12, v14, v15

    const/4 v15, 0x5

    aput-object v12, v14, v15

    const/4 v12, 0x6

    const-string v15, "fileName"

    aput-object v15, v14, v12

    const-string v12, "fileName"

    aput-object v12, v14, v11

    const/16 v11, 0x8

    const-string v12, "_BURST"

    aput-object v12, v14, v11

    const/16 v11, 0x9

    const-string v12, "_id"

    aput-object v12, v14, v11

    const/16 v11, 0xa

    invoke-virtual {v10}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v14, v11

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    :cond_8
    :goto_3
    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_0

    :cond_9
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-virtual {v0, v2, v6}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    :cond_a
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "media"

    invoke-virtual {v0, v2, v7}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    const-string v2, "BurstPhotoFragment"

    const-string v6, "save burst failed"

    invoke-static {v2, v6, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_b
    :goto_4
    array-length v0, v5

    if-eqz v0, :cond_c

    new-instance v0, Lcom/miui/gallery/ui/DeletionTask;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DeletionTask;-><init>()V

    new-instance v2, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4$1;

    invoke-direct {v2, v1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4$1;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/DeletionTask;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v11, v4, [Lcom/miui/gallery/ui/DeletionTask$Param;

    new-instance v12, Lcom/miui/gallery/ui/DeletionTask$Param;

    const/4 v6, 0x2

    const-wide/16 v7, -0x1

    const-string v9, ""

    const/16 v10, 0x31

    move-object v4, v12

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/ui/DeletionTask$Param;-><init>([JIJLjava/lang/String;I)V

    aput-object v12, v11, v3

    invoke-virtual {v0, v2, v11}, Lcom/miui/gallery/ui/DeletionTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_c
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic doProcess([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->doProcess([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
