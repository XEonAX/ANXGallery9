.class Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;
.super Ljava/lang/Object;
.source "AlbumShareInvitationReceiver.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;->onCompletion(Ljava/lang/Void;Ljava/lang/Long;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
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
.field final synthetic this$0:Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;

.field final synthetic val$path:Lcom/miui/gallery/share/Path;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;Lcom/miui/gallery/share/Path;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;->this$0:Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;->val$path:Lcom/miui/gallery/share/Path;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Lcom/miui/gallery/share/Path;Ljava/lang/Void;IZ)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;->this$0:Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;->access$200(Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;)Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;->val$path:Lcom/miui/gallery/share/Path;

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0, p3, p4}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    const-string p1, "AlbumShareInvitationReceiver"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "updateShareUrlLongAuto: error code="

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/share/Path;

    check-cast p2, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener$1;->onCompletion(Lcom/miui/gallery/share/Path;Ljava/lang/Void;IZ)V

    return-void
.end method
