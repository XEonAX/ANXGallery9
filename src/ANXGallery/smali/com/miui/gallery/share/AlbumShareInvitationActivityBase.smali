.class public Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;
.super Landroid/app/Activity;
.source "AlbumShareInvitationActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/AlbumShareInvitationActivityBase$OnBlockMessageCancelled;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, 0x106000d

    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    return-void
.end method
