.class Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$2;
.super Ljava/lang/Object;
.source "ScreenDoodleMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public updateProgress(Landroid/view/View;I)V
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method
