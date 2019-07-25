.class Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;
.super Ljava/lang/Object;
.source "GalleryHybridFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;

.field final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;->this$1:Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;->val$result:Landroid/webkit/JsResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {p1}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method
