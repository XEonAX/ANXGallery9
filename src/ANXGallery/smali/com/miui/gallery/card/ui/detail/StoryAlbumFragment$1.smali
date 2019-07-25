.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p3

    iget-object v2, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;->isHeaderPosition(I)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    return v1

    :cond_0
    iget-object v2, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "remove_duplicate_items"

    const/4 v15, 0x1

    invoke-static {v15}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    new-instance v13, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemKey(I)J

    move-result-wide v4

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v3

    iget-object v7, v3, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v8

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v10

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getFileLength(I)J

    move-result-wide v11

    move-object v3, v13

    move v9, v1

    invoke-direct/range {v3 .. v12}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    iget-object v4, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v4}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    move-result-object v4

    iget-object v5, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemCount()I

    move-result v7

    iget-object v5, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;

    move-result-object v8

    iget-object v5, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Ljava/lang/String;

    move-result-object v9

    iget-object v5, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;

    move-result-object v10

    const-wide/32 v16, 0x7ffffff8

    const/4 v14, 0x1

    move-object v5, v2

    move v6, v1

    move-object v11, v13

    move-wide/from16 v12, v16

    invoke-static/range {v3 .. v14}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JZ)V

    return v15
.end method
