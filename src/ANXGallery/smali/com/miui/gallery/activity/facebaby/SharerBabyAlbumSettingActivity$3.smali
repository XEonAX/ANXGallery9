.class Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "SharerBabyAlbumSettingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->refreshSelfRelationText(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

.field final synthetic val$needSyncIfEmpty:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iput-boolean p2, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->val$needSyncIfEmpty:Z

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->val$needSyncIfEmpty:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->access$200(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->access$300(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->access$302(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast v0, Lmiui/preference/ValuePreference;

    invoke-virtual {v0, p1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$3;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->access$402(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
