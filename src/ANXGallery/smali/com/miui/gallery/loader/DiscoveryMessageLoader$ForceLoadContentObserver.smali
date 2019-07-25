.class public final Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;
.super Landroid/database/ContentObserver;
.source "DiscoveryMessageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/DiscoveryMessageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ForceLoadContentObserver"
.end annotation


# instance fields
.field private mLoaderRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/loader/DiscoveryMessageLoader;",
            ">;"
        }
    .end annotation
.end field

.field private mMessageTypeMask:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/loader/DiscoveryMessageLoader;I)V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    iput p2, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->mMessageTypeMask:I

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->mLoaderRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public getMessageTypeMask()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->mMessageTypeMask:I

    return v0
.end method

.method public onChange(Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->mLoaderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->mLoaderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/loader/DiscoveryMessageLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->onContentChanged()V

    :cond_0
    return-void
.end method
