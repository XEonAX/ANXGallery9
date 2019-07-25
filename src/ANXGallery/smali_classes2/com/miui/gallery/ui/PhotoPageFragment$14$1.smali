.class Lcom/miui/gallery/ui/PhotoPageFragment$14$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$14;->onDownloadComplete(Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$14;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->downloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V

    return-void
.end method
