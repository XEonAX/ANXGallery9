.class public Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;
.super Lcom/miui/gallery/util/baby/ProgressDialogTask;
.source "CopyFaceAlbumItemsToBabyAlbumTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private final mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

.field private mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

.field private mProgress:I

.field private mSourceItems:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/database/Cursor;Lcom/miui/gallery/model/SendToCloudFolderItem;I)V
    .locals 7

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move v3, p4

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/util/baby/ProgressDialogTask;-><init>(Landroid/content/Context;IIIZZ)V

    iput-object p2, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mSourceItems:Landroid/database/Cursor;

    iput-object p3, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

    iput-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method private handleOneFile(Landroid/content/ContentValues;)I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/SendToCloudFolderItem;->isShareAlbum()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/FaceManager;->localCopyFaceImages2BabyAlbum(Landroid/content/ContentValues;Z)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public static instance(Landroid/app/Activity;Landroid/database/Cursor;Lcom/miui/gallery/model/SendToCloudFolderItem;II)Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;
    .locals 0

    new-instance p3, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;-><init>(Landroid/app/Activity;Landroid/database/Cursor;Lcom/miui/gallery/model/SendToCloudFolderItem;I)V

    return-object p3
.end method


# virtual methods
.method public bridge synthetic dismissDialog()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->dismissDialog()V

    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    iget-object v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mSourceItems:Landroid/database/Cursor;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/SendToCloudFolderItem;->getLocalGroupId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/FaceManager;->changeCursorData2ContentValuesOfCloudTable(Landroid/database/Cursor;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->handleOneFile(Landroid/content/ContentValues;)I

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    invoke-virtual {p0}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->isDialogShowing()Z

    move-result v2

    if-eqz v2, :cond_2

    new-array v2, v3, [Ljava/lang/Integer;

    iget v3, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, p1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->publishProgress([Ljava/lang/Object;)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1
.end method

.method protected onCancelled()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->onCancelled()V

    iget-object v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

    iget v1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    invoke-interface {v0, v1}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;->onProgressEnd(I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->onPostExecute(Ljava/lang/Void;)V

    iget-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

    iget v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mProgress:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;->onProgressEnd(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mActivity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mActivity:Landroid/app/Activity;

    const v1, 0x7f1000c1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

    invoke-virtual {v4}, Lcom/miui/gallery/model/SendToCloudFolderItem;->getFolderName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeTextLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mActivity:Landroid/app/Activity;

    new-instance v0, Lcom/miui/gallery/share/Path;

    iget-object v1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mFolderItem:Lcom/miui/gallery/model/SendToCloudFolderItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/SendToCloudFolderItem;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-direct {v0, v3, v4, v5, v2}, Lcom/miui/gallery/share/Path;-><init>(JZZ)V

    invoke-static {p1, v0, v5}, Lcom/miui/gallery/share/UIHelper;->showAlbumShareInfo(Landroid/app/Activity;Lcom/miui/gallery/share/Path;I)V

    iget-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method

.method public setProgressFinishListener(Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask;->mListener:Lcom/miui/gallery/util/baby/CopyFaceAlbumItemsToBabyAlbumTask$ProgressEndListener;

    return-void
.end method
