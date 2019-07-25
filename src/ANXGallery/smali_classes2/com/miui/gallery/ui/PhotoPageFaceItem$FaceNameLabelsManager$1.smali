.class Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFaceItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->bindViewAndData(Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

.field final synthetic val$face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

.field final synthetic val$item:Lcom/miui/gallery/model/CloudItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/CloudItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->val$face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->val$item:Lcom/miui/gallery/model/CloudItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->val$face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->peopleName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    const v1, 0x7f090117

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->val$item:Lcom/miui/gallery/model/CloudItem;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->access$700(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;->val$face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->renameFace(Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V

    :cond_1
    :goto_0
    return-void
.end method
