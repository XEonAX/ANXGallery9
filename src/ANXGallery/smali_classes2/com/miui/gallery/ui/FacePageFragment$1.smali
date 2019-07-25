.class Lcom/miui/gallery/ui/FacePageFragment$1;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    move-object v0, p0

    move/from16 v12, p3

    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v13

    new-instance v14, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v13, v12}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getItemKey(I)J

    move-result-wide v2

    invoke-virtual {v13, v12}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v13, v12}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v13, v12}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v13, v12}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getFileLength(I)J

    move-result-wide v10

    const/4 v9, 0x1

    move-object v1, v14

    move/from16 v7, p3

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V

    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {v13}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getCount()I

    move-result v5

    iget-object v2, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/FacePageFragment;->access$100(Lcom/miui/gallery/ui/FacePageFragment;)[Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/FacePageFragment;->access$200(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/FacePageFragment;->access$300(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v10

    const/4 v6, 0x0

    const/4 v11, 0x1

    move-object/from16 v2, p1

    move/from16 v4, p3

    move-object v9, v14

    invoke-static/range {v1 .. v11}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/lang/String;Z)V

    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$1;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/FacePageFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "click_micro_thumb"

    int-to-long v3, v12

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
