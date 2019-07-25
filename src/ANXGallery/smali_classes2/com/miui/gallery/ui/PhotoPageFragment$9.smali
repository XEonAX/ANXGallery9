.class Lcom/miui/gallery/ui/PhotoPageFragment$9;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnScaleChangedListener;


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

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScaleChanged(FFF)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isEntering()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isExiting()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onPhotoScale(F)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_2

    cmpl-float p1, p2, v0

    if-lez p1, :cond_2

    cmpl-float p1, p3, v0

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1400(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_3

    cmpg-float p1, p3, v0

    if-gez p1, :cond_3

    cmpg-float p1, p2, v0

    if-gez p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->isItemVisible(I)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$9;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->viewToPosition(I)Z

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method
