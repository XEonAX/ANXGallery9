.class Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;
.super Ljava/lang/Object;
.source "OwnerBabyAlbumSettingActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object p1, p1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    const v1, 0x7f100394

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    const v1, 0x7f100433

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    new-instance v1, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v2, v2, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFaceAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v4, v4, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v5, v5, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;

    invoke-static {v3}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->access$000(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, p1, v1, v2, v3}, Lcom/miui/gallery/util/baby/FindFace2CreateBabyAlbum;->createBabyAlbumAndSaveBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
