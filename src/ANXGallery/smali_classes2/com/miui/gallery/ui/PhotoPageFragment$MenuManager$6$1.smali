.class Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public downloadSuccess(Ljava/lang/String;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->access$4100(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;)V

    return-void
.end method
