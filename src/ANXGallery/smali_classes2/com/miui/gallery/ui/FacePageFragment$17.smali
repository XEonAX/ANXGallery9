.class Lcom/miui/gallery/ui/FacePageFragment$17;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->shoeIgnoreAlert()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$17;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$17;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$500(Lcom/miui/gallery/ui/FacePageFragment;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$17$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$17$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment$17;Ljava/util/ArrayList;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
