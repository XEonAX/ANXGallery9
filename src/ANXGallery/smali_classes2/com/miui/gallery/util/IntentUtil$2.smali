.class final Lcom/miui/gallery/util/IntentUtil$2;
.super Ljava/lang/Object;
.source "IntentUtil.java"

# interfaces
.implements Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/IntentUtil;->doCreation(Landroid/app/Activity;ILjava/util/List;Lcom/miui/gallery/picker/helper/Picker$ImageType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$creationOps:I


# direct methods
.method constructor <init>(ILandroid/app/Activity;)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$creationOps:I

    iput-object p2, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->access$400()V

    return-void
.end method

.method public onSuccess([Landroid/net/Uri;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;",
            ">;)V"
        }
    .end annotation

    iget v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$creationOps:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/miui/gallery/util/PrintInstallHelper;->printPhotos(Landroid/app/Activity;[Landroid/net/Uri;Ljava/util/List;)V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->checkAbleOrDownload(Landroid/app/Activity;)Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance p2, Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    const-class v1, Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-static {v0, p2, p1}, Lcom/miui/gallery/util/IntentUtil;->access$500(Landroid/app/Activity;Landroid/content/Intent;[Landroid/net/Uri;)V

    goto :goto_0

    :pswitch_2
    const/4 p2, 0x0

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportMeituCollage()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/IntentUtil;->startMeituCollageAction(Landroid/app/Activity;Ljava/util/List;I)Z

    move-result p2

    :cond_0
    if-nez p2, :cond_1

    new-instance p2, Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    const-class v1, Lcom/miui/gallery/collage/CollageActivity;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/miui/gallery/util/IntentUtil$2;->val$activity:Landroid/app/Activity;

    invoke-static {v0, p2, p1}, Lcom/miui/gallery/util/IntentUtil;->access$500(Landroid/app/Activity;Landroid/content/Intent;[Landroid/net/Uri;)V

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
