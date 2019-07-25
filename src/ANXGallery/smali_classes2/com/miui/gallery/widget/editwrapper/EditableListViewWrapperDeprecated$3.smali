.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    instance-of p1, p2, Lcom/miui/gallery/ui/Checkable;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)I

    move-result p1

    if-ge p3, p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)I

    move-result p1

    sub-int p1, p3, p1

    iget-object p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckState(I)Z

    move-result p3

    xor-int/lit8 p3, p3, 0x1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setCheckState(IZ)V

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {v0, p3}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/view/ActionMode;

    move-result-object v1

    move v2, p1

    move-wide v3, p4

    move v5, p3

    invoke-interface/range {v0 .. v5}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V

    instance-of p4, p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz p4, :cond_1

    move-object p4, p2

    check-cast p4, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {p4}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object p4

    iget-object p5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    move-result-object p5

    invoke-virtual {p5, p4, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;I)V

    :cond_1
    if-eqz p3, :cond_2

    instance-of p1, p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    move-result-object p1

    check-cast p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startPickingNumberAnimation(Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method
