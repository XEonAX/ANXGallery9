.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;
.super Ljava/lang/Object;
.source "nexOverlayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoundInfo"
.end annotation


# instance fields
.field private angleX:F

.field private angleY:F

.field private angleZ:F

.field private drawPosition:Landroid/graphics/Rect;

.field private height:I

.field private mask:Landroid/graphics/Rect;

.field private maskOn:Z

.field private scaleX:F

.field private scaleY:F

.field final synthetic this$0:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

.field private time:I

.field private width:I

.field private x:F

.field private y:F


# direct methods
.method private constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->this$0:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;I)V
    .locals 7

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->this$0:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->time:I

    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleX:F

    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleY:F

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;Z)[I

    move-result-object v0

    aget v1, v0, p2

    int-to-float v1, v1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    const/4 v1, 0x1

    aget v0, v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleX:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleY:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleZ:F

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    const/4 v2, 0x2

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getAnchorPoint()I

    move-result v0

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    invoke-static {v0, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1200(III)Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1300(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1300(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    new-instance v0, Landroid/graphics/Rect;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    neg-int v3, v3

    div-int/2addr v3, v2

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    neg-int v4, v4

    div-int/2addr v4, v2

    iget v5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    div-int/2addr v5, v2

    iget v6, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    div-int/2addr v6, v2

    invoke-direct {v0, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    :goto_0
    iput-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->maskOn:Z

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    move-result-object p2

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->access$000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    move-result-object p2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getPosition(Landroid/graphics/Rect;)V

    :cond_1
    iget-object p2, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    if-eqz p2, :cond_5

    iget-object p2, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->time:I

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    sub-int/2addr v3, v4

    iget v4, v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    if-gt v4, v3, :cond_2

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getEndTime()I

    move-result v4

    if-le v4, v3, :cond_2

    instance-of v4, v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;

    if-eqz v4, :cond_3

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v4

    if-nez v4, :cond_2

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    invoke-virtual {v0, v3, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getTranslatePosition(II)F

    move-result v5

    add-float/2addr v4, v5

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    invoke-virtual {v0, v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getTranslatePosition(II)F

    move-result v0

    add-float/2addr v4, v0

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    goto :goto_1

    :cond_3
    instance-of v4, v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;

    if-eqz v4, :cond_4

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v4

    if-nez v4, :cond_2

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    invoke-virtual {v0, v3, v4, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result v4

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleX:F

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    invoke-virtual {v0, v3, v4, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result v4

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleY:F

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    const/4 v5, 0x3

    invoke-virtual {v0, v3, v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleZ:F

    goto :goto_1

    :cond_4
    instance-of v4, v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;

    if-eqz v4, :cond_2

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->access$1500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v4

    if-nez v4, :cond_2

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    invoke-virtual {v0, v3, v4, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScaledRatio(IFI)F

    move-result v4

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleX:F

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    invoke-virtual {v0, v3, v4, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScaledRatio(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleY:F

    goto/16 :goto_1

    :cond_5
    return-void
.end method

.method synthetic constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;ILcom/nexstreaming/nexeditorsdk/nexOverlayItem$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    return p0
.end method

.method static synthetic access$1800(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    return p0
.end method

.method static synthetic access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleX:F

    return p0
.end method

.method static synthetic access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleY:F

    return p0
.end method

.method static synthetic access$2100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleZ:F

    return p0
.end method


# virtual methods
.method public getAngle()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleZ:F

    return v0
.end method

.method public getAngleX()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleX:F

    return v0
.end method

.method public getAngleY()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleY:F

    return v0
.end method

.method public getDrawBound(Landroid/graphics/Rect;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    return v0
.end method

.method public getMaskBound(Landroid/graphics/Rect;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public getMaskState()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->maskOn:Z

    return v0
.end method

.method public getScaleX()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleY:F

    return v0
.end method

.method public getTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->time:I

    return v0
.end method

.method public getTranslateX()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    return v0
.end method

.method public getTranslateY()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BoundInfo{scaleX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleX:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", scaleY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->scaleY:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", x="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", y="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", angleX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleX:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", angleY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleY:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", angleZ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->angleZ:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->time:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", maskOn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->maskOn:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mask="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->mask:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", drawPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->drawPosition:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
