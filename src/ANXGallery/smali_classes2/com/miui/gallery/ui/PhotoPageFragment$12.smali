.class Lcom/miui/gallery/ui/PhotoPageFragment$12;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;->downloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

.field final synthetic val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

.field final synthetic val$item:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->access$2600(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;ZZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$12;->val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2700(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V

    return-void
.end method
