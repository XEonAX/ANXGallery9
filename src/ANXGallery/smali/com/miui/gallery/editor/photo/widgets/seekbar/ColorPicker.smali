.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
.super Landroid/widget/SeekBar;
.source "ColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;,
        Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;,
        Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;
    }
.end annotation


# static fields
.field public static COLORS:[I

.field private static MAX_LEVEL:I


# instance fields
.field private mDelegator:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;

.field private mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->COLORS:[I

    const/16 v0, 0x2710

    sput v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->MAX_LEVEL:I

    return-void

    nop

    :array_0
    .array-data 4
        -0xff8d01
        -0x5de06
        -0xd0d1
        -0x8bd9
        -0x4000
        -0xd515d6
        -0xf42001
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->init()V

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    sget v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->MAX_LEVEL:I

    return v0
.end method

.method private init()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0601fc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;-><init>(FLandroid/content/res/Resources;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060103

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->setIntrinsicWidth(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->setIntrinsicHeight(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumb(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public findProgressByColor(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;->findLevel(I)I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getMax()I

    move-result v0

    mul-int p1, p1, v0

    sget v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->MAX_LEVEL:I

    div-int/2addr p1, v0

    return p1
.end method

.method public getColor()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;->getColor()I

    move-result v0

    return v0
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;-><init>(Landroid/graphics/drawable/BitmapDrawable;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;-><init>(Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;

    :cond_1
    :goto_0
    return-void
.end method

.method public setThumbColor(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->mThumbDrawable:Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->setColor(I)V

    return-void
.end method
