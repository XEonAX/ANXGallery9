.class Lcom/miui/gallery/util/MovieLibraryLoaderHelper$2;
.super Ljava/lang/Object;
.source "MovieLibraryLoaderHelper.java"

# interfaces
.implements Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$2;->this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadProgress(JI)V
    .locals 0

    return-void
.end method

.method public onDownloadResult(JI)V
    .locals 1

    const-string p1, "MovieLibraryLoaderHelper"

    const-string p2, "download result %d"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$2;->this$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    if-nez p3, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->access$100(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;ZI)V

    return-void
.end method
