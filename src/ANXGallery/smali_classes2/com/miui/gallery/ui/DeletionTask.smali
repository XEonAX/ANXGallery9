.class public Lcom/miui/gallery/ui/DeletionTask;
.super Lcom/miui/gallery/ui/ProcessTask;
.source "DeletionTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/DeletionTask$Param;,
        Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/ProcessTask<",
        "Lcom/miui/gallery/ui/DeletionTask$Param;",
        "[J>;"
    }
.end annotation


# instance fields
.field private mRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/DeletionTask$1;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DeletionTask$1;-><init>()V

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/DeletionTask;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/DeletionTask;->mRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method


# virtual methods
.method public setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/DeletionTask$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/DeletionTask$2;-><init>(Lcom/miui/gallery/ui/DeletionTask;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/DeletionTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/ui/DeletionTask$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/DeletionTask$3;-><init>(Lcom/miui/gallery/ui/DeletionTask;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeletionTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    :goto_0
    return-void
.end method

.method public showProgress(Landroid/app/Activity;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/DeletionTask;->mRef:Ljava/lang/ref/WeakReference;

    const v0, 0x7f100300

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
