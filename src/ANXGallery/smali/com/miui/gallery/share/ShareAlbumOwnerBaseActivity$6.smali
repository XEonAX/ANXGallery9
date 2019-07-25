.class Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;
.super Ljava/lang/Object;
.source "ShareAlbumOwnerBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->tryToCreateCloudItem()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;->onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-static {p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->access$300(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;->onChange(Z)V

    new-instance p1, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6$1;-><init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;)V

    iget-object p3, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$6;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget-object p3, p3, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p3}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getPath()Lcom/miui/gallery/share/Path;

    move-result-object p3

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->doAfterCloudMediaSetSetReload(Ljava/lang/Runnable;Lcom/miui/gallery/share/Path;Z)V

    return-void
.end method
