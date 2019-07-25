.class Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;
.super Ljava/lang/Object;
.source "MiuiBeautyFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public changeTitle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$1200(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onBeautyParameterChanged(Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->access$1100(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->getBeautyParameterTable()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    instance-of p1, p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    const/4 v2, 0x1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->setShowProgressDelay(Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->isComparisonEnable()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->enableComparison(Z)V

    :cond_1
    return-void
.end method
