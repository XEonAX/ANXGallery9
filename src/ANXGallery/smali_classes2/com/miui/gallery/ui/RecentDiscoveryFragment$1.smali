.class Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;
.super Ljava/lang/Object;
.source "RecentDiscoveryFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

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

    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v14

    new-instance v12, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemKey(I)J

    move-result-wide v2

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroRecentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemSecretKey(I)[B

    move-result-object v9

    invoke-virtual {v14, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getFileLength(I)J

    move-result-wide v10

    move-object v1, v12

    move/from16 v7, p3

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v14}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCount()I

    move-result v5

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSelection()Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSortOrder()Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-wide v10, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumId:J

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v13, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumName:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSupportOperationMask()I

    move-result v16

    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$100(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->supportFoldBurstItems()Z

    move-result v2

    xor-int/lit8 v17, v2, 0x1

    move-object/from16 v2, p1

    move/from16 v4, p3

    move-object v9, v12

    move-object v12, v13

    move/from16 v13, v16

    move-object v0, v14

    move/from16 v14, v17

    invoke-static/range {v1 .. v14}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZ)V

    invoke-virtual {v0, v15}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getDateModified(I)J

    move-result-wide v0

    move-object/from16 v2, p0

    iget-object v3, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$200(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)J

    move-result-wide v3

    cmp-long v5, v0, v3

    if-gez v5, :cond_0

    iget-object v3, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v3, v0, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$202(Lcom/miui/gallery/ui/RecentDiscoveryFragment;J)J

    :cond_0
    iget-object v0, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getPageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "click_micro_thumb"

    int-to-long v3, v15

    invoke-static {v0, v1, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
