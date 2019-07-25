.class Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;
.super Ljava/lang/Object;
.source "MovieLibraryLoaderHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->startDownloadWithCheck(Landroid/app/Activity;Lcom/miui/gallery/assistant/library/Library;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

.field final synthetic val$downloadStartListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;

.field final synthetic val$library:Lcom/miui/gallery/assistant/library/Library;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Lcom/miui/gallery/assistant/library/Library;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    iput-object p2, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->val$library:Lcom/miui/gallery/assistant/library/Library;

    iput-object p3, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->val$downloadStartListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->access$100(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;ZI)V

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    iget-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->val$library:Lcom/miui/gallery/assistant/library/Library;

    iget-object v1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;->val$downloadStartListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;

    const/4 v2, 0x1

    invoke-static {p1, v0, v2, v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->access$000(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V

    return-void
.end method
