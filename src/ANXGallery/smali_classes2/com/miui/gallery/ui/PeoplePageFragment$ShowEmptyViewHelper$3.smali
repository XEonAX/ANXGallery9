.class Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showSwitchClosedTips()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setFaceAlbumStatus(Landroid/content/Context;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->access$200(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object v2, v2, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$300(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x8

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    const-string p1, "people"

    const-string v0, "people_open_switch"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
