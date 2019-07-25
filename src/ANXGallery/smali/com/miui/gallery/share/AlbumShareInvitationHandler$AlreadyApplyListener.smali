.class Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;
.super Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;
.source "AlbumShareInvitationHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareInvitationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AlreadyApplyListener"
.end annotation


# instance fields
.field private final mPath:Lcom/miui/gallery/share/Path;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Z)V
    .locals 0

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;-><init>(Landroid/app/Activity;Z)V

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->mPath:Lcom/miui/gallery/share/Path;

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->removeNotification()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->tryToFinishActivity()V

    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->removeNotification()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->tryToFinishActivity()V

    const/4 p1, -0x1

    if-eq p2, p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;->mPath:Lcom/miui/gallery/share/Path;

    invoke-static {p1, p2}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->access$000(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V

    :cond_1
    :goto_0
    return-void
.end method
