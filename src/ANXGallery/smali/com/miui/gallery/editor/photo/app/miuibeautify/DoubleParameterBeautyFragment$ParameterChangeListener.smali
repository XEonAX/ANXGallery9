.class Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;
.super Ljava/lang/Object;
.source "DoubleParameterBeautyFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParameterChangeListener"
.end annotation


# instance fields
.field private mEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->mEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 3

    sget-object v0, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->INSTANCE:Lcom/miui/filtersdk/beauty/BeautyProcessorManager;

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->getBeautyProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->mEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->mEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v0, v1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p1, v1

    const/4 v1, 0x1

    aget v1, v0, v1

    const/4 v2, 0x0

    aget v0, v0, v2

    sub-float/2addr v1, v0

    mul-float p1, p1, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->mEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->setBeautyParameterTable(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->notifyBeautyParameterChanged()V

    :cond_0
    return-void
.end method
