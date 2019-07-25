.class Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "GalleryHybridFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/GalleryHybridFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GalleryHybridChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1300(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p2

    if-nez p2, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onJsAlert: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1400(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p1, 0x104000a

    new-instance p3, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$4;

    invoke-direct {p3, p0, p4}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$4;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance p1, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$5;

    invoke-direct {p1, p0, p4}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$5;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    const/4 p1, 0x1

    return p1
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1100(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p2

    if-nez p2, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onJsConfirm: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1200(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p1, 0x104000a

    new-instance p3, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$1;

    invoke-direct {p3, p0, p4}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$1;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/high16 p1, 0x1040000

    new-instance p3, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;

    invoke-direct {p3, p0, p4}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$2;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance p1, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$3;

    invoke-direct {p1, p0, p4}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient$3;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    const/4 p1, 0x1

    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const/4 p2, 0x0

    if-nez p1, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p3, "onJsPrompt: already detached, do nothing"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p2

    :cond_0
    const-string p1, "MiuiGallery-finish-queuing"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1600(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const/4 p2, -0x1

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/activity/BaseActivity;->setResult(ILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    invoke-virtual {p5}, Landroid/webkit/JsPromptResult;->confirm()V

    const/4 p1, 0x1

    return p1

    :cond_1
    return p2
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3

    const-string v0, "GalleryHybridFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onProgressChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1800(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onProgressChanged: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->getProgress()I

    move-result p1

    sub-int p1, p2, p1

    if-lez p1, :cond_1

    if-ltz p2, :cond_1

    const/16 p1, 0x64

    if-gt p2, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->setProgress(I)V

    :cond_1
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$900(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onReceivedTitle: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$1000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;->onReceivedTitle(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
