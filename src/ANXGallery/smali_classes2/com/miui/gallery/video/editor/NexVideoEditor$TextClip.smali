.class Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/NexVideoEditor$Change;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextClip"
.end annotation


# instance fields
.field private mShowTime:I

.field private mTextOverLayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field private x:I

.field private y:I


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    return-void
.end method

.method private constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iput p3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->initXY()V

    invoke-direct {p0, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->createTextNexOverLayItem(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mTextOverLayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;ILcom/miui/gallery/video/editor/NexVideoEditor$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;I)V

    return-void
.end method

.method private createTextNexOverLayItem(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
    .locals 10

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/content/Context;

    move-result-object v0

    const/16 v2, 0x3b

    invoke-direct {v1, v0, p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    const/4 p1, -0x1

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;->setTextColor(I)V

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;->setFontId(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getProjectTotalTime()I

    move-result v5

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    const/16 v8, 0x190

    const/16 v9, 0x7d0

    if-nez v0, :cond_0

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    const/4 v4, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;IIII)V

    invoke-static {v9, v8, v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    add-int/lit16 p1, v5, -0x7d0

    add-int/lit16 v4, p1, -0x190

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;IIII)V

    invoke-static {v9, v8, v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mShowTime:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    const/4 v4, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;IIII)V

    :cond_2
    :goto_0
    return-object p1
.end method

.method private delete(Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->getTextOverLayItem()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    invoke-direct {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->getTextOverLayItem()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->removeOverlay(I)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object p1

    const-string v0, "edit_type_auto_water_mark_text"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private getTextOverLayItem()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mTextOverLayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    return-object v0
.end method

.method private initXY()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2900(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$3000(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v1

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$3000(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

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

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    goto :goto_2

    :cond_2
    if-ne v0, v1, :cond_3

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    goto :goto_2

    :cond_3
    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->x:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->y:I

    :goto_2
    return-void
.end method


# virtual methods
.method public applyChange()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_auto_water_mark_text"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->delete(Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mTextOverLayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_auto_water_mark_text"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->mTextOverLayItem:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addOverlay(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->applyChange()V

    :cond_1
    return-void
.end method
