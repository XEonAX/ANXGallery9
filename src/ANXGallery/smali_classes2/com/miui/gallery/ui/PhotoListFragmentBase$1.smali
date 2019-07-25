.class Lcom/miui/gallery/ui/PhotoListFragmentBase$1;
.super Ljava/lang/Object;
.source "PhotoListFragmentBase.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoListFragmentBase;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoListFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 17
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

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getViewAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v12

    new-instance v13, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemKey(I)J

    move-result-wide v2

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemSecretKey(I)[B

    move-result-object v9

    invoke-virtual {v12, v15}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getFileLength(I)J

    move-result-wide v10

    move-object v1, v13

    move/from16 v7, p3

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v12}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result v5

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getSelection()Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getCurrentSortOrder()Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    iget-wide v10, v2, Lcom/miui/gallery/ui/PhotoListFragmentBase;->mAlbumId:J

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    iget-object v12, v2, Lcom/miui/gallery/ui/PhotoListFragmentBase;->mAlbumName:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getSupportOperationMask()I

    move-result v14

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v2

    xor-int/lit8 v16, v2, 0x1

    move-object/from16 v2, p1

    move/from16 v4, p3

    move-object v9, v13

    move v13, v14

    move/from16 v14, v16

    invoke-static/range {v1 .. v14}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoListFragmentBase$1;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getPageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "click_micro_thumb"

    int-to-long v3, v15

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
