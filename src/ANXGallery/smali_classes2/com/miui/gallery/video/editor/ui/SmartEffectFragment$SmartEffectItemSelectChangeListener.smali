.class Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;
.super Ljava/lang/Object;
.source "SmartEffectFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SmartEffectItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$500(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    if-nez p3, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$600(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    move-result-object p3

    invoke-static {p3, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    check-cast p1, Lcom/miui/gallery/video/editor/adapter/SmartEffectRecyclerViewAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/adapter/SmartEffectRecyclerViewAdapter;->getSmartEffect(I)Lcom/miui/gallery/video/editor/SmartEffect;

    move-result-object p1

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isNone()Z

    move-result p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$700(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->setSmartEffectTemplate(Lcom/miui/gallery/video/editor/SmartEffect;)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$1;-><init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isExtra()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isDownloaded()Z

    move-result p3

    if-eqz p3, :cond_7

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p3

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/Toast;->cancel()V

    :cond_2
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-virtual {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f060559

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$900(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->getShortTime()I

    move-result v2

    const/16 v3, 0x50

    if-ge v0, v2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mContext:Landroid/content/Context;

    const v0, 0x7f100762

    invoke-static {p2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$802(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Landroid/widget/Toast;)Landroid/widget/Toast;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$1000(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    sub-int/2addr p2, p3

    invoke-virtual {p1, v3, v1, p2}, Landroid/widget/Toast;->setGravity(III)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return v1

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isHasSpeedChange()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->isHighFrames()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, v2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mContext:Landroid/content/Context;

    const v4, 0x7f10075b

    invoke-static {v2, v4, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$802(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Landroid/widget/Toast;)Landroid/widget/Toast;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$1000(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, p3

    invoke-virtual {v0, v3, v1, v2}, Landroid/widget/Toast;->setGravity(III)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$900(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->getLongTime()I

    move-result v2

    if-le v0, v2, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isLimitSixtySeconds()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, v2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mContext:Landroid/content/Context;

    const v4, 0x7f100763

    invoke-static {v2, v4, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$802(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Landroid/widget/Toast;)Landroid/widget/Toast;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$1000(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, p3

    invoke-virtual {v0, v3, v1, v2}, Landroid/widget/Toast;->setGravity(III)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$900(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->getLongTime()I

    move-result v2

    if-le v0, v2, :cond_6

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/SmartEffect;->isLimitFourtySeconds()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v2, v2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mContext:Landroid/content/Context;

    const v4, 0x7f100761

    invoke-static {v2, v4, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$802(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Landroid/widget/Toast;)Landroid/widget/Toast;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$1000(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, p3

    invoke-virtual {v0, v3, v1, v2}, Landroid/widget/Toast;->setGravity(III)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$800(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;)Landroid/widget/Toast;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/Toast;->show()V

    :cond_6
    :goto_0
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$700(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->setSmartEffectTemplate(Lcom/miui/gallery/video/editor/SmartEffect;)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p2, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;-><init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1

    :cond_7
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    invoke-interface {p3, p1, p2}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;->downloadResourceWithCheck(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->access$1102(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;Lcom/miui/gallery/video/editor/SmartEffect;)Lcom/miui/gallery/video/editor/SmartEffect;

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v1
.end method
