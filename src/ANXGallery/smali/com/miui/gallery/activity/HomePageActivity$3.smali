.class Lcom/miui/gallery/activity/HomePageActivity$3;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Lmiui/app/ActionBar$FragmentViewPagerChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageActivity;->setupHomePageFragment()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mIsPendingSelectDispatched:Z

.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->mIsPendingSelectDispatched:Z

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 1

    if-nez p1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->mIsPendingSelectDispatched:Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$602(Lcom/miui/gallery/activity/HomePageActivity;I)I

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$700(Lcom/miui/gallery/activity/HomePageActivity;)V

    return-void
.end method

.method public onPageScrolled(IFZZ)V
    .locals 4

    iget-boolean p3, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->mIsPendingSelectDispatched:Z

    if-eqz p3, :cond_0

    return-void

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p3}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result p3

    const/4 p4, 0x1

    if-ne p1, p3, :cond_2

    const p3, 0x3e19999a    # 0.15f

    cmpl-float p3, p2, p3

    if-ltz p3, :cond_2

    const-string p3, "HomePageActivity"

    const-string v0, "pending select page: %d, curr ratio: %f"

    add-int/lit8 v1, p1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-static {p3, v0, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-ne v1, p4, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p3}, Lcom/miui/gallery/activity/HomePageActivity;->access$300(Lcom/miui/gallery/activity/HomePageActivity;)V

    :cond_1
    iput-boolean p4, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->mIsPendingSelectDispatched:Z

    :cond_2
    iget-object p3, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p3}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result p3

    sub-int/2addr p3, p4

    if-ne p1, p3, :cond_4

    const p3, 0x3f4ccccd    # 0.8f

    cmpg-float p3, p2, p3

    if-gtz p3, :cond_4

    const-string p3, "HomePageActivity"

    const-string v0, "pending select page: %d, curr ratio: %f"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-static {p3, v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-ne p1, p4, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$300(Lcom/miui/gallery/activity/HomePageActivity;)V

    :cond_3
    iput-boolean p4, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->mIsPendingSelectDispatched:Z

    :cond_4
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    const-string v0, "HomePageActivity"

    const-string v1, "onPageSelected %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result v0

    if-eq v0, p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v2, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v2}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/miui/gallery/activity/HomePageActivity;->access$400(Lcom/miui/gallery/activity/HomePageActivity;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v1, p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$400(Lcom/miui/gallery/activity/HomePageActivity;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$500(Lcom/miui/gallery/activity/HomePageActivity;I)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$3;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$102(Lcom/miui/gallery/activity/HomePageActivity;I)I

    return-void
.end method
