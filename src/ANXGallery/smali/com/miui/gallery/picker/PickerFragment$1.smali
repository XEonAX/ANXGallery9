.class Lcom/miui/gallery/picker/PickerFragment$1;
.super Ljava/lang/Object;
.source "PickerFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/picker/PickerFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickerFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickerFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 20
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

    iget-object v1, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/picker/PickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    if-eqz v2, :cond_1

    instance-of v1, v2, Lcom/miui/security/CrossUserCompatActivity;

    if-eqz v1, :cond_1

    move-object v1, v2

    check-cast v1, Lcom/miui/security/CrossUserCompatActivity;

    invoke-virtual {v1}, Lcom/miui/security/CrossUserCompatActivity;->isCrossUserPick()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    move-object/from16 v1, p1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    move/from16 v3, p3

    invoke-interface {v1, v3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/database/Cursor;

    iget-object v3, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v3, v1}, Lcom/miui/gallery/picker/PickerFragment;->onPhotoItemClick(Landroid/database/Cursor;)Z

    move-result v3

    if-eqz v3, :cond_2

    return-void

    :cond_2
    new-instance v8, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v8, v3}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    move-object/from16 v5, p2

    invoke-static {v5, v4}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/picker/PickerFragment;->getKey(Landroid/database/Cursor;)J

    move-result-wide v10

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/picker/PickerFragment;->getLocalPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v12

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v4

    iget-object v13, v4, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v1}, Lcom/miui/gallery/picker/helper/CursorUtils;->getMimeType(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v16

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/picker/PickerFragment;->isPreviewFace()Z

    move-result v17

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/picker/PickerFragment;->getFileLength(Landroid/database/Cursor;)J

    move-result-wide v18

    move-object v9, v7

    invoke-direct/range {v9 .. v19}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/picker/PickerFragment;->getPreviewUri()Landroid/net/Uri;

    move-result-object v4

    iget-object v5, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v5, v1}, Lcom/miui/gallery/picker/PickerFragment;->getPreviewSelection(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v6, v1}, Lcom/miui/gallery/picker/PickerFragment;->getPreviewSelectionArgs(Landroid/database/Cursor;)[Ljava/lang/String;

    move-result-object v1

    iget-object v6, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v6}, Lcom/miui/gallery/picker/PickerFragment;->getPreviewOrder()Ljava/lang/String;

    move-result-object v6

    iget-object v9, v0, Lcom/miui/gallery/picker/PickerFragment$1;->this$0:Lcom/miui/gallery/picker/PickerFragment;

    invoke-virtual {v9}, Lcom/miui/gallery/picker/PickerFragment;->supportFoldBurstItems()Z

    move-result v9

    xor-int/2addr v9, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v1

    invoke-static/range {v2 .. v9}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPageFromPicker(Landroid/app/Activity;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/util/ArrayList;Z)V

    return-void
.end method
