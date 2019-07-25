.class Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;
.super Ljava/lang/Object;
.source "AlbumShareInvitationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareInvitationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AbsListener"
.end annotation


# instance fields
.field protected final mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field protected final mFinishActivity:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;->mActivityRef:Ljava/lang/ref/WeakReference;

    iput-boolean p2, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;->mFinishActivity:Z

    return-void
.end method

.method protected static removeNotification()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method


# virtual methods
.method protected tryToFinishActivity()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;->mFinishActivity:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method
