.class public Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebChromeClientWrapper;
.super Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;
.source "GalleryHybridClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GalleryWebChromeClientWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Landroid/webkit/WebChromeClient;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebChromeClientWrapper;->this$0:Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;

    invoke-direct {p0, p2}, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;-><init>(Landroid/webkit/WebChromeClient;)V

    return-void
.end method
