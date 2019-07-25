.class public abstract Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;
.super Landroid/app/Fragment;
.source "AbstractNaviFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;,
        Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;
    }
.end annotation


# static fields
.field private static final VIEW_RELATIVE_Y:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static sAnimAppearDelay:I

.field private static sAnimAppearDuration:I

.field private static sAnimDisappearDuration:I

.field private static sAnimOffset:I


# instance fields
.field mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;",
            ">;"
        }
    .end annotation
.end field

.field private mExportable:Z

.field private mNavigatorCreated:Z

.field private mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$2;

    const-class v1, Ljava/lang/Float;

    const-string v2, "relative_y"

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$2;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->VIEW_RELATIVE_Y:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701da

    const v5, 0x7f10051d

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701d6

    const v5, 0x7f100512

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701d8

    const v5, 0x7f100517

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    const v5, 0x7f0701d9

    const v6, 0x7f10051c

    invoke-direct {v2, v5, v6, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    const v5, 0x7f0701de

    const v6, 0x7f100541

    invoke-direct {v2, v5, v6, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    const v5, 0x7f0701d7

    const v6, 0x7f100513

    invoke-direct {v2, v5, v6, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    const v5, 0x7f100521

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701df

    const v5, 0x7f10055a

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701dc

    const v5, 0x7f100531

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701dd

    const v5, 0x7f10053e

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f070190

    const v5, 0x7f100522

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    const v4, 0x7f0701db

    const v5, 0x7f10051f

    invoke-direct {v2, v4, v5, v3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    return-void
.end method

.method private initialize()V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "content"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mData:Ljava/util/List;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    array-length v2, v2

    if-le v1, v2, :cond_0

    const-string v2, "AbstractNaviFragment"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid effect index of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mData:Ljava/util/List;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mSupportedData:[Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    aget-object v1, v3, v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected final getNaviData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mData:Ljava/util/List;

    return-object v0
.end method

.method protected final notifyNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;->onNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    if-eqz p1, :cond_4

    sget p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimOffset:I

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060333

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimOffset:I

    :cond_0
    sget p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDuration:I

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0034

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDuration:I

    :cond_1
    sget p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimDisappearDuration:I

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0035

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimDisappearDuration:I

    :cond_2
    sget p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDelay:I

    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0033

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDelay:I

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->initialize()V

    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "illegal state: no callbacks bound"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreateAnimator(IZI)Landroid/animation/Animator;
    .locals 5

    const-string v0, "AbstractNaviFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreateAnimator:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p3, 0x2002

    if-ne p3, p1, :cond_0

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    const/4 p3, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p2, :cond_1

    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v3, v2, [F

    sget v4, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimOffset:I

    neg-int v4, v4

    int-to-float v4, v4

    aput v4, v3, v1

    aput p3, v3, v0

    invoke-static {p2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v2, [F

    fill-array-data v4, :array_0

    invoke-static {v3, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, v2, v1

    aput-object v3, v2, v0

    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/view/View;->setAlpha(F)V

    sget p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDelay:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    sget p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimAppearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    sget-object p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->VIEW_RELATIVE_Y:Landroid/util/Property;

    new-array v3, v2, [F

    aput p3, v3, v1

    sget p3, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimOffset:I

    neg-int p3, p3

    int-to-float p3, p3

    aput p3, v3, v0

    invoke-static {p2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    sget-object p3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v3, v2, [F

    fill-array-data v3, :array_1

    invoke-static {p3, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, v2, v1

    aput-object p3, v2, v0

    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance p2, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->sAnimDisappearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    :goto_0
    return-object p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method protected onCreateNavigator(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onCreateNavigator(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mNavigatorCreated:Z

    return-object p1
.end method

.method protected onNavigatorCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mNavigatorCreated:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onNavigatorCreated(Landroid/view/View;Landroid/os/Bundle;)V

    :cond_0
    const p2, 0x7f09010b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mExportable:Z

    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0900dc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method setExportEnabled(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09010b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    goto :goto_0

    :cond_0
    const-string v0, "AbstractNaviFragment"

    const-string v1, "shouldn\'t call when not visible"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mExportable:Z

    return-void
.end method
