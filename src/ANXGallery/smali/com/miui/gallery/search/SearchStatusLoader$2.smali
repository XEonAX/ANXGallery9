.class Lcom/miui/gallery/search/SearchStatusLoader$2;
.super Landroid/content/BroadcastReceiver;
.source "SearchStatusLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/SearchStatusLoader;->onStartLoading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/SearchStatusLoader;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/SearchStatusLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$2;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "com.miui.gallery.action.FIRST_SYNC_FINISHED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$2;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchStatusLoader;->onContentChanged()V

    :cond_1
    return-void
.end method
