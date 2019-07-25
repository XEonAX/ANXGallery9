.class Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;
.super Landroid/database/ContentObserver;
.source "ShareAlbumOwnerBaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CloudObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    iget-object p1, p1, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->rereloadItem()V

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity$CloudObserver;->this$0:Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateStatus()V

    return-void
.end method
