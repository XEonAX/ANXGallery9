.class Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;
.super Ljava/lang/Object;
.source "ShareAlbumOwnerBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->addSharer(ILcom/miui/gallery/share/CloudUserCacheEntry;)V
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
        "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

.field final synthetic val$which:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iput p2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->val$which:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->onCompletion(Ljava/lang/Void;Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;IZ)V
    .locals 1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget-object p2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    const p3, 0x7f1000d8

    invoke-virtual {p2, p3}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/share/UIHelper;->toast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    if-nez p3, :cond_1

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->getInstance()Lcom/miui/gallery/share/PhoneShareAlbumProvider;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget p4, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->val$which:I

    iget-object v0, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget-object v0, v0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p1, p3, p4, p2, v0}, Lcom/miui/gallery/share/PhoneShareAlbumProvider;->shareOperation(Landroid/app/Activity;ILcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget-object p2, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$3;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    const p3, 0x7f1003a0

    invoke-virtual {p2, p3}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/share/UIHelper;->toast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method
