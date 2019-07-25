.class Lcom/miui/gallery/ui/AlbumPageFragment$2;
.super Ljava/lang/Object;
.source "AlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTriggerOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$400(Lcom/miui/gallery/ui/AlbumPageFragment;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$500(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$402(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Z

    const-string p1, "album"

    const-string v0, "enter_privacy_mode"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onTriggerSlide(Lcom/miui/gallery/widget/TwoStageDrawer;F)V
    .locals 0

    return-void
.end method
