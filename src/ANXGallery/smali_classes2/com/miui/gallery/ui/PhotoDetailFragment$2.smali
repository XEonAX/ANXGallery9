.class Lcom/miui/gallery/ui/PhotoDetailFragment$2;
.super Ljava/lang/Object;
.source "PhotoDetailFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoDetailFragment;->requestAddress(DD)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Landroid/location/Address;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

.field final synthetic val$latitude:D

.field final synthetic val$longitude:D


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoDetailFragment;DD)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iput-wide p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->val$latitude:D

    iput-wide p4, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->val$longitude:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Landroid/location/Address;
    .locals 7

    new-instance v0, Lcom/miui/gallery/data/ReverseGeocoder;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->this$0:Lcom/miui/gallery/ui/PhotoDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/data/ReverseGeocoder;-><init>(Landroid/content/Context;)V

    iget-wide v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->val$latitude:D

    iget-wide v3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->val$longitude:D

    const/4 v5, 0x1

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/data/ReverseGeocoder;->lookupAddress(DDZLcom/miui/gallery/threadpool/ThreadPool$JobContext;)Landroid/location/Address;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment$2;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Landroid/location/Address;

    move-result-object p1

    return-object p1
.end method
