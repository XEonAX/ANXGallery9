.class Lcom/miui/gallery/ui/FacePageFragment$12;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "FacePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->refreshFaceNameIfNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/FacePageFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$300(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$302(Lcom/miui/gallery/ui/FacePageFragment;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$2300(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090119

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const v1, 0x7f10039d

    :goto_0
    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const v1, 0x7f10039c

    goto :goto_0

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$2400(Lcom/miui/gallery/ui/FacePageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$12;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1800(Lcom/miui/gallery/ui/FacePageFragment;)V

    return-void
.end method
