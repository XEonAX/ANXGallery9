.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;
.super Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;
.source "SingleParameterBeautyFragment.java"


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

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b00b3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090290

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBar:Landroid/widget/SeekBar;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0154

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060330

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-direct {p2, v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method
