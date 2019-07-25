.class Lcom/miui/gallery/ui/PhotoPageFragment$10;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnDisplayRectChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisplayRectChanged(Landroid/graphics/RectF;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isEntering()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isExiting()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->updateRemoteView(Lcom/miui/gallery/model/BaseDataItem;Landroid/graphics/RectF;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$10;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->refreshMask(Z)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method
