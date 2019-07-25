.class Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$2;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->getChoiceModeExitButtonClickListener()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onBackPressed()Z

    return-void
.end method
