.class Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;
.super Ljava/lang/Object;
.source "TextEditDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/utils/TextEditDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LayoutListener"
.end annotation


# instance fields
.field mHeight:I

.field mRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mHeight:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mRect:Landroid/graphics/Rect;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/utils/TextEditDialog;Lcom/miui/gallery/collage/utils/TextEditDialog$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;-><init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$600(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$700(Lcom/miui/gallery/collage/utils/TextEditDialog;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mRect:Landroid/graphics/Rect;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$800(Landroid/view/View;ILandroid/graphics/Rect;)I

    move-result v0

    const-string v1, "TextEditDialog"

    const-string v2, "widgetHeight : %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-gtz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mHeight:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->dismissSafely()V

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mHeight:I

    iget-object v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    iget v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;->mHeight:I

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$900(Lcom/miui/gallery/collage/utils/TextEditDialog;I)V

    :cond_1
    :goto_0
    return-void
.end method
