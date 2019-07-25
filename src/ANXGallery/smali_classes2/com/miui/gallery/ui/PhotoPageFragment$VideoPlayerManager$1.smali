.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getEnterDrawableId()I
    .locals 1

    const v0, 0x7f070267

    return v0
.end method

.method public getEnterTextId()I
    .locals 1

    const v0, 0x7f10068e

    return v0
.end method

.method public onEnterClick(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$7800(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;I)V

    return-void
.end method

.method public onRecognized(Lcom/miui/gallery/model/BaseDataItem;Z)V
    .locals 0

    return-void
.end method
