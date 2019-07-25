.class Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;
.super Ljava/lang/Object;
.source "SmartBeautyFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mPrePos:I

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->mPrePos:I

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 1

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->mPrePos:I

    const/4 p2, 0x1

    if-eq p3, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->access$000(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iput p3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->mPrePos:I

    sget-object p1, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->INSTANCE:Lcom/miui/filtersdk/beauty/BeautyProcessorManager;

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->getBeautyProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    invoke-virtual {p1, p3}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getIntelligentLevelParams(I)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->setBeautyParameterTable(Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->notifyBeautyParameterChanged()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->access$100(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->setSelection(I)V

    return p2

    :cond_1
    :goto_0
    return p2
.end method
