.class Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$2;
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

    iput-object p1, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$2;->this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "cloud_guide_source"

    sget-object v1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SEARCH:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    iget-object v0, p0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter$2;->this$0:Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    iget-object v0, v0, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method
