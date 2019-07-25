.class Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NfcUpdateTask"
.end annotation


# instance fields
.field private mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mNfcAdapter:Landroid/nfc/NfcAdapter;

.field private mUpdateItem:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private getNfcAdapter()Landroid/nfc/NfcAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    if-nez v1, :cond_0

    :try_start_0
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/nfc/NfcAdapter;->getDefaultAdapter(Landroid/content/Context;)Landroid/nfc/NfcAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mNfcAdapter:Landroid/nfc/NfcAdapter;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PhotoPageFragment"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    return-object v0
.end method


# virtual methods
.method public release()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    return-void
.end method

.method public final run()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->getNfcAdapter()Landroid/nfc/NfcAdapter;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mUpdateItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Landroid/net/Uri;

    const/4 v4, 0x0

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v3, v4

    invoke-virtual {v1, v3, v0}, Landroid/nfc/NfcAdapter;->setBeamPushUris([Landroid/net/Uri;Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PhotoPageFragment"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager$NfcUpdateTask;->mUpdateItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
