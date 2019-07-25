.class public Lcom/miui/gallery/hybrid/hybridclient/wrapper/DownloadListenerWrapper;
.super Ljava/lang/Object;
.source "DownloadListenerWrapper.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/DownloadListener;"
    }
.end annotation


# instance fields
.field protected downloadListener:Landroid/webkit/DownloadListener;


# direct methods
.method public constructor <init>(Landroid/webkit/DownloadListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/DownloadListenerWrapper;->downloadListener:Landroid/webkit/DownloadListener;

    return-void
.end method


# virtual methods
.method public getWrapped()Landroid/webkit/DownloadListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/DownloadListenerWrapper;->downloadListener:Landroid/webkit/DownloadListener;

    return-object v0
.end method

.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/DownloadListenerWrapper;->downloadListener:Landroid/webkit/DownloadListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/DownloadListenerWrapper;->downloadListener:Landroid/webkit/DownloadListener;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide v6, p5

    invoke-interface/range {v1 .. v7}, Landroid/webkit/DownloadListener;->onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    :cond_0
    return-void
.end method
