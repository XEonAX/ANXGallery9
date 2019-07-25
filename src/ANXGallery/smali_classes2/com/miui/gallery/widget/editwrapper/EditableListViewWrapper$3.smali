.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;
.super Ljava/lang/Object;
.source "EditableListViewWrapper.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


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

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 6

    instance-of p1, p2, Lcom/miui/gallery/ui/Checkable;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(I)Z

    move-result p1

    const/4 p6, 0x1

    xor-int/2addr p1, p6

    iget-object p7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object p7

    invoke-virtual {p7, p3, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->setCheckState(IZ)V

    move-object p7, p2

    check-cast p7, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {p7, p1}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    iget-object p7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iget-object p7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    move-result-object p7

    invoke-static {p7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object p7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Landroid/view/ActionMode;

    move-result-object v1

    move v2, p3

    move-wide v3, p4

    move v5, p1

    invoke-interface/range {v0 .. v5}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V

    instance-of p4, p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz p4, :cond_1

    move-object p4, p2

    check-cast p4, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {p4}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object p4

    iget-object p5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    move-result-object p5

    invoke-virtual {p5, p4, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;I)V

    :cond_1
    if-eqz p1, :cond_2

    instance-of p1, p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    move-result-object p1

    check-cast p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startPickingNumberAnimation(Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;)V

    :cond_2
    return p6
.end method
