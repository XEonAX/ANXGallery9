.class Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;
.super Ljava/lang/Object;
.source "CloudSpaceStatusFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CloudSpaceStatusFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SpaceStatusLoaderCallBack"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
            ">;",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
            ")V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->access$200(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
