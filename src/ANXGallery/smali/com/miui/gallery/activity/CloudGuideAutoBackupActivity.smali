.class public Lcom/miui/gallery/activity/CloudGuideAutoBackupActivity;
.super Lmiui/app/Activity;
.source "CloudGuideAutoBackupActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lmiui/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b004a

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/CloudGuideAutoBackupActivity;->setContentView(I)V

    return-void
.end method
