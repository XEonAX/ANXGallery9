.class Lcom/miui/gallery/ui/PeoplePageFragment$5;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mMode:Landroid/view/ActionMode;

.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private enableOrDisableMenuItem(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v0

    const v1, 0x7f090014

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_0
    const v1, 0x7f090010

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_1
    const v1, 0x7f09001e

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_2
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const p2, 0x7f090010

    if-eq p1, p2, :cond_2

    const p2, 0x7f090014

    if-eq p1, p2, :cond_1

    const p2, 0x7f09001e

    if-eq p1, p2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2700(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2500(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2600(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)Z

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$5;->enableOrDisableMenuItem(Z)V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c0010

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0008

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$5;->enableOrDisableMenuItem(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->enterChoiceMode()V

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->mMode:Landroid/view/ActionMode;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->exitChoiceMode()V

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$5;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$5;->enableOrDisableMenuItem(Z)V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
