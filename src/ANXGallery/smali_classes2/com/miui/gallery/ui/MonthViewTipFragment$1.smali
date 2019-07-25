.class Lcom/miui/gallery/ui/MonthViewTipFragment$1;
.super Ljava/lang/Object;
.source "MonthViewTipFragment.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/MonthViewTipFragment;->initPlayer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/MonthViewTipFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/MonthViewTipFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthViewTipFragment$1;->this$0:Lcom/miui/gallery/ui/MonthViewTipFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/MonthViewTipFragment$1;->this$0:Lcom/miui/gallery/ui/MonthViewTipFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthViewTipFragment;->access$000(Lcom/miui/gallery/ui/MonthViewTipFragment;)Landroid/widget/VideoView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/VideoView;->start()V

    return-void
.end method
