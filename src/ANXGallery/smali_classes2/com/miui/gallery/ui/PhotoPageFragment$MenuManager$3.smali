.class Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onMenuItemClick(Landroid/view/MenuItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

.field final synthetic val$current:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;->val$current:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;->val$current:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;->val$current:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->access$3900(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method
