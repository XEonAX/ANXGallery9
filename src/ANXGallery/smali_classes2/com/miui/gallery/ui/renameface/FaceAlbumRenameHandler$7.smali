.class Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;
.super Ljava/lang/Object;
.source "FaceAlbumRenameHandler.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->rename(Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V
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
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

.field final synthetic val$contact:Lcom/miui/gallery/model/PeopleContactInfo;

.field final synthetic val$newName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->val$newName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->val$contact:Lcom/miui/gallery/model/PeopleContactInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object p1, p1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object p1, p1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->access$500(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    :goto_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v0, v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->val$newName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->val$contact:Lcom/miui/gallery/model/PeopleContactInfo;

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->rename(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)Z

    move-result v0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->access$600(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->access$600(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;->val$newName:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;->onConfirm(Ljava/lang/String;Z)V

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
