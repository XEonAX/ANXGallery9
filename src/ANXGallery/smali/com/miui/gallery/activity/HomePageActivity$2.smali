.class Lcom/miui/gallery/activity/HomePageActivity$2;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$MenuItemsCheckListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/activity/HomePageActivity;
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

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$2;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemsChecked(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$2;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/HomePageActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const v1, 0x7f0901da

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method
