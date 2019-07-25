.class Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/activity/HomePageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallbackWrapper"
.end annotation


# instance fields
.field private mWrapped:Landroid/view/ActionMode$Callback;

.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageActivity;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/activity/HomePageActivity;Landroid/view/ActionMode$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->mWrapped:Landroid/view/ActionMode$Callback;

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->mWrapped:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->mWrapped:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->mWrapped:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$900(Lcom/miui/gallery/activity/HomePageActivity;)Lmiui/view/ViewPager;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageActivity;->access$900(Lcom/miui/gallery/activity/HomePageActivity;)Lmiui/view/ViewPager;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/view/ViewPager;->setDraggable(Z)V

    :cond_0
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$800(Lcom/miui/gallery/activity/HomePageActivity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/HomePageActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget v2, Lmiui/R$id;->view_pager:I

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v2, v0, Lmiui/view/ViewPager;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    check-cast v0, Lmiui/view/ViewPager;

    invoke-static {v2, v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$902(Lcom/miui/gallery/activity/HomePageActivity;Lmiui/view/ViewPager;)Lmiui/view/ViewPager;

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$900(Lcom/miui/gallery/activity/HomePageActivity;)Lmiui/view/ViewPager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lmiui/view/ViewPager;->setDraggable(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0, v1}, Lcom/miui/gallery/activity/HomePageActivity;->access$802(Lcom/miui/gallery/activity/HomePageActivity;Z)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$900(Lcom/miui/gallery/activity/HomePageActivity;)Lmiui/view/ViewPager;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$900(Lcom/miui/gallery/activity/HomePageActivity;)Lmiui/view/ViewPager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lmiui/view/ViewPager;->setDraggable(Z)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$CallbackWrapper;->mWrapped:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
