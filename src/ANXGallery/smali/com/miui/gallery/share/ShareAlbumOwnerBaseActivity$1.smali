.class Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;
.super Ljava/lang/Object;
.source "ShareAlbumOwnerBaseActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-static {p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->access$000(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;)V

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$1;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateStatus()V

    return-void
.end method
