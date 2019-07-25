.class Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SelectableDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChildrenState"
.end annotation


# instance fields
.field private mChangingConfigurations:I

.field private mNormal:Landroid/graphics/drawable/Drawable;

.field private mSelect:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method private constructor <init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    iget p1, p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mChangingConfigurations:I

    iput p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mChangingConfigurations:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mChangingConfigurations:I

    return p1
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mChangingConfigurations:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method mutate()Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;-><init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mNormal:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mSelect:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;-><init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;)V

    return-object v0
.end method
