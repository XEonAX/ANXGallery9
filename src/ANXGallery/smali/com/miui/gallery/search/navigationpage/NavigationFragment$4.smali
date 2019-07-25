.class Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;
.super Ljava/lang/Object;
.source "NavigationFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/navigationpage/NavigationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/search/SearchStatusLoader;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-static {p2}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->access$600(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->access$700(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/search/SearchStatusLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->access$500(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/StatusHandleHelper;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/StatusHandleHelper;->updateBaseStatus(I)V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->onLoadFinished(Landroid/content/Loader;Ljava/lang/Integer;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->access$500(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/StatusHandleHelper;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/StatusHandleHelper;->updateBaseStatus(I)V

    return-void
.end method
