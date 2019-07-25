.class final Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "PeopleRelationSetDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->createRelationSetDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$listener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;->val$listener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;

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
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;->val$activity:Landroid/app/Activity;

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;->val$listener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->access$200(Landroid/app/Activity;Landroid/os/Bundle;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method
