.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;
.super Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;
.source "DoubleParameterBeautyFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;
    }
.end annotation


# instance fields
.field private mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mSeekBarBottom:Landroid/widget/SeekBar;

.field private mSeekBarTop:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b00b1

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_1

    const-string v0, "BEAUTY_EFFECT"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    iget-object v0, p2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    if-ne v0, v1, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10052c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    sget-object v3, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    const v1, 0x7f090307

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f09006b

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f090294

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mSeekBarTop:Landroid/widget/SeekBar;

    const v1, 0x7f090291

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mSeekBarBottom:Landroid/widget/SeekBar;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mSeekBarTop:Landroid/widget/SeekBar;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x0

    const v4, 0x7f0b0154

    invoke-static {v2, v4, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060330

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v8, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;

    invoke-direct {v8, p0, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    invoke-direct {v1, v2, v5, v7, v8}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mSeekBarBottom:Landroid/widget/SeekBar;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v4, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v4, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;

    invoke-direct {v4, p0, v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment$ParameterChangeListener;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    invoke-direct {p2, v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    :cond_1
    return-void
.end method
