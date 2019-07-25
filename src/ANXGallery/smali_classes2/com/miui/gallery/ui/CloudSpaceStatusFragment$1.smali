.class Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;
.super Ljava/lang/Object;
.source "CloudSpaceStatusFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->refresh(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/IntentUtil;->gotoMiCloudVipPage(Landroid/content/Context;)V

    const-string p1, "Sync"

    const-string v0, "sync_cloud_space_enlarge"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
