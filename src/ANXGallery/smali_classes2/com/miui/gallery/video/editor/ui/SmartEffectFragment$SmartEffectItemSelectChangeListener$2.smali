.class Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;
.super Ljava/lang/Object;
.source "SmartEffectFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->onItemSelect(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;->this$1:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;->this$1:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->play()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;->this$1:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->recordEventWithEffectChanged()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener$2;->this$1:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment$SmartEffectItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;->updatePalyBtnView()V

    return-void
.end method
