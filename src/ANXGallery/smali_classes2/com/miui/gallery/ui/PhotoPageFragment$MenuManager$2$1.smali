.class Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public downloadSuccess(Ljava/lang/String;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->access$3800(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;)V

    return-void
.end method
