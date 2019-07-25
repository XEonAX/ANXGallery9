.class Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;
.super Ljava/lang/Object;
.source "SlideShowFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SlideShowFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlideLoaderCallBack"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SlideShowFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/SlideShowFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/SlideShowFragment;Lcom/miui/gallery/ui/SlideShowFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;-><init>(Lcom/miui/gallery/ui/SlideShowFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    const-string p1, "photo_uri"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/loader/PhotoLoaderManager;->getInstance()Lcom/miui/gallery/loader/PhotoLoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/SlideShowFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lcom/miui/gallery/loader/PhotoLoaderManager;->getPhotoDataSet(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/loader/BaseLoader;

    move-result-object p1

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    check-cast p2, Lcom/miui/gallery/model/BaseDataSet;

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideShowFragment;->access$400(Lcom/miui/gallery/ui/SlideShowFragment;)Lcom/miui/gallery/adapter/SlideShowAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->getShowIndex()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_init_position"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideShowFragment;->access$400(Lcom/miui/gallery/ui/SlideShowFragment;)Lcom/miui/gallery/adapter/SlideShowAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->getShowIndex()I

    move-result p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SlideShowFragment;->access$400(Lcom/miui/gallery/ui/SlideShowFragment;)Lcom/miui/gallery/adapter/SlideShowAdapter;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->changeDataSet(Lcom/miui/gallery/model/BaseDataSet;I)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
