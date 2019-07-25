.class Lcom/miui/gallery/assistant/library/LibraryManager$2;
.super Ljava/lang/Object;
.source "LibraryManager.java"

# interfaces
.implements Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/assistant/library/LibraryManager;->tryDownloadAllLibrarys()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/assistant/library/LibraryManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/assistant/library/LibraryManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$2;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadProgress(JI)V
    .locals 0

    return-void
.end method

.method public onDownloadResult(JI)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$800()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Library %d download result:%d."

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$2;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    sget-object p2, Lcom/miui/gallery/assistant/library/LibraryConstants;->sStoryLibraries:[Ljava/lang/Long;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/LibraryManager;->isLibrarysExist([Ljava/lang/Long;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccount()Landroid/accounts/Account;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/CardManager;->triggerGuaranteeScenarios(Z)V

    :cond_0
    return-void
.end method
