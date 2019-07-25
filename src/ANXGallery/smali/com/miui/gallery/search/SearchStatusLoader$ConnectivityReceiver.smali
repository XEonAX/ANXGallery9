.class Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SearchStatusLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/SearchStatusLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectivityReceiver"
.end annotation


# instance fields
.field private mLastConnected:Ljava/lang/Boolean;

.field final synthetic this$0:Lcom/miui/gallery/search/SearchStatusLoader;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/search/SearchStatusLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/SearchStatusLoader;Lcom/miui/gallery/search/SearchStatusLoader$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;-><init>(Lcom/miui/gallery/search/SearchStatusLoader;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string p1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    const-string p2, "SearchStatusLoader"

    const-string v0, "mLastConnected: %b, noConn: %b"

    iget-object v1, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->mLastConnected:Ljava/lang/Boolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p2, v0, v1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->mLastConnected:Ljava/lang/Boolean;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->mLastConnected:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-eq p2, v0, :cond_2

    :cond_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->mLastConnected:Ljava/lang/Boolean;

    iget-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchStatusLoader;->onContentChanged()V

    :cond_2
    return-void
.end method
