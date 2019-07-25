.class public abstract Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;
.super Landroid/os/Binder;
.source "INexAssetService.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/service/INexAssetService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/service/INexAssetService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub$a;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.service.INexAssetService"

.field static final TRANSACTION_connectInstaller:I = 0x1

.field static final TRANSACTION_loadInstalledAssetList:I = 0x4

.field static final TRANSACTION_saveAssetInfoData:I = 0x5

.field static final TRANSACTION_sendAssetData:I = 0x2

.field static final TRANSACTION_uninstallAsset:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p0, p0, v0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetService;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub$a;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub$a;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const v0, 0x5f4e5446

    const/4 v1, 0x1

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    :pswitch_0
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->saveAssetInfoData(IILjava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :pswitch_1
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->loadInstalledAssetList(Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :pswitch_2
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->uninstallAsset(ILcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :pswitch_3
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;

    move-result-object v8

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->sendAssetData(ILjava/lang/String;IJLcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :pswitch_4
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;->connectInstaller(ILjava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :cond_0
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetService"

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
