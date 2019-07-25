.class Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;
.super Ljava/lang/Object;
.source "OwnerBabyAlbumSettingActivity.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->setCoverFaceAndBirthdayForCreateBaby()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->access$100(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object p1, p1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/provider/FaceManager;->queryTimeOfOldestImagesOfOnePerson(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getCurrentYearMonthDay(J)[I

    move-result-object p1

    const/4 v0, 0x0

    aget v0, p1, v0

    const/4 v1, 0x1

    aget v1, p1, v1

    const/4 v2, 0x2

    aget p1, p1, v2

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->combine2Birthday(III)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getBirthYearMonthDay(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object p1, p1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3$1;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p1, 0x0

    return-object p1
.end method
