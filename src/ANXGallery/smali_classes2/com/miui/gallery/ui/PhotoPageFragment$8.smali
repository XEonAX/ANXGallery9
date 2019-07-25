.class Lcom/miui/gallery/ui/PhotoPageFragment$8;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnSingleTapListener;


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

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTap(FF)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->doExit()V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1700(Lcom/miui/gallery/ui/PhotoPageFragment;)I

    move-result p1

    if-gez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$8;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1702(Lcom/miui/gallery/ui/PhotoPageFragment;I)I

    :cond_2
    :goto_0
    return-void
.end method
