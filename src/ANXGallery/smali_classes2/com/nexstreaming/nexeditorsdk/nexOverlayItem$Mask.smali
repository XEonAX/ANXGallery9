.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;
.super Ljava/lang/Object;
.source "nexOverlayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Mask"
.end annotation


# static fields
.field public static final kSplit_Bottom:I = 0x4

.field public static final kSplit_Left:I = 0x1

.field public static final kSplit_LeftBottom:I = 0x7

.field public static final kSplit_LeftTop:I = 0x5

.field public static final kSplit_Right:I = 0x2

.field public static final kSplit_RightBottom:I = 0x8

.field public static final kSplit_RightTop:I = 0x6

.field public static final kSplit_Top:I = 0x3


# instance fields
.field private angle:I

.field private maskImage:Landroid/graphics/Bitmap;

.field private onOff:Z

.field private rectPosition:Landroid/graphics/Rect;

.field private splitMode:I

.field private syncAnimationOverlayItem:Z

.field final synthetic this$0:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

.field private vertical:Z


# direct methods
.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->this$0:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    return-void
.end method

.method static synthetic access$000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->onOff:Z

    return p0
.end method

.method static synthetic access$100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->syncAnimationOverlayItem:Z

    return p0
.end method


# virtual methods
.method public getAngle()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->angle:I

    return v0
.end method

.method public getAnimateSyncFromOverlayItem()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->syncAnimationOverlayItem:Z

    return v0
.end method

.method public getMaskImage()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->maskImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getPosition(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    return-void
.end method

.method public getSplitMode()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->splitMode:I

    return v0
.end method

.method public getState()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->onOff:Z

    return v0
.end method

.method public height()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public setAngle(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->angle:I

    return-void
.end method

.method public setAnimateSyncFromOverlayItem(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->syncAnimationOverlayItem:Z

    return-void
.end method

.method public setMaskImage(Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->maskImage:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setPosition(IIII)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->splitMode:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p4, v0, Landroid/graphics/Rect;->bottom:I

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p4, Landroid/graphics/Rect;->top:I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p1, p2, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p3, p1, Landroid/graphics/Rect;->right:I

    return-void
.end method

.method public setPosition(Landroid/graphics/Rect;)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->splitMode:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    iput p1, v0, Landroid/graphics/Rect;->right:I

    return-void
.end method

.method public setSplitMode(IZ)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->splitMode:I

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->vertical:Z

    if-ne v0, p2, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->splitMode:I

    iput-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->vertical:Z

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object p2

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result p2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v0

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v1, v0, 0x2

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v1, p2, 0x2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v2, v0, 0x2

    iput v2, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 p2, p2, 0x2

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v1, p2, 0x2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v0, v0, 0x2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 p2, p2, 0x2

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v0, v0, 0x2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :pswitch_4
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v2, v0, 0x2

    iput v2, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :pswitch_5
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v0, v0, 0x2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :pswitch_6
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 v1, p2, 0x2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :pswitch_7
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    div-int/lit8 p2, p2, 0x2

    iput p2, p1, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setState(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->onOff:Z

    return-void
.end method

.method public width()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->rectPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method
