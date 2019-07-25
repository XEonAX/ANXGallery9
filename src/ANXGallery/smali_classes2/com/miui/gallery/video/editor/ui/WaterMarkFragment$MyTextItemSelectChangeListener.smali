.class Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;
.super Ljava/lang/Object;
.source "WaterMarkFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyTextItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$600(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$700(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->getTextStyle(I)Lcom/miui/gallery/video/editor/TextStyle;

    move-result-object p1

    if-eqz p1, :cond_8

    if-nez p3, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->isLocal()Z

    move-result p3

    if-nez p3, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->isNone()Z

    move-result p3

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$800(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;I)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, v1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$902(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Z)Z

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/TextStyle;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1002(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1102(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const-string p3, ""

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)I

    move-result v0

    invoke-virtual {p1, p3, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)I

    move-result p3

    const-string v0, ""

    invoke-virtual {p1, p3, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p3, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener$1;

    invoke-direct {p3, p0, p2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener$1;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;I)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->isExtra()Z

    move-result p3

    if-eqz p3, :cond_4

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, v1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$902(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Z)Z

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->isDownloaded()Z

    move-result p3

    if-eqz p3, :cond_3

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$800(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;I)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/TextStyle;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1002(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1102(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const-string v0, ""

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)I

    move-result v1

    invoke-virtual {p3, v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->getTemplateId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p3, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener$2;

    invoke-direct {p3, p0, p2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener$2;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;I)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1

    :cond_3
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    invoke-interface {p3, p1, p2}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;->downloadResourceWithCheck(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1502(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->isLocal()Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/TextStyle;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1002(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1102(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1600(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$900(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1700(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1800(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z

    goto :goto_0

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1900(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$2000(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->pause()V

    goto :goto_0

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1900(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$2000(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->pause()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$1400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    :cond_7
    :goto_1
    return v1

    :cond_8
    :goto_2
    return v1
.end method
