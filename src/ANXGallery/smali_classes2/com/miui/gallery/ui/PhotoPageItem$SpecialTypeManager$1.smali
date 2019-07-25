.class Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;
.super Lcom/miui/gallery/view/animation/AnimationListenerAdapter;
.source "PhotoPageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-direct {p0}, Lcom/miui/gallery/view/animation/AnimationListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->access$2700(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;)Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->access$2700(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method
