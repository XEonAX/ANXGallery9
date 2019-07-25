.class public Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "InputFaceNameActivity.java"


# instance fields
.field mFragment:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private getOptionalPermissions()[Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_CONTACTS"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->getRuntimePermissions()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->getOptionalPermissions()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StringUtils;->mergeStringArray([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isPermissionRequired(Ljava/lang/String;)Z
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->getOptionalPermissions()[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    invoke-static {v4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->mFragment:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->onBackPressed()V

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b009d

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f09017d

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->mFragment:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    return-void
.end method

.method public onPermissionsChecked([Ljava/lang/String;[I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/activity/BaseActivity;->onPermissionsChecked([Ljava/lang/String;[I)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->mFragment:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;->mFragment:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->updateNameList()V

    :cond_0
    return-void
.end method
