.class Lcom/miui/gallery/activity/HomePageActivity$1;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageActivity;->setupActionBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$1;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$1;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/HomePageActivity;->mActionBar:Lmiui/app/ActionBar;

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageActivity$1;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->getFragmentAt(I)Landroid/app/Fragment;

    move-result-object v0

    instance-of v1, v0, Lcom/miui/gallery/ui/BaseFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/ui/BaseFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BaseFragment;->getPageName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$1;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$100(Lcom/miui/gallery/activity/HomePageActivity;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageActivity$1;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageActivity;->access$200(Lcom/miui/gallery/activity/HomePageActivity;)Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->showImmersionMenu(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
