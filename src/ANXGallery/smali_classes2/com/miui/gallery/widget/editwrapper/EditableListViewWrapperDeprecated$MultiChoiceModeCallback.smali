.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MultiChoiceModeCallback"
.end annotation


# instance fields
.field private mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-object p0
.end method


# virtual methods
.method public hasWrappedCallback()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    packed-switch p2, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result p2

    xor-int/2addr p2, v1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAllItemsCheckState(Z)V

    return v1

    :pswitch_1
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    return v1

    :pswitch_data_0
    .packed-switch 0x1020019
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    :cond_0
    sget p2, Lmiui/R$string;->select_item:I

    invoke-virtual {p1, p2}, Landroid/view/ActionMode;->setTitle(I)V

    instance-of p2, p1, Lmiui/view/EditActionMode;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/AbsListView;->getContext()Landroid/content/Context;

    move-result-object p2

    check-cast p1, Lmiui/view/EditActionMode;

    const v1, 0x1020019

    const/4 v2, 0x3

    invoke-static {p2, p1, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Lmiui/view/EditActionMode;II)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/AbsListView;->getContext()Landroid/content/Context;

    move-result-object p2

    const v1, 0x102001a

    invoke-static {p2, p1, v1, v0}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Lmiui/view/EditActionMode;II)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1602(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Z)Z

    return p2
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1702(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lmiui/view/EditActionMode;)Lmiui/view/EditActionMode;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1002(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Landroid/view/ActionMode;)Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1802(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onDestroyActionMode(Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1602(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Z)Z

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public setWrapped(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->mWrapped:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-void
.end method
