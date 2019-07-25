.class Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NFCManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;
    }
.end annotation


# instance fields
.field private mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    invoke-direct {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    return-void
.end method


# virtual methods
.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    :cond_0
    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    return-void
.end method
