.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;
.super Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;
.source "DialogStyleMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;",
        "Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field private mAlignButton:Landroid/widget/TextView;

.field private final mAlignCenterDrawable:Landroid/graphics/drawable/Drawable;

.field private final mAlignCenterString:Ljava/lang/String;

.field private mAlignIndex:I

.field private final mAlignLeftDrawable:Landroid/graphics/drawable/Drawable;

.field private final mAlignLeftString:Ljava/lang/String;

.field private final mAlignRightDrawable:Landroid/graphics/drawable/Drawable;

.field private final mAlignRightString:Ljava/lang/String;

.field private mBoldButton:Landroid/widget/TextView;

.field private mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

.field private mShadowButton:Landroid/widget/TextView;

.field private mTransparentSeekBar:Landroid/widget/SeekBar;

.field private mWholeView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V
    .locals 2

    const v0, 0x7f1006d8

    const v1, 0x7f0702af

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;II)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0702a9

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignLeftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0702a8

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignCenterDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0702aa

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignRightDrawable:Landroid/graphics/drawable/Drawable;

    const p2, 0x7f1006da

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignLeftString:Ljava/lang/String;

    const p2, 0x7f1006d9

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignCenterString:Ljava/lang/String;

    const p2, 0x7f1006db

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignRightString:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    return-object p0
.end method

.method private initView(Landroid/content/Context;)V
    .locals 5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060103

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    sget-object v3, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->COLORS:[I

    invoke-direct {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;-><init>([I)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0601fc

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;-><init>(FLandroid/content/res/Resources;)V

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->setIntrinsicHeight(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getLayerType()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1, v2}, Landroid/widget/SeekBar;->setLayerType(ILandroid/graphics/Paint;)V

    :cond_0
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/view/View;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    aput-object v4, v0, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignButton:Landroid/widget/TextView;

    aput-object v4, v0, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mBoldButton:Landroid/widget/TextView;

    aput-object v3, v0, v1

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->setViewClickListener([Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f0b006b

    invoke-static {p1, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v3, 0x7f060330

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;

    invoke-direct {v3, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;)V

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;

    invoke-direct {v4, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;)V

    invoke-direct {v1, v0, p1, v3, v4}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method private setAlignButton(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 5

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$2;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$utils$AutoLineLayout$TextAlignment:[I

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    move-object v0, v1

    move-object v2, v0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignRightString:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignRightDrawable:Landroid/graphics/drawable/Drawable;

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignCenterDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignCenterString:Ljava/lang/String;

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignLeftDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignLeftString:Ljava/lang/String;

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignButton:Landroid/widget/TextView;

    invoke-virtual {v3, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private varargs setViewClickListener([Landroid/view/View;)V
    .locals 3

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected initSubMenuView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .locals 3

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0170

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e3

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e6

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/SeekBar;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e5

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e1

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignButton:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e2

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mBoldButton:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->initView(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mWholeView:Landroid/view/ViewGroup;

    return-object p1
.end method

.method public initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->findProgressByColor(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mColorPickSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgress(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mTransparentSeekBar:Landroid/widget/SeekBar;

    int-to-float v2, v0

    iget v3, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    mul-float v2, v2, v3

    float-to-int v2, v2

    sub-int/2addr v0, v2

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mBoldButton:Landroid/widget/TextView;

    iget-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    iget-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->setAlignButton(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method public bridge synthetic initializeData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0902e5

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mBoldButton:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->isSelected()Z

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mBoldButton:Landroid/widget/TextView;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onBoldChange(Z)V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    array-length v1, p1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mAlignIndex:I

    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->setAlignButton(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onTextAlignChange(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->isSelected()Z

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mShadowButton:Landroid/widget/TextView;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onShadowChange(Z)V

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0902e1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result p3

    const v0, 0x7f0902e6

    if-eq p3, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast p3, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    sub-int/2addr p1, p2

    invoke-interface {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onTransparentChange(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result v0

    const v1, 0x7f0902e6

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    sub-int/2addr v1, p1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onTransparentChange(I)V

    :cond_1
    :goto_0
    return-void
.end method
