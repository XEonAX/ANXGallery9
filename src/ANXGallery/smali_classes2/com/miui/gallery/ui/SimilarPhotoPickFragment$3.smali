.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;
.super Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;
.source "SimilarPhotoPickFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/SimpleMultiChoiceModeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$700(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$800(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$900(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$3;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$900(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    return-void
.end method
