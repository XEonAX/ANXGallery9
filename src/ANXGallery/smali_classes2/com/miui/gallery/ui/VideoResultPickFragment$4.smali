.class Lcom/miui/gallery/ui/VideoResultPickFragment$4;
.super Ljava/lang/Object;
.source "VideoResultPickFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/VideoResultPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$4;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$4;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$200(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$4;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$200(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAllItemsCheckState(Z)V

    if-nez p1, :cond_0

    const-string p1, "cleaner"

    const-string v0, "similar_keep_clear_cancel"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
