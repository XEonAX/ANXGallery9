.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;
.super Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;
.source "SwitchParameterBeautyFragment.java"


# instance fields
.field private mSlidingButton:Lmiui/widget/SlidingButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b00b4

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_0

    const v0, 0x7f0902c6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100524

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f09007b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lmiui/widget/SlidingButton;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;->mSlidingButton:Lmiui/widget/SlidingButton;

    const-string p1, "BEAUTY_EFFECT"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;->mSlidingButton:Lmiui/widget/SlidingButton;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    invoke-virtual {p2, v0}, Lmiui/widget/SlidingButton;->setOnPerformCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_0
    return-void
.end method
