.class Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;
.super Ljava/lang/Object;
.source "Crop.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TranslateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return-void
.end method


# virtual methods
.method public onTranslate(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method public onTranslateBegin()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->TRANSLATE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return v2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return v2

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public onTranslateEnd()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->fixImageBounds(Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    return-void
.end method
