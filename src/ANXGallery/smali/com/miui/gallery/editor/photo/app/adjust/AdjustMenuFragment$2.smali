.class Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$2;
.super Ljava/lang/Object;
.source "AdjustMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
        "Landroid/widget/TextView;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic updateProgress(Landroid/view/View;I)V
    .locals 0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$2;->updateProgress(Landroid/widget/TextView;I)V

    return-void
.end method

.method public updateProgress(Landroid/widget/TextView;I)V
    .locals 3

    const-string v0, "%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
