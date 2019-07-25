.class Lcom/miui/gallery/ui/PhotoDetailFragment$1;
.super Ljava/lang/Object;
.source "PhotoDetailFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$000(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0901b9

    if-eq p1, v0, :cond_2

    const v0, 0x7f090213

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$000(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object p1

    const/16 v0, 0xc8

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_4

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/IntentUtil;->jumpToExplore(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$000(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object p1

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_4

    check-cast p1, [D

    const/4 v0, 0x0

    aget-wide v1, p1, v0

    const/4 v3, 0x1

    aget-wide v4, p1, v3

    invoke-static {v1, v2, v4, v5}, Lcom/miui/gallery/data/LocationUtil;->isValidateCoordinate(DD)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    aget-wide v4, p1, v0

    aget-wide v2, p1, v3

    invoke-static {v1, v4, v5, v2, v3}, Lcom/miui/gallery/util/IntentUtil;->showOnMap(Landroid/content/Context;DD)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1004bd

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_3
    const-string p1, "photo_detail"

    const-string v0, "show_on_map"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method
