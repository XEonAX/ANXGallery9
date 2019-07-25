.class Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/NexVideoEditor$Change;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WaterMark"
.end annotation


# instance fields
.field private anchorPoint:I

.field private mAlphaDurationTime:I

.field private mEndTime:I

.field private mStartTime:I

.field private mTemplateId:Ljava/lang/String;

.field private mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

.field private mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

.field private scale:F

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field private timeType:I

.field private x:I

.field private y:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->anchorPoint:I

    const/16 p1, 0x190

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mAlphaDurationTime:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->anchorPoint:I

    const/16 p1, 0x190

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mAlphaDurationTime:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    iput p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    iput-object p3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mTemplateId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->initOverLayItemParams()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->initOverLayItem()V

    return-void
.end method

.method private delete(Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->removeOverlay(I)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object p1

    const-string v0, "edit_type_water_mark"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private initOverLayItem()V
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getProjectTotalTime()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mTemplateId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-nez v0, :cond_0

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayPreset(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;

    move-result-object v0

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mTemplateId:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget v5, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->anchorPoint:I

    const/4 v6, 0x0

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    int-to-float v7, v3

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    int-to-float v8, v3

    iget v9, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iget v10, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    move-object v3, v0

    invoke-direct/range {v3 .. v10}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IZFFII)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getDefaultDuration()I

    move-result v0

    add-int/lit16 v0, v0, 0x5dc

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mAlphaDurationTime:I

    invoke-static {v0, v3, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    goto/16 :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_1

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayPreset(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mTemplateId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->anchorPoint:I

    const/4 v4, 0x0

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    int-to-float v5, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    int-to-float v6, v1

    iget v7, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iget v8, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IZFFII)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->timeType:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    const/16 v0, 0x320

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayPreset(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mTemplateId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    sub-int/2addr v3, v0

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getDefaultDuration()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/lit16 v3, v3, -0x3e8

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget-object v5, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget v6, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->anchorPoint:I

    const/4 v7, 0x0

    iget v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    int-to-float v8, v4

    iget v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    int-to-float v9, v4

    iget v10, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mStartTime:I

    iget v11, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mEndTime:I

    move-object v4, v3

    invoke-direct/range {v4 .. v11}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IZFFII)V

    iput-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlay:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getDefaultDuration()I

    move-result v3

    add-int/lit16 v3, v3, 0x1f4

    invoke-static {v3, v0, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    invoke-virtual {v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setScale(FF)V

    :cond_3
    return-void
.end method

.method private initOverLayItemParams()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2900(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$3000(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v1

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$3000(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2900(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v1

    :goto_1
    const/high16 v2, 0x44340000    # 720.0f

    const/16 v3, 0x168

    if-le v0, v1, :cond_2

    int-to-float v0, v0

    int-to-float v1, v1

    div-float/2addr v0, v1

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    div-int/lit8 v1, v0, 0x2

    iput v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    const v1, 0x44728000    # 970.0f

    int-to-float v0, v0

    div-float/2addr v1, v0

    iput v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    goto :goto_2

    :cond_2
    const v4, 0x3f1374bc    # 0.576f

    if-ne v0, v1, :cond_3

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    iput v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    goto :goto_2

    :cond_3
    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->x:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->y:I

    iput v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->scale:F

    :goto_2
    return-void
.end method


# virtual methods
.method public applyChange()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_water_mark"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->delete(Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_water_mark"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->mWaterMarkOverlayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addOverlay(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->applyChange()V

    const-string v0, "NexVideoEditor"

    const-string v1, "WaterMark change: have  smartEffect;"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "bg_audio"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;->applyChange()V

    const-string v0, "NexVideoEditor"

    const-string v1, "WaterMark change: have  audio;"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "filter"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->applyChange()V

    const-string v0, "NexVideoEditor"

    const-string v1, "WaterMark change: have  filter;"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-void
.end method
