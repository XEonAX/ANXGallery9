.class Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$1;
.super Ljava/lang/Object;
.source "ScreenshotNaviFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;->access$000(Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->effect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;->access$100(Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;Lcom/miui/gallery/editor/photo/core/Effect;)V

    const/4 p1, 0x1

    return p1
.end method
