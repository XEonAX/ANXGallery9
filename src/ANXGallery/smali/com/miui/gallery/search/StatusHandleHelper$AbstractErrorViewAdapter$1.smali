.class Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;
.super Ljava/lang/Object;
.source "StatusHandleHelper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->bindFixActionForStatus(ILandroid/view/View;Lcom/miui/gallery/search/StatusHandleHelper$InfoViewPosition;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;->this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;->this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    iget-object p1, p1, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setLocalSearchStatus(Landroid/content/Context;Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$1;->this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->requestRetry()V

    const-string p1, "search"

    const-string v0, "search_open_switch"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
