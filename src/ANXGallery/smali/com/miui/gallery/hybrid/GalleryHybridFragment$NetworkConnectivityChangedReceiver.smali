.class Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GalleryHybridFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/GalleryHybridFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkConnectivityChangedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$2000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Z

    move-result p2

    if-nez p2, :cond_0

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$2100(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$2002(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Z)Z

    return-void
.end method
