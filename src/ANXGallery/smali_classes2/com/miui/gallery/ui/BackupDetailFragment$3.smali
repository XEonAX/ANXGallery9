.class Lcom/miui/gallery/ui/BackupDetailFragment$3;
.super Ljava/lang/Object;
.source "BackupDetailFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BackupDetailFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BackupDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BackupDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v15, p3

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemViewType(I)I

    move-result v1

    const/4 v12, 0x1

    if-ne v1, v12, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->startAuthenticatePrivacyPassword(Landroid/app/Fragment;)V

    goto/16 :goto_1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSelection()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") AND ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "localGroupId"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " != "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v2, -0x3e8

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemKey(I)J

    move-result-wide v2

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemSecretKey(I)[B

    move-result-object v9

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getFileLength(I)J

    move-result-wide v10

    move-object v1, v14

    move/from16 v7, p3

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getUri()Landroid/net/Uri;

    move-result-object v3

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getCount()I

    move-result v2

    iget-object v4, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getSecretCount()I

    move-result v4

    if-lez v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    sub-int v5, v2, v4

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getCurrentSortOrder()Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    iget-wide v10, v2, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumId:J

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    iget-object v9, v2, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumName:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSupportOperationMask()I

    move-result v16

    iget-object v2, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BackupDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v2

    xor-int/lit8 v17, v2, 0x1

    move-object/from16 v2, p1

    move/from16 v4, p3

    move-object v6, v13

    move-object v12, v9

    move-object v9, v14

    move/from16 v13, v16

    move/from16 v14, v17

    invoke-static/range {v1 .. v14}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/BackupDetailFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "click_micro_thumb"

    int-to-long v3, v15

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :goto_1
    return-void
.end method
