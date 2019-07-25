.class public Lcom/miui/gallery/pendingtask/PendingTaskFactory;
.super Ljava/lang/Object;
.source "PendingTaskFactory.java"


# direct methods
.method public static create(I)Lcom/miui/gallery/pendingtask/base/PendingTask;
    .locals 1

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    return-object v0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumChargingTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumChargingTask;-><init>(I)V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/miui/gallery/assistant/process/ExistImageFeatureChargingTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureChargingTask;-><init>(I)V

    return-object v0

    :pswitch_3
    new-instance v0, Lcom/miui/gallery/assistant/library/DeleteLibraryTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/library/DeleteLibraryTask;-><init>(I)V

    return-object v0

    :pswitch_4
    new-instance v0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;-><init>(I)V

    return-object v0

    :pswitch_5
    new-instance v0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;-><init>(I)V

    return-object v0

    :pswitch_6
    new-instance v0, Lcom/miui/gallery/discovery/PrintSilentInstallTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;-><init>(I)V

    return-object v0

    :pswitch_7
    new-instance v0, Lcom/miui/gallery/cloudcontrol/CloudControlPendingTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlPendingTask;-><init>(I)V

    return-object v0

    :pswitch_8
    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;-><init>(I)V

    return-object v0

    :pswitch_9
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
