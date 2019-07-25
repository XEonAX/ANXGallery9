.class Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;
.super Ljava/lang/Object;
.source "CropperActivity.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

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
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportLoader;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;->access$500(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)Lcom/miui/gallery/editor/photo/app/CropperActivity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;->access$500(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)Lcom/miui/gallery/editor/photo/app/CropperActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->access$600(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportLoader;-><init>(Lcom/miui/gallery/editor/photo/app/CropperActivity;Landroid/net/Uri;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Boolean;)V
    .locals 1

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;->access$500(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)Lcom/miui/gallery/editor/photo/app/CropperActivity;

    move-result-object p2

    const/4 v0, -0x1

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->setResult(ILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;->access$500(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)Lcom/miui/gallery/editor/photo/app/CropperActivity;

    move-result-object p1

    const p2, 0x7f100462

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;->access$500(Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;)Lcom/miui/gallery/editor/photo/app/CropperActivity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->finish()V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment$1;->onLoadFinished(Landroid/content/Loader;Ljava/lang/Boolean;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
