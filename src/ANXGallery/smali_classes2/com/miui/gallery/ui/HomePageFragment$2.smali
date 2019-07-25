.class Lcom/miui/gallery/ui/HomePageFragment$2;
.super Ljava/lang/Object;
.source "HomePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/HomePageFragment;->onStartup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 13

    move-object v0, p0

    move/from16 v11, p3

    new-instance v12, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v2

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/adapter/HomePageAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/adapter/HomePageAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/adapter/HomePageAdapter;->getFileLength(I)J

    move-result-wide v9

    move-object v1, v12

    move/from16 v7, p3

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    iget-object v1, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {}, Lcom/miui/gallery/ui/HomePageFragment;->access$100()Landroid/net/Uri;

    move-result-object v3

    iget-object v2, v0, Lcom/miui/gallery/ui/HomePageFragment$2;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v5

    const-string v6, "alias_show_in_homepage=1 AND sha1 NOT NULL"

    const-string v8, "alias_sort_time DESC "

    const/4 v7, 0x0

    const/4 v10, 0x0

    move-object v2, p1

    move/from16 v4, p3

    move-object v9, v12

    invoke-static/range {v1 .. v10}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Z)V

    const-string v1, "home"

    const-string v2, "click_micro_thumb"

    int-to-long v3, v11

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    const/4 v1, 0x1

    return v1
.end method
