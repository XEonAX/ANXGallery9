.class final Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareUIManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FutureCancelledListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "TK;TT;>;"
    }
.end annotation


# instance fields
.field public final mDialog:Landroid/app/Dialog;

.field public final mListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "TK;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "TK;TT;>;",
            "Landroid/app/Dialog;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;->mListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;->mDialog:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TT;IZ)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;->mListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;->mListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_0
    return-void
.end method
