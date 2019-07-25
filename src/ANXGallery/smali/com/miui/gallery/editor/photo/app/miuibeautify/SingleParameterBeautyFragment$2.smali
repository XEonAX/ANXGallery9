.class Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;
.super Ljava/lang/Object;
.source "SingleParameterBeautyFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    .locals 4

    sget-object v0, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->INSTANCE:Lcom/miui/filtersdk/beauty/BeautyProcessorManager;

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->getBeautyProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "BEAUTY_EFFECT"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v0, v2}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v2, v0

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr p1, v2

    const/4 v2, 0x1

    aget v2, v0, v2

    const/4 v3, 0x0

    aget v0, v0, v3

    sub-float/2addr v2, v0

    mul-float p1, p1, v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->setBeautyParameterTable(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->notifyBeautyParameterChanged()V

    :cond_0
    return-void
.end method
