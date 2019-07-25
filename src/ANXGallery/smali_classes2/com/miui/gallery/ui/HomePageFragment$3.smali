.class Lcom/miui/gallery/ui/HomePageFragment$3;
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

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$3;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 0

    instance-of p1, p2, Lcom/miui/gallery/ui/MonthView;

    if-eqz p1, :cond_0

    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/ui/MonthView;

    invoke-virtual {p1, p6, p7}, Lcom/miui/gallery/ui/MonthView;->findMatchItemUnder(FF)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/View;->getTranslationX()F

    move-result p4

    add-float/2addr p1, p4

    add-float/2addr p6, p1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    move-result p2

    add-float/2addr p1, p2

    add-float/2addr p7, p1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$3;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1, p6, p7}, Lcom/miui/gallery/ui/HomePageFragment;->access$200(Lcom/miui/gallery/ui/HomePageFragment;FF)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "position"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "list_view"

    const-string p3, "list_view_month_click"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
