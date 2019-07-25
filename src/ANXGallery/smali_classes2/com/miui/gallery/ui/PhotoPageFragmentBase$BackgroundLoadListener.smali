.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackgroundLoadListener"
.end annotation


# instance fields
.field private mCallbackRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onLoadComplete(Lcom/miui/gallery/loader/BaseLoader;Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;->mCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V

    :cond_0
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/BaseLoader;->setBackgroundLoadListener(Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;)V

    return-void
.end method
