.class Lcom/miui/gallery/ui/FacePageFragment$9;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->refreshFaceCover()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$9;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Boolean;
    .locals 5

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment$9;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/FacePageFragment;->access$1900(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOnePerson(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/ui/FacePageFragment$9;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$2000(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$9;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0, v3}, Lcom/miui/gallery/ui/FacePageFragment;->access$2002(Lcom/miui/gallery/ui/FacePageFragment;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$9;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    aget-object p1, v2, p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$2102(Lcom/miui/gallery/ui/FacePageFragment;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$9;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
