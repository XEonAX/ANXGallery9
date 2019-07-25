.class Lcom/miui/gallery/picker/PickGalleryActivity$2;
.super Ljava/lang/Object;
.source "PickGalleryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickGalleryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickGalleryActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$2;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$2;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    const p2, 0x7f100598

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$2;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1100(Lcom/miui/gallery/picker/PickGalleryActivity;Z)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$2;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1200(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    return-void
.end method
