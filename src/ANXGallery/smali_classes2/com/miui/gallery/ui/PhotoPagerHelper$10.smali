.class Lcom/miui/gallery/ui/PhotoPagerHelper$10;
.super Ljava/lang/Object;
.source "PhotoPagerHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPagerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPagerHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPagerHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPagerHelper$10;->this$0:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageLoadFinish(ZLjava/lang/String;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPagerHelper$10;->this$0:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->access$600(Lcom/miui/gallery/ui/PhotoPagerHelper;)Lcom/miui/gallery/ui/PhotoPagerHelper$OnImageLoadFinishListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPagerHelper$10;->this$0:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->access$600(Lcom/miui/gallery/ui/PhotoPagerHelper;)Lcom/miui/gallery/ui/PhotoPagerHelper$OnImageLoadFinishListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/PhotoPagerHelper$OnImageLoadFinishListener;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
