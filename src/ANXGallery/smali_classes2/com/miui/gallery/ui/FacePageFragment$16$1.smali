.class Lcom/miui/gallery/ui/FacePageFragment$16$1;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment$16;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/FacePageFragment$16;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment$16;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$16;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->setFaceRecommendGroupHidden(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$16;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1500(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    iget-object p2, p2, Lcom/miui/gallery/ui/FacePageFragment$16;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$2700(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeHeaderView(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$16;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1500(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$16$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$16;

    iget-object p2, p2, Lcom/miui/gallery/ui/FacePageFragment$16;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$1400(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addFooterView(Landroid/view/View;)V

    const-string p1, "face"

    const-string p2, "face_close_recommend_panel"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
