.class Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;
.super Ljava/lang/Object;
.source "BabyAlbumSettingActivityBase.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;->this$0:Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;->this$0:Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;->this$0:Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntentToAutoUploadPage()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->startActivityForResult(Landroid/content/Intent;I)V

    return v1
.end method
