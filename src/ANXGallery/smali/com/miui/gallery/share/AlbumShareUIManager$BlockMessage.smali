.class public final Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareUIManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BlockMessage"
.end annotation


# instance fields
.field final mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field final mCancelable:Z

.field final mListener:Landroid/content/DialogInterface$OnCancelListener;

.field final mMessage:Ljava/lang/CharSequence;

.field final mTitle:Ljava/lang/CharSequence;


# direct methods
.method private constructor <init>(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mActivityRef:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mTitle:Ljava/lang/CharSequence;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mMessage:Ljava/lang/CharSequence;

    iput-boolean p4, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mCancelable:Z

    iput-object p5, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "context cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;
    .locals 7

    new-instance v6, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;-><init>(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)V

    return-object v6
.end method


# virtual methods
.method public buildDialog()Lmiui/app/ProgressDialog;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lmiui/app/ProgressDialog;

    invoke-direct {v1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-boolean v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mCancelable:Z

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setCancelable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->mListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {v1, v0}, Lmiui/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-object v1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method
