.class Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;
.super Ljava/lang/Object;
.source "BabyAlbumDetailTimeLineAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setFaceHeader(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Landroid/view/View;Landroid/view/View$OnClickListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

.field final synthetic val$isOtherShared:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iput-boolean p2, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;->val$isOtherShared:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;->val$isOtherShared:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->gotoBabyInfoSettingPage(Z)V

    const-string p1, "baby"

    const-string v0, "baby_edit_baby_info"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
