.class Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;
.super Ljava/lang/Object;
.source "PhotoDetailFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DetailLoaderCallBack"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/ui/PhotoDetailFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;-><init>(Lcom/miui/gallery/ui/PhotoDetailFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    new-instance p1, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$300(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/model/BaseDataItem;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    check-cast p2, Lcom/miui/gallery/model/PhotoDetailInfo;

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$002(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/model/PhotoDetailInfo;)Lcom/miui/gallery/model/PhotoDetailInfo;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$000(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->access$400(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/model/PhotoDetailInfo;)V

    :cond_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
