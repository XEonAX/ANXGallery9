.class Lcom/miui/gallery/share/PublicShareUiHandler$2;
.super Ljava/lang/Object;
.source "PublicShareUiHandler.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/PublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/PublicShareUiHandler;

.field final synthetic val$publicUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/PublicShareUiHandler;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/PublicShareUiHandler$2;->this$0:Lcom/miui/gallery/share/PublicShareUiHandler;

    iput-object p2, p0, Lcom/miui/gallery/share/PublicShareUiHandler$2;->val$publicUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 1

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler$2;->val$publicUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/share/PublicShareUiHandler$2;->this$0:Lcom/miui/gallery/share/PublicShareUiHandler;

    iget-object v0, v0, Lcom/miui/gallery/share/PublicShareUiHandler;->mActivity:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 p1, 0x0

    return p1
.end method
