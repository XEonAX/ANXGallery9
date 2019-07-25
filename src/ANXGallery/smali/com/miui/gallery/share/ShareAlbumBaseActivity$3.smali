.class Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;
.super Ljava/lang/Object;
.source "ShareAlbumBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/ShareAlbumBaseActivity;->syncFromServer()V
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
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;->onCompletion(Ljava/lang/Void;Ljava/lang/Void;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Ljava/lang/Void;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->onUpdateProgressChanged(I)V

    return-void
.end method
