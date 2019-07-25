.class Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$1;
.super Ljava/lang/Object;
.source "VideoNavFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;->initListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;->doApply()Z

    return-void
.end method
