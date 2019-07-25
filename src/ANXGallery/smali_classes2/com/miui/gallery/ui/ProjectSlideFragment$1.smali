.class Lcom/miui/gallery/ui/ProjectSlideFragment$1;
.super Ljava/lang/Object;
.source "ProjectSlideFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ProjectSlideFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ProjectSlideFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ProjectSlideFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProjectSlideFragment$1;->this$0:Lcom/miui/gallery/ui/ProjectSlideFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/ProjectSlideFragment$1;->this$0:Lcom/miui/gallery/ui/ProjectSlideFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ProjectSlideFragment;->access$000(Lcom/miui/gallery/ui/ProjectSlideFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProjectSlideFragment$1;->this$0:Lcom/miui/gallery/ui/ProjectSlideFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProjectSlideFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->popBackStack()V

    return-void
.end method
