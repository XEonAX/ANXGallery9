.class Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;
.super Ljava/lang/Object;
.source "MiuiBeautyFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$000(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    move-result-object p1

    aget-object p1, p1, p3

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->newMenu()Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$100(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->setCallback(Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$200(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$300(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$400(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$500(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string p1, "MiuiBeautyFragment"

    const-string p2, "detect task not done"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    iget-object v1, p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->beautyEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    if-eqz v1, :cond_2

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->beautyEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->needFace()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$600(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f100530

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v3

    :cond_2
    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->setOnBeautyProcessListener(Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment$OnBeautyProcessListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$700(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    const v1, 0x7f090087

    invoke-virtual {p1, v1, p2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->setCompareOrigin(Z)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->enableComparison(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$402(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$800(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->updateBottomBar(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$902(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;I)I

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "name"

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$1000(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Ljava/util/List;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$900(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)I

    move-result v0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;

    iget-object p3, p3, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;->name:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "_miuibeautify"

    const-string p3, "miui_beauty_item_click"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    return v3
.end method
