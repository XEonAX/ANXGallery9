.class Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;
.super Ljava/lang/Object;
.source "nexOverlayManager.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->parseOverlay(Ljava/lang/String;Ljava/util/List;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;->b:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;->a:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnTitleInfoListener(ILjava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;II)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;->a:Ljava/util/List;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p5, p6, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;-><init>(IILjava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;)V

    invoke-virtual {v0, p4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->setText(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->setFontID(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->setFontSize(I)V

    invoke-virtual {v0, p7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->setGroup(Ljava/lang/String;)V

    invoke-virtual {v0, p8, p9}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->setOverlayResolution(II)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;->a:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method
