.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;
.super Ljava/lang/Object;
.source "EditableListViewWrapper.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->startActionMode()V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setLongTouchPosition(I)V

    const/4 p1, 0x1

    return p1
.end method
