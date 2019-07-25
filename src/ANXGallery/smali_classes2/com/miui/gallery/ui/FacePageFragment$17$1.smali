.class Lcom/miui/gallery/ui/FacePageFragment$17$1;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment$17;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/FacePageFragment$17;

.field final synthetic val$ids:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment$17;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$17$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$17;

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$17$1;->val$ids:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$17$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$17$1;->val$ids:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeIgnorePeopleByIds(Ljava/util/ArrayList;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$17$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$17;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$17;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    const/4 p1, 0x0

    return-object p1
.end method
