.class Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;
.super Ljava/lang/Object;
.source "SlimPhotoPickFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SlimPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->access$000(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController;->start([J)V

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/activity/PhotoSlimActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "slimCount"

    array-length p1, p1

    int-to-float p1, p1

    sget-object v2, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->SLIM_COUNT_STAGE:[I

    invoke-static {p1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "cleaner"

    const-string v1, "cleaner_slim_used"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->finish()V

    return-void
.end method
