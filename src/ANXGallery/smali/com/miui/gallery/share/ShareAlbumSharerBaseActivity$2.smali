.class final Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;
.super Ljava/lang/Object;
.source "ShareAlbumSharerBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->exitShare(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "Lcom/miui/gallery/share/Path;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$albumName:Ljava/lang/String;

.field final synthetic val$runOnExitShareSuccessfully:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$albumName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$runOnExitShareSuccessfully:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Lcom/miui/gallery/share/Path;Ljava/lang/Void;IZ)V
    .locals 5

    if-eqz p4, :cond_0

    const p1, 0x7f1000d8

    invoke-static {p1}, Lcom/miui/gallery/share/UIHelper;->toast(I)V

    return-void

    :cond_0
    const p1, 0x7f1005bc

    const/4 p2, 0x0

    const/4 p4, 0x1

    if-nez p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    const v1, 0x7f10037f

    new-array v2, p4, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    new-array p4, p4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$albumName:Ljava/lang/String;

    aput-object v4, p4, p2

    invoke-virtual {v3, p1, p4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/miui/gallery/share/UIHelper;->toast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$runOnExitShareSuccessfully:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    const v1, 0x7f10037d

    new-array v2, p4, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$activity:Landroid/app/Activity;

    new-array p4, p4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->val$albumName:Ljava/lang/String;

    aput-object v4, p4, p2

    invoke-virtual {v3, p1, p4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/miui/gallery/share/UIHelper;->toast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/share/Path;

    check-cast p2, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity$2;->onCompletion(Lcom/miui/gallery/share/Path;Ljava/lang/Void;IZ)V

    return-void
.end method
